import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/Bank_Account_Verify_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider_architecture/_viewmodel_provider.dart';

import '../../locator.dart';

class BankAccountView extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelProvider<BankAccountViewModel>.withConsumer(
      viewModelBuilder: () => BankAccountViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Bank Account & PAN Verify',
            style: TextStyle(color: Colors.blue),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   color: Colors.blue,
          //   onPressed: () => Scaffold.of(context).openDrawer(),
          // ),
        ),
        // Setting up AppBar
        //drawer: AppDrawer(model.appVersion),
        body: SingleChildScrollView(
          child: model.busy
              ? showLoading()
              : Column(
                  children: [
                    passwordTextBox(
                      context,
                      model,
                    ),
                    model.getbankAccountVerify != null
                        ? bankAccountResult(model)
                        : SizedBox(
                            height: 0,
                          ),
                    panCardDetails(context, model),
                    model.getpanNumberVerify != null
                        ? panCardResult(model)
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}

Widget passwordTextBox(context, BankAccountViewModel model) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  //const Color(0xFF00CCFF),
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: MediaQuery.of(context).size.width,
          child: Text(
            '\nBank Account Verify\n',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        InputField(
          // formatter: LengthLimitingTextInputFormatter(11),
          placeholder: 'Enter IFSC',
          controller: null,
          textInputType: TextInputType.text,

          textInputAction: TextInputAction.next,
          onChanged: (text) {
            model.setifsc(text);
          },
          // validationMessage:
          //     '${model?.setifsc.toString() == null ? 'Enter IFSC Code' : ''}',
        ),
        SizedBox(
          height: 5,
        ),
        InputField(
          // formatter: LengthLimitingTextInputFormatter(11),
          placeholder: 'Entera Account No',
          controller: null,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onChanged: (text) {
            model.setaccountNo(text);
          },
          // validationMessage:
          //     '${model?.password == model?.confirmPassword ? '' : '* Password Not Match'}',
          // nextFocusNode: ,
        ),
        SizedBox(
          height: 5,
        ),
        InputField(
          formatter: LengthLimitingTextInputFormatter(11),
          placeholder: 'Enter Account Name',
          controller: null,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (text) {
            model.setaccountName(text);
          },
        ),
        SizedBox(
          height: 0,
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.all(0),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            child: Center(
              child: Text(
                "Submit Bank Details",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: () {
            model.submitBankDetails();
          },
        ),
        new Divider(
          thickness: 1,
          color: Colors.red,
        ),
      ],
    ),
  );
}

Widget showLoading() {
  return Center(
    heightFactor: 5,
    child: LoadingWidget(),
  );
}

Widget bankAccountResult(BankAccountViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        'Name At bBank = ${model.getbankAccountVerify.nameAtBank}',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Text('Account Exists = ${model.getbankAccountVerify.accountExists}'),
      Text('Amount Deposited = ${model.getbankAccountVerify.amountDeposited}'),
      Text(
        'Message = ${model.getbankAccountVerify.message}',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    ],
  );
}

Widget panCardDetails(context, BankAccountViewModel model) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  //const Color(0xFF00CCFF),
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: MediaQuery.of(context).size.width,
          // color: Colors.red[200],
          child: Text(
            '\nPAN Card Verify\n',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        InputField(
          // formatter: LengthLimitingTextInputFormatter(11),
          placeholder: 'Enter PAN Number',
          controller: null,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (text) {
            model.setpanNumber(text);
          },
        ),
        SizedBox(
          height: 5,
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.all(0),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            child: Center(
              child: Text(
                "Submit PAN Number",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: () {
            model.submitPANDetails();
          },
        ),
      ],
    ),
  );
}

Widget panCardResult(BankAccountViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        'PAN Number = ${model.getpanNumberVerify.pan}',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Text(
        'FullName = ${model.getpanNumberVerify.fullName}',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Text('Status = ${model.getpanNumberVerify.status}'),
      Text(
        'Category = ${model.getpanNumberVerify.category}',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    ],
  );
}
