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

class RateCalchView extends StatefulWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  _RateCalchViewState createState() => _RateCalchViewState();
}

var _picupPin = TextEditingController();
var _deliveryPin = TextEditingController();
var _chargedWeight = TextEditingController();
var _actualWeight = TextEditingController();
var _qty = TextEditingController();
var _InvoiceValue = TextEditingController();

class _RateCalchViewState extends State<RateCalchView> {
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
            'Rate Calculator',
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
            child: new SingleChildScrollView(
                child: new Column(children: [
              //  new Image.asset('assets/tracking.png',  scale: 3.0, width: 60.0, height: 60.0),

              new TextFormField(
                maxLength: 6,
                controller: _picupPin,
                decoration: new InputDecoration(
                  labelText: "Pickup Pincode",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.vertical(
                        bottom: Radius.circular(20.0)),
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

              new TextFormField(
                maxLength: 6,
                controller: _deliveryPin,
                decoration: new InputDecoration(
                  labelText: "Delivery Pincode",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0)),
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

              new TextFormField(
                maxLength: 11,
                controller: _chargedWeight,
                decoration: new InputDecoration(
                  labelText: "Total Weight",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0)),
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

              new TextFormField(
                maxLength: 5,
                controller: _actualWeight,
                decoration: new InputDecoration(
                  labelText: "Total Actual Weight",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0)),
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

              new TextFormField(
                maxLength: 3,
                controller: _qty,
                decoration: new InputDecoration(
                  labelText: "Total Quantity",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0)),
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

              new TextFormField(
                maxLength: 10,
                controller: _InvoiceValue,
                decoration: new InputDecoration(
                  labelText: "Invoice Value",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20.0)),
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
                    child: new Text('Calculate'),
                    elevation: 7.0,
                    splashColor: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.0))),
                    color: Color.fromARGB(1411, 2222, 3333, 8888),
                    colorBrightness: Brightness.dark,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => RateCalcnew(
                            picup: _picupPin.text,
                            dili: _deliveryPin.text,
                            charged: _chargedWeight.text,
                            actual: _actualWeight.text,
                            qty: _qty.text,
                            invoice: _InvoiceValue.text,
                          ),
                        ))),
              ),
            ])),
          ),
        )),
      ),
    );
  }
}

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      "Something Went Wrong, Try Again",
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.red),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return getErrorWidget(context, errorDetails);
        };

        return widget;
      },
    );
  }
}
//-------------------------Error Mag-------------------

//---------------------------------------------------------- NEW PAGE--------------------------------------------------------
class RateCalcnew extends StatefulWidget {
  String picup, dili, charged, actual, qty, invoice;
  RateCalcnew(
      {this.picup,
      this.dili,
      this.charged,
      this.actual,
      this.qty,
      this.invoice});

  @override
  _RateCalcnewState createState() => _RateCalcnewState();
}

class _RateCalcnewState extends State<RateCalcnew> {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    var mobileheight = MediaQuery.of(context).size.height;
    var mobilewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: new FutureBuilder(
          future: getUser(widget.picup, widget.dili, widget.charged,
              widget.actual, widget.qty, widget.invoice),
          builder: (context, snapShot) {
            Map data = snapShot.data;

            if (snapShot.hasError) {
              print(snapShot.error);
              return Text(
                'Something Was Wrong Try Again.',
                textScaleFactor: 2.0,
              );
            } else if (snapShot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          new Card(
                            child: new Column(
                              children: <Widget>[
                                Image.network(
                                  "http://countrywidelogistics.in:81/AppContent/Images/Mob_App/rate_calc.gif",
                                ),
                                Wrap(
                                  spacing: 5.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('C')),
                                      label: Text(
                                          'Total Weight: ${data['totalChargedWeight']}'),
                                    ),
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('A')),
                                      label: Text(
                                          'Actual Weight: ${data['totalActualWeight']}'),
                                    ),
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('Q')),
                                      label: Text('Qty: ${data['totalQty']}'),
                                    ),
                                    Chip(
                                      elevation: 5.0,
                                      avatar: CircleAvatar(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          child: Text('I')),
                                      label: Text(
                                          'Invoice Value: ${data['invoiceValue']}'),
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
                                            '${data['originBranch']['name']}'
                                            ' - '
                                            '${data['pickupPincode']}'
                                            '-'
                                            '${data['opaDistance']} Km',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink),
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
                                            ' ${data['destinationBranch']['name']}'
                                            ' - '
                                            '${data['deliveryPincode']}'
                                            '-'
                                            '${data['odaDistance']} Km',
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
                                            Icons.wrap_text,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            'Total: ${data['tripDistance']}',
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
                                Wrap(
                                  spacing: 5.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Freight: ${data['chargeableFreight']}                              '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Fuel Surcharge: ${data['fuelSurcharge']}                  '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Fov Charge: ${data['fovCharge']}                             '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Docket Charge: ${data['docketCharge']}                       '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Pickup Charge: ${data['opaCharge']}                             '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'Delivery Charge: ${data['odaCharge']}                   '),
                                    ),
                                    Chip(
                                      elevation: 8.0,
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Text('')),
                                      label: Text(
                                          'GST Charge: ${data['gstCharge']}                     '),
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
                                            Icons.done_all,
                                            color: Colors.green,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            ' Total: ${data['finalFreight']} (Approx)',
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
                                            Icons.mail,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            '${data['email_PickupBranch']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.pink),
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
                                            Icons.mail,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: new Text(
                                            '${data['email_DeliveryBranch']}',
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.blue),
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
              return new Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Future<Map> getUser(String picup, String dili, String charged, String actual,
    String qty, String invoice) async {
  String url =
      'http://countrywidelogistics.in:82/api/Order/GetRateCalculation?PickupPincode=$picup&DeliveryPincode=$dili&totalChargedWeight=$charged&TotalActualWeight=$actual&TotalQty=$qty&InvoiceValue=$invoice';
//
//  Map<String,String> headers = {
//    'Authorization' : 'bearer 8QrPrU3xNNhbIXl0BSg2BjpQRBJaZY61NGwT582hO7Ak41jLw5lnQQj1JfYnXHRUT6mqvKmFK45l7x6Ql-CPbhXpLALGCfVuofaYlbKFhjpiPg8EZtKUVheAsOT9fG0SQo46Y_OoTKTL-AHwA79ourMSMeMnvYDYZEvwaFv0wNse--Rn3dwu6bS34AIJIj0xx7VCO3V4goJeIiRS41fBxHdSu_pzz-FRnLcPyxkikBnnIcB0FyOmFRmHn0V05hUGeSWLwchp3ugUAla7sKjo3N8HvTdjInwlwojEq-1K9oaAiQ-mUJHTfStwuh6lJDfBgPnnE-nldK-Njl0yJa_i7w'
//  };

  print(url);
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
