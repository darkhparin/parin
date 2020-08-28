import 'dart:convert';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:http/http.dart' as http;

import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/viewmodels/guest_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

class DocketSearchView extends StatefulWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  _DocketSearchViewState createState() => _DocketSearchViewState();
}

var _searchDocket = TextEditingController();

class _DocketSearchViewState extends State<DocketSearchView> {
  @override
  Widget build(BuildContext context) {
    var mobileheight = MediaQuery.of(context).size.height;
    var mobilewidth = MediaQuery.of(context).size.width;

    return ViewModelProvider<GuestViewModel>.withConsumer(
      viewModel: GuestViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Docket Track',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
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
        body: Center(
            child: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  1.0, 2.0), // 10% of the width, so there are ten blinds.
              colors: [
                Colors.white,
                Colors.orange
              ], // colors: [const Color(0xFFB2FBF2), const Color(0xFF999978)], // whitish to gray
              tileMode: TileMode.repeated,
              // repeats the gradient over the canvas
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: new Center(
              child: new Column(children: [
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new Image.asset('assets/tracking.png',
                scale: 3.0, width: 60.0, height: 60.0),
            new Text(
              '',
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              maxLength: 11,
              controller: _searchDocket,
              decoration: new InputDecoration(
                labelText: "Enter Shipment No.",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius:
                      new BorderRadius.vertical(bottom: Radius.circular(20.0)),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.number,
              style: new TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.0,
                color: Colors.pink,
              ),
            ),
            new Container(
              height: 25,
            ),
            new SizedBox(
              width: mobilewidth / 1.5,
              height: mobileheight / 18,
              child: new RaisedButton(
                  child: new Text('Submit'),
                  elevation: 9.0,
                  splashColor: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.vertical(
                          bottom: Radius.circular(20.0))),
                  color: Color.fromARGB(1411, 2222, 3333, 8888),
                  colorBrightness: Brightness.dark,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => RateCalcnew(
                          gstno: _searchDocket.text,
                        ),
                      ))),
            ),
          ])),
        )),
      ),
    );
  }
}

class RateCalcnew extends StatefulWidget {
  String gstno;
  RateCalcnew({this.gstno});

  @override
  _RateCalcnewState createState() => _RateCalcnewState();
}

class _RateCalcnewState extends State<RateCalcnew> {
  @override
  Widget build(BuildContext context) {
    var mobileheight = MediaQuery.of(context).size.height;
    var mobilewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Docket Details'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: new FutureBuilder(
          future: getUser(widget.gstno),
          builder: (context, snapShot) {
            Map data = snapShot.data;

            if (snapShot.hasError) {
              print(snapShot.error);
              return Text(
                'Something Was Wrong Try Again.',
                textScaleFactor: 2.0,
              );
            } else if (snapShot.hasData) {
              var massage = data['message'];

              if (massage == 'An error has occurred.') {
                return Center(
                  child: Text(
                    'Provide Valid Docket No.',
                    textScaleFactor: 2.0,
                  ),
                );
              }

              if (massage ==
                  'Authorization has been denied for this request.') {
                return Center(
                  child: Text(
                    'Provide Valid Docket No.',
                    textScaleFactor: 2.0,
                  ),
                );
              }

              return Center(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          new Card(
                            child: new Column(
                              children: <Widget>[
                                new Image.asset("assets/map_compas.gif"),
                                Wrap(
                                  spacing: 5.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('T')),
                                      label: Text(
                                          '${data['controlling_Office']['tollFree']}'),
                                    ),
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('W')),
                                      label: Text('countrywidelogistics.co.in'),
                                    ),
                                  ],
                                ),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.location_on,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            '${data['from_Station']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(10, 1, 1, 1),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.arrow_downward,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.location_on,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Text(
                                            ' ${data['to_Station']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.assignment,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' Docket No.: ${data['docketNo']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.date_range,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: new Text(
                                            ' Booking : ${data['booking_Date']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.aspect_ratio,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: new Text(
                                            ' Total Packets: ${data['total_Packets']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
//-------------------------Secound Part----------------------------
                          ),
                          new Card(
                            child: new Column(
                              children: <Widget>[
                                new Image.asset('assets/Wave-PNG-HD.png'),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.done_all,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' Transhipment Details',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.access_time,
                                            color: Colors.red,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' Departure: ${data['transhipment_Details'][index]['departure_Time']}',
                                            style:
                                                new TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' ${data['transhipment_Details'][index]['from']}',
                                            style:
                                                new TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(10, 1, 1, 1),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.arrow_downward,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.location_on,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' ${data['transhipment_Details'][index]['to']}',
                                            style:
                                                new TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.access_time,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' Arrival: ${data['transhipment_Details'][index]['arrival_Time']}',
                                            style:
                                                new TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.forward,
                                            color: Colors.orange.shade300,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' ${data['transhipment_Details'][index]['remark']}',
                                            style:
                                                new TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              );
            } else if (!snapShot.hasData) {
              return Center(child: Image.asset("loader.gif"));
            }
          }),
    );
  }
}

Future<Map> getUser(String gstno) async {
  String url = 'http://103.109.78.143:82/api/Order/TrackOrder/$gstno';

  //Map<String,String> headers = {
  //  'Authorization' : 'bearer Kmocn1U47iGGxm7kfrsoecQlYjFxtf6cuuLvzm_k71O8nUylQ0IZfjoMBqQpm4VcM8IXbCnlrheFOAlDxENc-Vp-gELnGxQyI2vHf9B2qDCzDYV1EwjqmE2v9naAPQhJxZrX8l2zpxnC4FgApqC16hxmJCwdCFVke62SqdzJoyGGv_E5xlD7ULRRTp69HOFM9Xd4HF8bgALbdsRXvqeVwJzEFYeyznwICnoq6wpVF85SdYNOeYnh-pHmtAYxAPuaBa5LHqMiEs9T2AK1AodWBeQIu8-o7NmZ8d_DFe6UVZzUOrMuJy2FmtgGahqhl8rI0w5W-1EDSvZpTlRcQjIvhw'
  //};

  http.Response response = await http.get(url);
  var gg = json.decode(response.body);
  print(gg);
  return json.decode(response.body);
}
