import 'package:cwl/models/masterindex.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class RegisterView extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final mobilenoController = TextEditingController();
  final emailController = TextEditingController();

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getEmployeeRegistrationFields(RegisterViewModel model) {
    return Column(
      children: <Widget>[
        InputField(
          placeholder: 'Username',
          controller: usernameController,
        ),
        verticalSpaceSmall,
        InputField(
          placeholder: 'Password',
          password: true,
          controller: passwordController,
        ),
        verticalSpaceSmall,
        InputField(
          placeholder: 'Mobile No',
          controller: mobilenoController,
          textInputType: TextInputType.number,
        ),
        verticalSpaceSmall,
        InputField(
          placeholder: 'Email',
          controller: emailController,
          textInputType: TextInputType.emailAddress,
        ),
        verticalSpaceMedium,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BusyButton(
                title: 'Register',
                busy: model.busy,
                onPressed: () {
                  switch (model.userType.id) {
                    case 1:
                      break;
                    case 2:
                      model.registerEmployee(
                          usernameController.text,
                          passwordController.text,
                          mobilenoController.text,
                          emailController.text);
                      break;
                    case 3:
                      break;
                    case 4:
                      break;
                    default:
                      break;
                  }
                })
          ],
        ),
      ],
    );
  }

  Widget getcommingSoonBanner() {
    return Text(
      'Coming Soon',
      style: TextStyle(fontSize: 21, color: Colors.deepPurple),
    );
  }

  Widget getRegistrationFileds(RegisterViewModel model) {
    switch (model.userType?.id) {
      case 1:
        return getcommingSoonBanner();
      case 2:
        return getEmployeeRegistrationFields(model);
      case 4:
        return getcommingSoonBanner();
      default:
        return showLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RegisterViewModel>.withConsumer(
      viewModel: RegisterViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'User Type : ',
                        style: TextStyle(fontSize: 16),
                      ),
                      horizontalSpaceSmall,
                      Container(
                        height: 50,
                        child: new DropdownButton<Commonmodel>(
                          value: model.userType,
                          hint: Text('Select UserType'),
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16,
                          ),
                          items: model.userTypes
                              .map<DropdownMenuItem<Commonmodel>>(
                                  (Commonmodel value) {
                            return DropdownMenuItem<Commonmodel>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (Commonmodel value) {
                            model.setuserType(value);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  getRegistrationFileds(model),
                ],
              ),
            ),
          )),
    );
  }
}
