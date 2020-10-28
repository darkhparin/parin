import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/viewmodels/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:cwl/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'guest_view.dart';

class LoginView extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModelBuilder: () => LoginViewModel(),
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
                            width: MediaQuery.of(context).size.width,
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
                              width: MediaQuery.of(context).size.width,
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
                          "Login",
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
                                child: InputField(
                                  placeholder: 'Username',
                                  controller: usernameController,
                                  onChanged: (text) {
                                    model.setusername(text);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: InputField(
                                  placeholder: 'Password',
                                  password: true,
                                  controller: passwordController,
                                  onChanged: (text) {
                                    model.setpassword(text);
                                  },
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
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => GuestView(),
                              )),
                          child: new Text(
                            "Skip Login",
                            style: TextStyle(
                                color: Color.fromRGBO(196, 135, 198, 1)),
                          ),
                        ),
                        // child: Text(
                        //   "Skip Login",
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
                          enabled: usernameController.text.length > 3
                              ? passwordController.text.length > 3
                                  ? true
                                  : false
                              : false,
                          title: 'Login',
                          busy: model.busy,
                          onPressed: () {
                            // try {
                            //   await _auth.createUserWithEmailAndPassword(
                            //       email: usernameController.text.trim(),
                            //       password: passwordController.toString());
                            // } catch (e) {
                            //   print(e);
                            // }
                            model.login();
                          },
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      Center(
                          child: TextLink(
                        'Create an Account if you\'re new.',
                        onPressed: () {
                          model.navigateToSignUp();
                        },
                      )
                          // Text(
                          //   "Create Account",
                          //   style:
                          //       TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                          // ),
                          ),
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
