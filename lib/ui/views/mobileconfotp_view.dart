import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/ui/widgets/text_link.dart';
import 'package:cwl/viewmodels/mobileconfotp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class MobileConfOtpView extends StatelessWidget {
  final otpController = TextEditingController();
  final String _otpRequestCode;

  MobileConfOtpView({@required String otpRequestCode})
      : _otpRequestCode = otpRequestCode;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MobileConfOtpViewModel>.withConsumer(
      viewModel: MobileConfOtpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(_otpRequestCode),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      height: 400,
                      child: FadeAnimation(
                        1,
                        Container(
                          child: new Image.asset(
                            'assets/images/background.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 400,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            child: new Image.asset(
                              'assets/images/background-2.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1.5,
                        Text(
                          "OTP",
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.7,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: Text(
                                  'Enter OTP For Mobile Confirmation',
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * 0.039, color: Colors.red),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: InputField(
                                  initialValue: model.otp,
                                  placeholder: 'OTP',
                                  controller: otpController,
                                  textInputType: TextInputType.number,
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.7,
                      Center(
                          // child: Text(
                          //   "Forgot Password?",
                          //   style: TextStyle(
                          //       color: Color.fromRGBO(196, 135, 198, 1)),
                          // ),
                          ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.9,
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(49, 39, 79, 1),
                          ),
                          child: Center(
                            child: BusyButton(
                              title: 'Submit OTP',
                              busy: model.busy,
                              onPressed: () {
                                model.validateOTP(otpController.text);
                              },
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
