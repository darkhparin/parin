import 'package:cwl/common/DocketSearch.dart';
import 'package:cwl/common/RateCalc.dart';
import 'package:cwl/common/DocketSearch.dart';
import 'package:cwl/models/account/GetLastAttendanceResponceModel.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/views/Driver_Fual_update_view.dart';
import 'package:cwl/ui/views/Pincode_Serviceability_view.dart';
import 'package:cwl/ui/views/booking_view_new_design.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/blinking_text.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/ui/widgets/popup.dart';
import 'package:cwl/viewmodels/guest_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

import '../shared/ui_helpers.dart';
import '../shared/ui_helpers.dart';
import '../shared/ui_helpers.dart';

class PincodeServiceabilityRoute1 extends CupertinoPageRoute {
  PincodeServiceabilityRoute1()
      : super(
            builder: (BuildContext context) => new PincodeServiceabilityView());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new PincodeServiceabilityView());
  }
}

class GuestView extends StatefulWidget {
  const GuestView({Key key}) : super(key: key);

  @override
  _GuestViewState createState() => _GuestViewState();
}

int _currentIndex = 0;

class _GuestViewState extends State<GuestView> {
  final attendanceReportController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    final ApiService _apiService = locator<ApiService>();
    return ViewModelProvider<GuestViewModel>.withConsumer(
      viewModelBuilder: () => GuestViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'CWL India',
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.050),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          actions: <Widget>[
            // action button
            IconButton(
              tooltip: 'Search Pincode',
              icon: Icon(
                Icons.location_on,
                color: Colors.yellow[500],
                size: 30,
              ),
              onPressed: () {
                _navigationService.navigateTo(PincodeServiceabilityRoute);
              },
            ),
            _apiService.userdetails.userTypeId == 2
                ? _apiService.accountAPIService.checkAttendance == false
                    ? FadeAnimation(
                        1,
                        FloatingActionButton.extended(
                          label: BlinkingText('Attendance'),
                          backgroundColor: Colors.white,
                          onPressed: () => {
                            model.getLastAttendance(),
                            showPopup(
                                context,
                                _attendanceReportPopUP(context, model),
                                'Today Attendances'),
                          },
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      )
                : Container(
                    height: 0,
                    width: 0,
                  )
          ],
        ),
        drawer: AppDrawer(model.appVersion),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              homeScreeTopPart(context),
              homeScreenBottomPart(context),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home", style: TextStyle())),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze), title: Text("Tools")),
          ],
        ),
      ),
    );
  }

  var date = new DateTime.now();

  Widget _attendanceReportPopUP(context, GuestViewModel model) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Date: ${date.toString().replaceRange(10, 26, '')}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                verticalSpaceMedium,
                Row(children: <Widget>[
                  Expanded(
                    child: InputField(
                      placeholder: 'Attendance Report',
                      controller: attendanceReportController,
                      textInputType: TextInputType.text,
                      onChanged: (text) => {
                        setState(() {
                          model.setAttendancetext(text);
                        }),
                      },
                    ),
                  ),
                ]),
                verticalSpaceSmall,
                Center(
                  child: FloatingActionButton.extended(
                    icon: Icon(Icons.arrow_forward),
                    backgroundColor: Colors.orange[500],
                    label: Text('Submit Report'),
                    onPressed: () => {
                      model.postAttendanceReportRequestModel(),
                      if (attendanceReportController.text.length > 4)
                        {
                          Navigator.pop(context),
                          showPopup(context, _attendanceSubmit(context, model),
                              'My Attendances'),
                        }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _attendanceSubmit(context, GuestViewModel model) {
    final NavigationService _navigationService = locator<NavigationService>();
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Today Present ?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  children: <Widget>[
                    Center(
                      child: FloatingActionButton.extended(
                        icon: Icon(Icons.beenhere),
                        backgroundColor: Colors.green,
                        label: Text('Present'),
                        onPressed: () => {
                          model.setattendancePresent(1),
                          model.postAttendanceRequestModel(),
                          Navigator.pop(context),
                          // model.postAttendanceRequestResponce == true
                          //     ? _navigationService
                          //         .navigateReplacementTo(GuestViewRoute)
                          //     : showLoading(),
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: FloatingActionButton.extended(
                        icon: Icon(Icons.close),
                        backgroundColor: Colors.red,
                        label: Text('Absent'),
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showLoading() {
    return Center(
      heightFactor: 5,
      child: LoadingWidget(),
    );
  }

  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 300,
        child: PopupContent(
          content: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            resizeToAvoidBottomPadding: false,
            body: widget,
          ),
        ),
      ),
    );
  }
}

Widget homeScreeTopPart(BuildContext context) {
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();
  return new Container(
    height: displayHeight(context) * 0.38,
    child: Stack(
      children: <Widget>[
        ClipPath(
          clipper: Mclipper(),
          child: Container(
            height: displayHeight(context) * 0.33,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
            child: Stack(
              children: <Widget>[
                Image.asset("assets/home_image.jpg",
                    height: 350, fit: BoxFit.cover, width: double.infinity),
                FadeAnimation(
                  0.5,
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333)
                        ],
                            stops: [
                          0.0,
                          0.9
                        ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome To",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: displayWidth(context) * 0.050,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          Text(
                            "Countrywide Logistics",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: displayWidth(context) * 0.10,
                                fontFamily: "SF-Pro-Display-Bold"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: displayHeight(context) * 0.33,
          right: -20.0,
          child: FractionalTranslation(
            translation: Offset(0.0, -0.5),
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _navigationService.navigateTo(RateCalcViewRoute);
                    //Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.exposure,
                    size: 30,
                    color: Color(0xFFE52020),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_apiService.userdetails.userTypeId == 2) {
                        _navigationService
                            .navigateTo(DocketTrackingFullPageViewRoute);
                      } else {
                        _navigationService.navigateTo(DocketSearchViewRoute);
                      }
                    },
                    color: Colors.green[500],
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Docket Tracking",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: displayWidth(context) * 0.045,
                              fontFamily: "SF-Pro-Display-Bold"),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RotatedBox(
                          quarterTurns: 4,
                          child: Icon(Icons.art_track,
                              size: 25.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget homeScreenBottomPart(BuildContext context) {
  final ApiService _apiService = locator<ApiService>();
  return Container(
    height: screenHeight(context) / 2,
    margin: EdgeInsets.only(left: 0.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Facility",
                style: TextStyle(
                    fontSize: 22.0, fontFamily: "SF-Pro-Display-Bold"),
              ),
              _apiService.userdetails.userTypeId == 2
                  ? FlatButton(
                      child: Text(
                        "CWL Employee",
                      ),
                      onPressed: () {},
                    )
                  : FlatButton(
                      child: Text("CWL Driver"),
                      onPressed: () {},
                    ),
            ],
          ),
        ),

// For Employee user Show Manu
        _apiService.userdetails.userTypeId == 2
            ? getMenuForUserEmp(context)
            : Container(
                height: 0,
                width: 0,
              ),

// For Employee Driver Show Manu
        _apiService.userdetails.userTypeId == 3
            ? getMenuForDriver()
            : Container(
                height: 0,
                width: 0,
              ),

// For Driver Show Manu
        _apiService.userdetails.userTypeId == 4
            ? getMenuForDriver()
            : Container(
                height: 0,
                width: 0,
              ),
      ],
    ),
  );
}

Widget getMenuForUserEmp(context) {
  final NavigationService _navigationService = locator<NavigationService>();
  return FadeAnimation(
    0.5,
    Container(
      padding: EdgeInsets.all(10.0),
      height: 360.0,
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          Card(
            color: Colors.blueAccent[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(BookingViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.add_photo_alternate,
                      size: 40.0,
                      color: Colors.orange[800],
                    ),
                    Text("Booking")
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.orange[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(TripCreateViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.departure_board,
                      size: 40.0,
                      color: Colors.blue[800],
                    ),
                    Text("Create Trip")
                  ],
                ),
              ),
            ),
          ),

          // Card(
          //   color: Colors.blueAccent[100],
          //   child: InkWell(
          //     onTap: () {
          //       _navigationService.navigateTo(ExtendEwayBillViewRoute);
          //       //Navigator.pop(context);
          //     },
          //     splashColor: Colors.blueAccent,
          //     child: Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: <Widget>[
          //           Icon(
          //             Icons.description,
          //             size: 40.0,
          //             color: Colors.blue[800],
          //           ),
          //           Text("Extend Way Bill")
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            color: Colors.blueAccent[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(UploadPODViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.cloud_upload,
                      size: 40.0,
                      color: Colors.orange[800],
                    ),
                    Text("Delivery")
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.orange[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(FualUpdateViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.swap_calls,
                      size: 40.0,
                      color: Colors.blue[800],
                    ),
                    Text("Fual Details")
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.blueAccent[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(BranchListViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.assignment_turned_in,
                      size: 40.0,
                      color: Colors.orange[800],
                    ),
                    Text("Branch Trip")
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.orange[100],
            child: InkWell(
              onTap: () {
                _navigationService.navigateTo(ChatAppViewRoute);
                //Navigator.pop(context);
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.chat,
                      size: 40.0,
                      color: Colors.blue[800],
                    ),
                    Text("Chat")
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.orange[100],
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BookingView1(),
                  )),
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.chat,
                      size: 40.0,
                      color: Colors.blue[800],
                    ),
                    Text("New Booking")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getMenuForDriver() {
  final NavigationService _navigationService = locator<NavigationService>();
  return Container(
    padding: EdgeInsets.all(10.0),
    height: 400.0,
    child: GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          color: Colors.blueAccent[100],
          child: InkWell(
            onTap: () {
              _navigationService.navigateTo(DashBoardDriverViewRoute);
              //Navigator.pop(context);
            },
            splashColor: Colors.blueAccent,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.departure_board,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("My Active Trip"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "मेरी एक्टिव ट्रिप",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: Colors.orangeAccent[100],
          child: InkWell(
            onTap: () {
              _navigationService.navigateTo(UploadPODViewRoute);
              //Navigator.pop(context);
            },
            splashColor: Colors.blueAccent,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.cloud_upload,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("Delivery"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "डिलीवरी",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
