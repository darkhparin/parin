import 'package:cwl/models/application/commonmodel.dart';
import 'package:cwl/ui/parameeters/party_add_parameter.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/booking_party_add_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider_architecture/provider_architecture.dart';

class BookingPartyAddView extends StatefulWidget {
  final PartyAddParameter _parameter;
  BookingPartyAddView({@required PartyAddParameter parameter, Key key})
      : _parameter = parameter,
        super(key: key);

  @override
  _BookingPartyAddViewState createState() => _BookingPartyAddViewState();
}

class _BookingPartyAddViewState extends State<BookingPartyAddView> {
  final contactPersonController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();
  final partyNameController = TextEditingController();
  final partyAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BookingPartyAddViewModel>.withConsumer(
      viewModel: BookingPartyAddViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(widget._parameter),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add Party'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop('Redirected'),
          ),
        ),
        backgroundColor: Colors.white,
        body: model.busy ? showLoading() : getBody(context, model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBody(BuildContext context, BookingPartyAddViewModel model) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Branch : ${model.parameter.branch}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpaceMedium,
              model.parameter.isURP
                  ? Container(
                      height: 0,
                      width: 0,
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        'GSTIN : ${model.parameter.gstin}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
              model.parameter.isURP
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        'URP Party',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    )
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              verticalSpaceMedium,
              getPartyName(model),
              verticalSpaceMedium,
              getPartyAddress(model),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'City Area : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    getCityAreaDropDown(model),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'City : ${model.partyLocationDetails?.city?.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'State : ${model.partyLocationDetails?.state?.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Pincode : ${model.pincode}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: InputField(
                    placeholder: 'Contact Person',
                    controller: contactPersonController,
                    textInputType: TextInputType.text,
                    onChanged: (text) {
                      model.setcontactPerson(text);
                    }),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: InputField(
                    placeholder: 'Mobile No',
                    controller: mobileNoController,
                    textInputType: TextInputType.number,
                    onChanged: (text) {
                      model.setcontactPersonMobile(text);
                    }),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: InputField(
                    placeholder: 'Email Id',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (text) {
                      model.setcontactPersonEmail(text);
                    }),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Product Type : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      getProductTypesDropDown(model),
                    ]),
              ),
              verticalSpaceMedium,
              BusyButton(
                  title: 'Save', busy: model.busy, onPressed: model.saveParty),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  Widget getPartyName(BookingPartyAddViewModel model) {
    return model.parameter.isURP
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Party Name : ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  InputField(
                      placeholder: 'Party Name',
                      controller: partyNameController,
                      textInputType: TextInputType.text,
                      onChanged: (text) {
                        model.setpartyName(text);
                      }),
                ]),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Party Name : ${model.partyGSTINDetails?.partyName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
  }

  Widget getPartyAddress(BookingPartyAddViewModel model) {
    return model.parameter.isURP
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Address : ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  InputField(
                      placeholder: 'Party Address',
                      controller: partyAddressController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (text) {
                        model.setpartyAddress(text);
                      }),
                ]),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Address : ${model.partyGSTINDetails?.address}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
  }

  Widget getProductTypesDropDown(BookingPartyAddViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<Commonmodel>(
        value: model.productType,
        isExpanded: true,
        hint: Text('Select Product Type'),
        style: TextStyle(color: Colors.deepPurple, fontSize: 18),
        items: model.productTypes
            .map<DropdownMenuItem<Commonmodel>>((Commonmodel value) {
          return DropdownMenuItem<Commonmodel>(
            value: value,
            child: Text(value.name.toString()),
          );
        }).toList(),
        onChanged: (Commonmodel value) {
          model.setproductType(value);
        },
      ),
    );
  }

  Widget getCityAreaDropDown(BookingPartyAddViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<Commonmodel>(
        value: model.cityArea,
        isExpanded: true,
        hint: Text('Select Product Type'),
        style: TextStyle(color: Colors.deepPurple, fontSize: 18),
        items: model.cityAreas
            .map<DropdownMenuItem<Commonmodel>>((Commonmodel value) {
          return DropdownMenuItem<Commonmodel>(
            value: value,
            child: Text(value.name.toString()),
          );
        }).toList(),
        onChanged: (Commonmodel value) {
          model.setcityArea(value);
        },
      ),
    );
  }
}
