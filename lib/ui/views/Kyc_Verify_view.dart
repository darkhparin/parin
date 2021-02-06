import 'dart:ui';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cwl/models/application/index.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/Kyc_Verify_View_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:url_launcher/url_launcher.dart';

class KycverifyedViewView extends StatefulWidget {
  @override
  _KycverifyedViewViewState createState() => _KycverifyedViewViewState();
}

Map<String, String> selectedValueMap = Map();

class _KycverifyedViewViewState extends State<KycverifyedViewView> {
  final gstNoController = TextEditingController();
  final contactPersonController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final officenumberController = TextEditingController();
  final addressController = TextEditingController();
  final partyPincodeController = TextEditingController();
  final productTypeAutoFillController = TextEditingController();

  final GlobalKey autocmptkeyProductName =
      new GlobalKey<AutoCompleteTextFieldState<Commonmodel>>();

  bool isChecked = false;
  AutoCompleteTextField _productTypeAutoFill;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<KycverifyedViewModel>.withConsumer(
      viewModelBuilder: () => KycverifyedViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //   color: Colors.black,
          //   onPressed: () => Navigator.of(context).pop(),
          //   icon: Icon(Icons.arrow_back, color: Colors.orange),
          // ),
          title: Text(
            'Verify Customer KYC',
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GuestView(),
                  )),
            ),
          ],
        ),
        // drawer: AppDrawer(model.appVersion),
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              model.busy ? showLoading() : getPartys(context, model),
              model.partyContect.gstin == null
                  ? renderNodata()
                  : partyDetailsEdit(model),
              // model.busy ? showLoading() : branchTripListNew(context, model),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderNodata() {
    return Container();
  }

  Widget showLoading() {
    return Center(
      heightFactor: 5,
      child: LoadingWidget(),
    );
  }

  Widget getPartys(context, KycverifyedViewModel model) {
    return Container(
      decoration: BoxDecoration(
          //  color: Colors.lightBlue[50],
          ),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 50,
      child: new DropdownButton<Commonmodel>(
        value: model.partyLatestList1,
        hint: Text(' Select Customer (Party) '),
        isExpanded: true,
        style: TextStyle(color: Colors.deepPurple),
        items: model.partyLatestList
            .map<DropdownMenuItem<Commonmodel>>((Commonmodel value) {
          return DropdownMenuItem<Commonmodel>(
            value: value,
            child: Row(
              children: [
                // FlatButton(
                //     child: Text(
                //       "Reject",
                //       style: TextStyle(color: Colors.red),
                //     ),
                //     onPressed: () {}),
                new GestureDetector(
                  onTap: () {
                    model.setpartyLatestListReject(value);
                  },
                  child: new Text(
                    "Reject - ",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '${value.name}',
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (Commonmodel value) {
          model.setPartyList(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget partyDetailsEdit(KycverifyedViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(""" ${model.partyLatestList1.name}"""),
          Row(
            children: [
              Text(
                'Branch: ${model.partyContect.branch}-${model.partyContect.branchPincode}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(11),
                  placeholder:
                      'GST: ${model.partyContect.gstin == null ? 'Enter GST NO' : model.partyContect.gstin}',
                  controller: gstNoController,
                  isReadOnly: model.partyContect.gstin != null ? true : false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {},
                  // validationMessage: model.errordocketno,
                ),
              ),
            ],
          ),
          // verticalSpaceTiny,
          // Text('Contact Person Name'),
          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  placeholder: '${model.partyContect.contactPerson}',
                  controller: contactPersonController,
                  textInputType: TextInputType.text,
                  isReadOnly: true,
                  onChanged: (value) {},
                  validationMessage:
                      '${model.partyContect.contactPerson == null ? 'Enter ContactPerson Name' : ''}',
                ),
              ),
            ],
          ),
          // verticalSpaceTiny,
          Text(
            'Email: If Send Mail Notification please Check ->',
            style: TextStyle(fontSize: 13),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  placeholder:
                      '${model.partyContect.emailId == null ? 'Enter Email ID' : model.partyContect.emailId}',
                  controller: emailController,
                  // initialValue: '${model.email}',
                  isReadOnly: true,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  // onChanged: (text) {},
                  validationMessage:
                      '${model.partyContect.emailId == null ? emailController.text.length < 10 ? '* Enter Email ID ' : '' : ''}',
                ),
              ),
              Text('Notification'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Checkbox(
                  value: model.partyContect.hasEmailAlert,
                  onChanged: (value) {
                    setState(() {
                      model.partyContect.hasEmailAlert = value;
                    });
                  },
                ),
              ),
            ],
          ),
          // verticalSpaceTiny,
          Text(
            '   Call      Mobile: If Send SMS Notification please Check ->',
            style: TextStyle(fontSize: 13),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: IconButton(
                  icon: new Icon(
                    Icons.add_call,
                    color: Colors.blue,
                    size: 29,
                  ),
                  onPressed: () async {
                    var url = 'tel:${model.partyContect.mobileNo}';
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(10),
                  placeholder: '${model.partyContect.mobileNo}',
                  controller: mobileController,
                  //initialValue: '${model.partyContect.mobileNo}',
                  isReadOnly: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  // onChanged: (text) {},
                  validationMessage:
                      '${model.partyContect.mobileNo == null ? mobileController.text.length < 10 ? '* Enter Mobile Number ' : '' : ''}',
                ),
              ),
              Text('Notification'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Checkbox(
                  value: model.partyContect.hasSmsAlert,
                  onChanged: (value) {
                    setState(() {
                      model.partyContect.hasSmsAlert = value;
                    });
                  },
                ),
              ),
            ],
          ),
          // verticalSpaceSmall,
          Text('   Call      Office Number'),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: IconButton(
                  icon: new Icon(
                    Icons.add_call,
                    color: Colors.blue,
                    size: 29,
                  ),
                  onPressed: () async {
                    var url = 'tel:${model.partyContect.officeNo}';
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(11),
                  placeholder:
                      '${model.partyContect.officeNo == null ? 'Enter Office Number' : model.partyContect.officeNo}',
                  controller: officenumberController,
                  textInputType: TextInputType.number,
                  isReadOnly: true,
                  onChanged: (text) {},
                  validationMessage:
                      '${model.partyContect.officeNo == null ? officenumberController.text.length < 10 ? '* Enter Office Number' : '' : ''}',
                ),
              ),
            ],
          ),

          Text("""${model.partyContect.address}""",
              style: TextStyle(fontSize: 13)),

          Row(
            children: <Widget>[
              Text('Send UserID And Pass on Customer Mail'),
              Switch(
                value: model.partyContect.isDeleted,
                onChanged: (value) {
                  setState(() {
                    model.partyContect.isDeleted = value;
                    model.setisTesting(value);
                  });
                },
                //
                activeTrackColor: Colors.green,
                activeColor: Colors.green,
                inactiveTrackColor: Colors.orange[300],
              ),
            ],
          ),

          Text(
            '${model.productType == null ? '* Select Product Type' : ''}',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
          verticalSpaceTiny,
          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(11),
                  placeholder: 'Enter First Name',
                  controller: null,
                  onChanged: (text) {
                    model.setfirstcontact(text);
                  },
                  validationMessage:
                      '* ${model.firstname == null ? 'Provide First Name' : ''}',
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(11),
                  placeholder: 'Enter Last Name',
                  controller: null,
                  onChanged: (text) {
                    model.setlastName(text);
                  },
                  validationMessage:
                      '* ${model.lastName == null ? 'Provide Last Name' : ''}',
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: model.firstname == null
                    ? BusyButton(
                        title: 'Approved KYC',
                        enabled: false,
                        busy: model.busy,
                        onPressed: () async {
                          //  model.saveKYCDetails();
                        },
                      )
                    : BusyButton(
                        title: 'Approved KYC',
                        enabled: true,
                        busy: model.busy,
                        onPressed: () async {
                          model.saveVerifyKYC();
                        },
                      ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: BusyButton(
                  title: 'Reject KYC',
                  enabled: true,
                  busy: model.busy,
                  onPressed: () async {
                    model.saveRejectKYC();
                  },
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  Widget getProductType(String productType) {
    return Text(
      productType,
      style: TextStyle(fontWeight: FontWeight.w100),
    );
  }

  Widget row(Commonmodel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '${item.name}\n',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ],
    );
  }
}
