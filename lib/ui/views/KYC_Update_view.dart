import 'dart:async';
import 'dart:ui';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cwl/models/application/index.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/ui/widgets/blinking_text.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/KYC_Update_view_model.dart';
import 'package:cwl/viewmodels/employee_trip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class KycUpdateView extends StatefulWidget {
  @override
  _KycUpdateViewState createState() => _KycUpdateViewState();
}

class _KycUpdateViewState extends State<KycUpdateView> {
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
  @override
  AutoCompleteTextField _productTypeAutoFill;
  Widget build(BuildContext context) {
    return ViewModelProvider<KycUpdateViewModel>.withConsumer(
      viewModelBuilder: () => KycUpdateViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.orange),
          ),
          title: Text(
            'Know Your Customer KYC',
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

  Widget getPartys(context, KycUpdateViewModel model) {
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
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (Commonmodel value) {
          model.setPartyList(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget partyDetailsEdit(KycUpdateViewModel model) {
    // gstNoController.text =
    //     model.partyContect != null ? model.partyContect.gstin : '';

    // contactPersonController.text =
    //     model.partyContect != null ? model.partyContect.contactPerson : '';

    // emailController.text =
    //     model.partyContect != null ? model.partyContect.emailId : '';
    // var aaa = model.partyContect.mobileNo.toString();
    // mobileController.text = model.partyContect != null ? aaa : '';
    // officenumberController.text =
    //     model.partyContect != null ? model.partyContect.officeNo : '';
    // addressController.text =
    //     model.partyContect != null ? model.partyContect.address : '';
    // var partypincode = model.partyContect.pincode.toString();
    // partyPincodeController.text =
    //     model.partyContect != null ? partypincode : '';

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
                  color: model.isDeleted == true ? Colors.orange : Colors.green,
                ),
              ),
            ],
          ),

          // Image.network(
          //     'https://image.freepik.com/free-vector/kyc-know-your-customer-concept-idea-business-identification-finance-safety-cyber-crime_277904-5395.jpg'),
          Center(
              // child: Text(
              //   'Branch: ${model.partyContect.branch}-${model.partyContect.branchPincode}',
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.orange,
              //   ),
              // ),
              ),
          // verticalSpaceSmall,
          // Text('GST No'),
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
                  onChanged: (text) {
                    model.setgstin(text);
                  },
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
                  onChanged: (value) {
                    model.setcontactPerson(value);
                  },
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
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    model.setemail(text);
                  },
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
                      model.sethasEmailAlert(value);
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
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    model.setmobileNo(text);
                  },
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
                      model.sethasSMSAlert(value);
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
                  onChanged: (text) {
                    model.setofficeNo(text);
                  },
                  validationMessage:
                      '${model.partyContect.officeNo == null ? officenumberController.text.length < 10 ? '* Enter Office Number' : '' : ''}',
                ),
              ),
            ],
          ),
          // verticalSpaceSmall,
          // Text(
          //   'Address',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          Text("""${model.partyContect.address}""",
              style: TextStyle(fontSize: 13)),
          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  placeholder: 'If Change Address Type Hear (Full Address)',
                  controller: addressController,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    model.setaddress(text);
                  },
                  // validationMessage: model.errordocketno,
                ),
              ),
            ],
          ),
          // verticalSpaceSmall,
          // Text('Party Pincode'),
          Row(
            children: <Widget>[
              Expanded(
                child: InputField(
                  formatter: LengthLimitingTextInputFormatter(11),
                  placeholder: 'Pincode: ${model.partyContect.pincode}',
                  controller: partyPincodeController,
                  textInputType: TextInputType.number,
                  onChanged: (text) {
                    model.setpartyPincode(text);
                  },
                  // validationMessage: model.errordocketno,
                ),
              ),
              Text('  ODA Applicable ?'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Checkbox(
                  value: model.partyContect.isOda,
                  onChanged: (value) {
                    setState(() {
                      model.partyContect.isOda = value;
                      model.setisODA(value);
                    });
                  },
                ),
              ),
            ],
          ),
          // verticalSpaceMedium,
          // Text('Select Product Type'),
          getProductTypesDropDown(model),
          model.productType != null
              ? getProductType(model.productType.name)
              : Container(
                  height: 0,
                  width: 0,
                ),
          Text(
            '${model.productType == null ? '* Select Product Type' : ''}',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
          verticalSpaceMedium,
          Row(
            children: <Widget>[
              Text(
                "  Delete Party",
                style: TextStyle(
                  color: model.isDeleted == true ? Colors.orange : Colors.green,
                ),
              ),
              Switch(
                value: model.partyContect.isDeleted,
                onChanged: (value) {
                  setState(() {
                    model.partyContect.isDeleted = value;
                    model.setisDeleted(value);
                  });
                },
                activeTrackColor: Colors.orange,
                activeColor: Colors.red,
                inactiveTrackColor: Colors.green[300],
              ),
              Expanded(
                child: model.productType == null
                    ? BusyButton(
                        title: 'Submit KYC',
                        enabled: false,
                        busy: model.busy,
                        onPressed: () async {
                          //  model.saveKYCDetails();
                        },
                      )
                    : BusyButton(
                        title: 'Submit KYC',
                        enabled: true,
                        busy: model.busy,
                        onPressed: () async {
                          model.saveKYCDetails();
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

  // Widget getProductTypesDropDown(KycUpdateViewModel model) {
  //   return Container(
  //     height: 50,
  //     child: new DropdownButton<Commonmodel>(
  //       // value: model.productType,
  //       value: model.productType,
  //       isExpanded: true,
  //       hint: Text('Select Product Type'),
  //       style: TextStyle(color: Colors.deepPurple),
  //       items: model.productTypes
  //           .map<DropdownMenuItem<Commonmodel>>((Commonmodel value) {
  //         return DropdownMenuItem<Commonmodel>(
  //           value: value,
  //           child: Text(value.name.toString()),
  //         );
  //       }).toList(),
  //       onChanged: (Commonmodel value) {
  //         model.setproductType(value);
  //         FocusScope.of(context).requestFocus(new FocusNode());
  //       },
  //     ),
  //   );
  // }

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

  Widget getProductTypesDropDown(KycUpdateViewModel model) {
    _productTypeAutoFill = AutoCompleteTextField<Commonmodel>(
      controller: productTypeAutoFillController,
      clearOnSubmit: false,
      itemSubmitted: (item) {
        model.setproductType(item);
        productTypeAutoFillController.text = item.name;
      },
      key: autocmptkeyProductName,
      suggestions: model.productTypes,
      itemBuilder: (context, item) {
        return row(item);
      },
      textChanged: (value) {
        model.setproductType(null);
      },
      itemSorter: (a, b) {
        return a.name.compareTo(b.name);
      },
      itemFilter: (item, query) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      },
    );
    return _productTypeAutoFill;
  }
}
