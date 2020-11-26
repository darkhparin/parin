import 'dart:async';
import 'dart:ui';
import 'package:cwl/models/application/index.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/ui/widgets/blinking_text.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/viewmodels/employee_trip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchListView extends StatefulWidget {
  BranchListView({Key key}) : super(key: key);
  @override
  _BranchListViewState createState() => _BranchListViewState();
}

Completer<GoogleMapController> _controller = Completer();

class _BranchListViewState extends State<BranchListView> {
  Set<Marker> markers = Set();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BranchListViewModel>.withConsumer(
      viewModelBuilder: () => BranchListViewModel(),
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
            'My Branch Active Trip',
            style: TextStyle(
              fontSize: 22,
              color: Colors.orange,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.blue,
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getBrnaches(context, model),
              // model.busy ? showLoading() : branchTripList(context, model),
              model.busy ? showLoading() : branchTripListNew(context, model),
            ],
          ),
        ),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      heightFactor: 5,
      child: LoadingWidget(),
    );
  }

  Widget getBrnaches(context, BranchListViewModel model) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.lightBlue[50],
          ),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      height: 50,
      child: new DropdownButton<BranchModel>(
        value: model.branchlist,
        hint: Text(' Select Branch '),
        isExpanded: true,
        style: TextStyle(color: Colors.deepPurple),
        items: model.branchlists
            .map<DropdownMenuItem<BranchModel>>((BranchModel value) {
          return DropdownMenuItem<BranchModel>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (BranchModel value) {
          model.setbranchlist(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }
}

Widget branchTripList(context, BranchListViewModel model) {
  return Column(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 2,
        child: ListView.builder(
            itemCount: model?.triplist?.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    verticalSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),

                    // ExpansionTile(
                    //   title: Text("Harley-Davidson"),
                    //   subtitle: Text("  Explore the world of H-D"),
                    //   children: <Widget>[
                    //     IconTheme(
                    //       data: IconThemeData(
                    //         color: Colors.amber,
                    //         size: 32,
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: List.generate(5, (index) {
                    //           return Icon(
                    //             index < 0 ? Icons.star : Icons.star_border,
                    //           );
                    //         }),
                    //       ),
                    //     ),
                    //     Text("This image has 3 star rating ")
                    //   ],
                    // ),

                    ExpansionTile(
                      title: Text(
                        "Trip NO: ${model.triplist[idx].tripId}   (${model.triplist[idx].carrier})\n\n ${model.triplist[idx].origin} TO ${model.triplist[idx].destination}",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      backgroundColor: Colors.blue[50],
                      tilePadding: EdgeInsets.all(5),

                      // subtitle: Text(
                      //     ' Last Location ${model.triplist[idx].lastLocation}'),
                      trailing: getUpDownTripIcon(
                          model.triplist[idx].isUpTrip == true),

                      leading: Icon(
                        model.triplist[idx].modeId == 1
                            ? Icons.flight
                            : model.triplist[idx].modeId == 2
                                ? Icons.directions_subway
                                : Icons.local_shipping,
                        size: 40.0,
                        color: Colors.blue,
                      ),

                      children: <Widget>[
                        Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/trip-update-background.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white70,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue.withAlpha(500),
                                      blurRadius: 10.0),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${model.triplist[idx].status}      ${model.triplist[idx].carrier}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'BY ${model.triplist[idx].resource} ',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Date: ${model.triplist[idx].date} ',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Location: ${model.triplist[idx].lastLocationAddress == null ? 'N/A' : model.triplist[idx].lastLocationAddress}',
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'Update On: ${model.triplist[idx].lastLocation}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            model.triplist[idx].latitude == null
                                ? Icon(
                                    Icons.location_off,
                                    color: Colors.red,
                                  )
                                : RaisedButton.icon(
                                    onPressed: () async {
                                      var url =
                                          'https://www.google.com/maps/search/?api=1&query=${model.triplist[idx].latitude},${model.triplist[idx].longitude}'; //waypoints=22.718589,72.880419|22.564561,72.984361&
                                      print(url);
                                      if (await canLaunch(url)) {
                                        await launch(url, forceSafariVC: false);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    icon: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                                    label: BlinkingText('Live Location'),
                                  ),
                            model.triplist[idx].latitude == null
                                ? Icon(
                                    Icons.location_off,
                                    color: Colors.red,
                                  )
                                : RaisedButton.icon(
                                    onPressed: () async {
                                      var url =
                                          'https://www.google.com/maps/dir/?api=1&origin=${model.triplist[idx].latitude},${model.triplist[idx].longitude}&destination=${model.triplist[idx].toLocation.latitude},${model.triplist[idx].toLocation.longitude}&travelmode=driving'; //waypoints=22.718589,72.880419|22.564561,72.984361&
                                      print(url);
                                      if (await canLaunch(url)) {
                                        await launch(url, forceSafariVC: false);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    icon: Icon(
                                      Icons.directions,
                                      color: Colors.blue,
                                    ),
                                    label: Text('Direction'),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    ],
  );
}

Widget getUpDownTripIcon(bool isUpTrip) {
  if (isUpTrip) {
    return Icon(
      Icons.arrow_upward,
      color: Colors.green,
      size: 24.0,
    );
  } else {
    return Icon(
      Icons.arrow_downward,
      color: Colors.red,
      size: 24.0,
    );
  }
}

Widget renderNodata() {
  return Container();
}

Widget branchTripListNew(context, BranchListViewModel model) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.0),
    child: Stack(
      children: <Widget>[
        /// Item card
        Container(
          height: MediaQuery.of(context).size.height - 153,
          child: ListView.builder(
            itemCount: model?.triplist?.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              return Card(
                //   alignment: Alignment.topCenter,
                child: SizedBox.fromSize(
                  size: Size.fromHeight(250.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      /// Item description inside a material
                      Container(
                        margin: EdgeInsets.only(top: 24.0),
                        child: Material(
                          elevation: 14.0,
                          borderRadius: BorderRadius.circular(12.0),
                          shadowColor: Color(0x802196F3),
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFDA4453),
                              Color(0xFF89216B)
                            ])),
                            child: Padding(
                              // padding: EdgeInsets.all(24.0),
                              padding: EdgeInsets.fromLTRB(24, 18, 24, 80),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /// Title and rating
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          '${model.triplist[idx].origin} TO ${model.triplist[idx].destination}',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              '${model.triplist[idx].carrier} ',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0)),
                                          Icon(Icons.departure_board,
                                              color: Colors.amber, size: 20.0),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('${model.triplist[idx].status}',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 23.0)),
                                          Icon(Icons.star,
                                              color: Colors.amber, size: 24.0),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.location_on,
                                              color: Colors.amber, size: 20.0),
                                          model.triplist[idx].latitude != null
                                              ? new GestureDetector(
                                                  onTap: () async {
                                                    var url =
                                                        'https://www.google.com/maps/search/?api=1&query=${model.triplist[idx].latitude},${model.triplist[idx].longitude}'; //waypoints=22.718589,72.880419|22.564561,72.984361&
                                                    print(url);
                                                    if (await canLaunch(url)) {
                                                      await launch(url,
                                                          forceSafariVC: false);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: new Text(
                                                    "Live Location ",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : SizedBox(),
                                          Icon(Icons.directions,
                                              color: Colors.amber, size: 20.0),
                                          model.triplist[idx].latitude != null
                                              ? new GestureDetector(
                                                  onTap: () async {
                                                    var url =
                                                        'https://www.google.com/maps/dir/?api=1&origin=${model.triplist[idx].latitude},${model.triplist[idx].longitude}&destination=${model.triplist[idx].isUpTrip == true ? model.triplist[idx].toLocation.latitude : model.triplist[idx].fromLocation.latitude},${model.triplist[idx].isUpTrip == true ? model.triplist[idx].toLocation.longitude : model.triplist[idx].fromLocation.longitude}&travelmode=driving'; //waypoints=22.718589,72.880419|22.564561,72.984361&
                                                    print(url);
                                                    if (await canLaunch(url)) {
                                                      await launch(url,
                                                          forceSafariVC: false);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: new Text(
                                                    " Direction",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ],
                                  ),

                                  /// Infos
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Date: ${model.triplist[idx].date}',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text('',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.greenAccent[900],
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                                '${model.triplist[idx].tcvlhc}',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.green,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                                'Trip ${model.triplist[idx].isUpTrip == true ? 'UP' : 'Down'}',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Item image
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(54.0),
                            child: Material(
                              elevation: 20.0,
                              shadowColor: Color(0x802196F3),
                              shape: CircleBorder(),

                              child: Icon(
                                model.triplist[idx].modeId == 1
                                    ? Icons.flight
                                    : model.triplist[idx].modeId == 2
                                        ? Icons.directions_subway
                                        : Icons.local_shipping,
                                size: 70.0,
                                color: Colors.orange[800],
                              ),
                              // child: Image.asset('res/shoes1.png'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 180, 40, 0),
                        child: Material(
                          elevation: 12.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.purple,
                                child: Text('TRIP'),
                              ),
                              title: Text('${model.triplist[idx].resource}'),
                              subtitle: Text(
                                  'OriginTime: ${model.triplist[idx].originTime == null ? '' : model.triplist[idx].originTime}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

              /// Review
            },
          ),
        ),
      ],
    ),
  );
}
