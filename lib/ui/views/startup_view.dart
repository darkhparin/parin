import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/text_link.dart';
import 'package:cwl/viewmodels/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
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
                                  child: Center(
                                      child: Text(
                                    'Welcome',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    FadeAnimation(
                        1.5,
                        Center(
                          child: Text(
                            "Countrywide Logistics",
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        )),
                    SizedBox(
                      height: 60,
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
                            child: Text(
                              "ROAD - RAIL - AIR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      Center(
                          child: Text(
                        'Everywhere With Care',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.height,
        //         child: Image.asset(
        //           'assets/app-background.jpg',
        //         ),
        //       ),

        //       // CircularProgressIndicator(
        //       //   strokeWidth: 3,
        //       //   valueColor: AlwaysStoppedAnimation(
        //       //     Theme.of(context).primaryColor,
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
