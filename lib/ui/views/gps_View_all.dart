import 'dart:async';

import 'package:cwl/models/application/index.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/viewmodels/employee_trip_view_model.dart';
import 'package:cwl/viewmodels/gps_View_all_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cwl/models/GPS/GPSResponceModel.dart';

import 'package:cwl/ui/views/coffee_model.dart';

class GpsVehicleView extends StatefulWidget {
  @override
  GpsVehicleViewState createState() => GpsVehicleViewState();
}

Set<Marker> markers = Set();

class GpsVehicleViewState extends State<GpsVehicleView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GpsVehicleViewModel>.withConsumer(
        viewModelBuilder: () => GpsVehicleViewModel(),
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                // leading: IconButton(
                //     icon: Icon(Icons.close),
                //     onPressed: () {
                //       //
                //     }),
                title: Text("Vehicle GPS Tracking"),
                actions: <Widget>[
                  // IconButton(
                  //     icon: Icon(FontAwesomeIcons.home),
                  //     onPressed: () {
                  //       //
                  //     }),
                ],
              ),
              body: Stack(
                children: <Widget>[
                  _buildGoogleMap(context, model),
                  // _zoomminusfunction(),
                  // _zoomplusfunction(),
                  // _buildContainer(model),
                  _buildContainer(model),
                ],
              ),
            ));
  }

  Widget _buildContainer(GpsVehicleViewModel model) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 125.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.gpslist.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              var latitute = double.parse(model.gpslist[idx].latitute);
              var longitude = double.parse(model.gpslist[idx].longitude);

              Marker resultMarker = Marker(
                markerId: MarkerId(model.gpslist[idx].vehName),
                infoWindow: InfoWindow(
                    title: "${model.gpslist[idx].vehName}",
                    snippet: "Speed ${model.gpslist[idx].speed}"),
                position: LatLng(latitute, longitude),
              );

              markers.add(resultMarker);

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: model.busy
                    ? showLoading()
                    : _boxes(
                        "https://image.freepik.com/free-vector/truck-delivery-icon-background-box-package-point-location-bulb-with-flat-style-vector-design_197170-461.jpg",
                        latitute,
                        longitude,
                        "${model.gpslist[idx].vehName}",
                        "${model.gpslist[idx].pwrStat}",
                        "${model.gpslist[idx].speed}",
                        "${model.gpslist[idx].fuel}",
                        model),
              );
            }),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName,
      String pwrStat, String speed, String fuel, GpsVehicleViewModel model) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 20.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(50.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(
                          restaurantName, pwrStat, speed, fuel, model),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String pwrStat,
      String speed, String fuel, GpsVehicleViewModel model) {
    var pwrStat1 = pwrStat == 'Ac.A' ? 'OFF' : 'ON';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              restaurantName,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Eng. $pwrStat1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                  child: Text(
                "",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Speed $speed",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Fuel $fuel%",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context, GpsVehicleViewModel model) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(21.6915912, 76.544821), zoom: 5.0),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Widget showLoading() {
  return Center(
    heightFactor: 5,
    child: LoadingWidget(),
  );
}
