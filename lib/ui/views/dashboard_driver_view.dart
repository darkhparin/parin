import 'dart:async';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/trip/ArriveTrip.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/dashboard_driver_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:url_launcher/url_launcher.dart';

import 'guest_view.dart';

class DashBoardDriverView extends StatefulWidget {
  DashBoardDriverView({Key key}) : super(key: key);

  @override
  _DashBoardDriverViewState createState() => _DashBoardDriverViewState();
}

class _DashBoardDriverViewState extends State<DashBoardDriverView>
    with WidgetsBindingObserver {
  Timer _timer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _timer = Timer.periodic(
        Duration(seconds: 60),
        (Timer t) => {
              //refreshPage()
            });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (state == AppLifecycleState.resumed) {
      //refreshPage();
    }
  }

  void refreshPage() {
    print('Page Refreshed !');
    Navigator.pushReplacementNamed(context, DashBoardDriverViewRoute);
  }

  void sendTripLocation() {
    print('Location Sent !');
  }

  final unsealnoController = TextEditingController();
  final readingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DashBoardDriverViewModel>.withConsumer(
      viewModelBuilder: () => DashBoardDriverViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GuestView(),
                  )),
            ),
          ],
        ),
        drawer: AppDrawer(model.appVersion),
        backgroundColor: Colors.white,
        body: model.busy
            ? showLoading()
            : model.hasLocationPermission
                ? getBody(context, model)
                : getLocationPermission(model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getLocationPermission(DashBoardDriverViewModel model) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(model.errormsg == null ? '' : model.errormsg),
            Container(
              height: 10,
            ),
            BusyButton(
              onPressed: () => {model.checkLocationPermission()},
              title: 'Check Location Permission',
              busy: model.busy,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(context, DashBoardDriverViewModel model) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              model.driverActiveTripModel != null
                  ? getCurrentTripCard(model)
                  : getNoActiveTripFound(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNoActiveTripFound(DashBoardDriverViewModel model) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      height: 120,
      child: InkWell(
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'No Active Trip Found',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red),
                ),
                // verticalSpaceSmall,
                // Text(
                //   'Location : ${model.latitude} , ${model.longitude}',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCurrentTripCard(DashBoardDriverViewModel model) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      child: InkWell(
        // onTap: () {
        //   model.navigateToTripUpdate();
        // },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.green,
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Your Active Trip',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green),
                ),
                verticalSpaceSmall,
                Text(
                  'Trip Name : ${model.driverActiveTripModel?.tripName}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                verticalSpaceSmall,
                Text(
                  'Trip From ${model.driverActiveTripModel?.fromBranch}  TO  ${model.driverActiveTripModel?.toBranch}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                verticalSpaceMedium,
                BusyButton(
                    title: 'Trip Update',
                    busy: model.busy,
                    onPressed: () async {
                      model.navigateToTripUpdate();
                    }),
                verticalSpaceSmall,

                model.canArriveLocal
                    ? arriveTripBody(model)
                    // BusyButton(
                    //     title: 'Arrive',
                    //     busy: model.busy,
                    //     onPressed: () => {
                    //           model.getArriveTripResponce(),
                    //         })
                    : Container(),
                IconButton(
                  icon: Image.asset('map-img.jpg'),
                  iconSize: 300,
                  onPressed: () async {
                    var url =
                        'https://www.google.com/maps/dir/?api=1&origin=${model.latitude},${model.longitude}&waypoints=${model.currentTripRoute.latitude},${model.currentTripRoute.longitude}&destination=${model.driverActiveTripModel.toLocation.latitude},${model.driverActiveTripModel.toLocation.longitude}&travelmode=driving'; //waypoints=22.718589,72.880419|22.564561,72.984361&
                    print(url);
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                Center(
                  child: Text(
                    'Current Branch : ${model.currentTripRoute?.branch} (${model.currentTripRoute?.status})',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                // verticalSpaceSmall,
                // Text(
                //   'Location : ${model.latitude} , ${model.longitude}',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget arriveTripBody(DashBoardDriverViewModel model) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      child: InkWell(
        child: Card(
          color: Colors.blue[100],
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.green,
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      'Enter UnSeal No:      ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      placeholder: 'Enter UnSeal No ',
                      controller: unsealnoController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) {
                        model.setunsealno(text);
                      },
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      'Enter Reading:          ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      placeholder: 'Enter Reading',
                      controller: readingController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) {
                        model.setreading(text);
                      },
                    ),
                  ),
                ]),
                verticalSpaceTiny,
                BusyButton(
                    title: 'Trip Arrive',
                    onPressed: () async {
                      model.getArriveTripResponce();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
