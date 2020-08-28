import 'package:barcode_scan/barcode_scan.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/services/api_services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:convert';
import 'package:cwl/services/navigation_service.dart';
import '../locator.dart';

class UploadPODView extends StatefulWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  UploadPODViewState createState() => new UploadPODViewState();
}

class UploadPODViewState extends State<UploadPODView> {
  String result = 'Tap POD Scan Button to Get POD Number';
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {}
    if (11 == result.length) {
      setState(() {
        result = result;
      });
    } else {
      setState(() {
        result = " ALERT : Scane Once Again";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delhivery Update',
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
      body: new FutureBuilder(builder: (context, snapShot) {
        return Center(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
// -----------------------------Start Sacn Process ------------------------------

                    new Container(
                      height: 20,
                    ),

                    new Card(
                      child: new Column(
                        children: <Widget>[
                          Text('Scane POD',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 15))
                        ],
                      ),
                    ),

                    new Card(
                      elevation: 30.0,
                      child: new Column(
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.all(10.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.camera,
                                      color: Colors.orange.shade300,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Center(
                                      child: Text(result,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.orange,
                                              fontSize: 18)),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          new SizedBox(
                            width: 270,
                            height: 35,
                            child: new RaisedButton(
                                child: new Text('POD Scan'),
                                elevation: 9.0,
                                splashColor: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0)),
                                color: Colors.green,
                                colorBrightness: Brightness.dark,
                                onPressed: _scanQR),
                          ),
                        ],
                      ),
                    ),

                    new Container(
                      height: 50,
                    ),
                    new SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: new RaisedButton(
                          child: new Text(
                            'Next ->',
                            style: TextStyle(fontSize: 18),
                          ),
                          elevation: 9.0,
                          splashColor: Colors.blue,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.vertical(
                                  bottom: Radius.circular(20.0))),
                          color: Colors.pink,
                          colorBrightness: Brightness.dark,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => UserInfonew(
                                  result: result,
                                ),
                              ))),
                    ),
                  ],
                );
              }),
        );
      }),
    );
  }
}

class UserInfonew extends StatefulWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  String result;
  UserInfonew({this.result});

  @override
  _UserInfonewState createState() => _UserInfonewState();
}

class _UserInfonewState extends State<UserInfonew> {
//  var _amount = TextEditingController();

  File image;

  Future getImage() async {
    File picture = await ImagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 1100.0, maxHeight: 9000.0);
    setState(() {
      image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mobileheight = MediaQuery.of(context).size.height;
    var mobilewidth = MediaQuery.of(context).size.width;

//    _amount.text = '0.0';
    return Scaffold(
      appBar: AppBar(
        title: Text('Read'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: new FutureBuilder(
          future: docketSerach(widget.result),
          builder: (context, snapShot) {
            Map data = snapShot.data;

            if (snapShot.hasError) {
              print(snapShot.error);

              return Text(
                'Something Was Wrong Try Again.',
                textScaleFactor: 2.0,
              );
            } else if (snapShot.hasData) {
              var dileverd = data['message'];
              var orderid1 = data['order_Id'];

              if (dileverd == "Order Already Delivered !") {
                return Center(
                  child: Text(
                    'POD Already Delivered ',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              }

              if (dileverd == "Upload This POD From Desktop App ") {
                return Center(
                  child: Text(
                    'Upload This POD From Desktop App ',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              }

              if (data['message'] == "Provide Valid Docket No") {
                return Center(
                  child: Text(
                    'Provide Valid Docket No',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              }
              if (data['message'] == "Rate card not found !") {
                return Center(
                  child: Text(
                    'Upload This POD From Desktop App ',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              }

//----------------------------If True------------------
              if (data['isDeliveryInvoiceCreated'] == true) {
                return Center(
                  child: new Card(
                    child: new SingleChildScrollView(
                      child: new Column(
                        children: <Widget>[
                          Wrap(
                            spacing: 5.0, // gap between adjacent chips
                            runSpacing: 0.0, // gap between lines
                            children: <Widget>[
                              Chip(
                                elevation: 5.0,
                                avatar: CircleAvatar(
                                    backgroundColor: Colors.orange.shade100,
                                    child: Text('D')),
                                label: Text('DocketNo: ${data['docketNo']}'),
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
                                      Icons.business_center,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: new Text(
                                      '${data['party']}',
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.pink),
                                    ),
                                  ),
                                ],
                              )),

                          //image select
                          new Card(
                            elevation: 30.0,
                            child: new Column(
                              children: <Widget>[
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.add_a_photo,
                                            color: Colors.orange.shade300,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: image == null
                                              ? Text(
                                                  'Tap Capture Button to Take a Picture',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.orange,
                                                      fontSize: 15))
                                              : Image.file(image),
                                        ),
                                      ],
                                    )),
                                new SizedBox(
                                  width: 270,
                                  height: 35,
                                  child: new RaisedButton(
                                      child: new Text('Capture POD Image'),
                                      elevation: 9.0,
                                      splashColor: Colors.blue,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.0)),
                                      color: Colors.green,
                                      colorBrightness: Brightness.dark,
                                      onPressed: getImage),
                                ),
                              ],
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
                                elevation: 7.0,
                                splashColor: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Color.fromARGB(1411, 2222, 3333, 8888),
                                colorBrightness: Brightness.dark,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => IfTrue(
                                        orderid: orderid1,
                                        image: image,
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

//----------------------------If Null---------------------
              if (data['deliveryInvoice'] == null) {
                return Center(
                  child: new Card(
                    child: new SingleChildScrollView(
                      child: new Column(
                        children: <Widget>[
                          Wrap(
                            spacing: 5.0, // gap between adjacent chips
                            runSpacing: 0.0, // gap between lines
                            children: <Widget>[
                              Chip(
                                elevation: 5.0,
                                avatar: CircleAvatar(
                                    backgroundColor: Colors.orange.shade100,
                                    child: Text('D')),
                                label: Text('DocketNo: ${data['docketNo']}'),
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
                                      Icons.business_center,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: new Text(
                                      '${data['party']}',
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.pink),
                                    ),
                                  ),
                                ],
                              )),
//Enter Ammount  Remove Amount Text Box (Jatin Sir)

//                        new TextFormField(
//                          maxLength: 11,
//                          controller: _amount,
//
//                          decoration: new InputDecoration(
//                            labelText: "Enter Amount ",
//                            fillColor: Colors.white,
//                            border: new OutlineInputBorder(
//                              borderRadius: new BorderRadius.circular(25.0),
//                              borderSide: new BorderSide(
//                              ),
//                            ),
//                            //fillColor: Colors.green
//                          ),
//                          keyboardType: TextInputType.number,
//                          style: new TextStyle(
//                            fontFamily: "Poppins",
//                            fontSize: 20.0,
//                            color: Colors.pink,
//                          ),
//                        ),

                          //image select
                          new Card(
                            elevation: 30.0,
                            child: new Column(
                              children: <Widget>[
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.add_a_photo,
                                            color: Colors.orange.shade300,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: image == null
                                              ? Text(
                                                  'Tap Capture Button to Take a Picture',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.orange,
                                                      fontSize: 15))
                                              : Image.file(image),
                                        ),
                                      ],
                                    )),
                                new SizedBox(
                                  width: 270,
                                  height: 40,
                                  child: new RaisedButton(
                                      child: new Text('Capture POD Image'),
                                      elevation: 9.0,
                                      splashColor: Colors.blue,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.0)),
                                      color: Colors.green,
                                      colorBrightness: Brightness.dark,
                                      onPressed: getImage),
                                ),
                              ],
                            ),
                          ),

                          new Container(
                            height: 25,
                          ),

                          new SizedBox(
                            width: mobilewidth / 1.4,
                            height: mobileheight / 18,
                            child: new RaisedButton(
                                child: new Text('Submit'),
                                elevation: 7.0,
                                splashColor: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Color.fromARGB(1411, 2222, 3333, 8888),
                                colorBrightness: Brightness.dark,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => IfNull(
                                        orderid: orderid1,
                                        image: image,
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else
//-------------------------If False -------------------------

                return Center(
                  child: new Card(
                    child: new SingleChildScrollView(
                      child: new Column(
                        children: <Widget>[
                          Text(
                            'Note: ${data['deliveryInvoice']['invoice_Message']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                            ),
                          ),
                          Wrap(
                            spacing: 5.0, // gap between adjacent chips
                            runSpacing: 0.0, // gap between lines
                            children: <Widget>[
                              Chip(
                                elevation: 5.0,
                                avatar: CircleAvatar(
                                    backgroundColor: Colors.orange.shade100,
                                    child: Text('D')),
                                label: Text('DocketNo: ${data['docketNo']}'),
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
                                      Icons.business_center,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: new Text(
                                      '${data['party']}',
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.pink),
                                    ),
                                  ),
                                ],
                              )),
                          new Padding(
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      '${data['deliveryInvoice']['cost_ExcludingTax']} cost Ex.Tax',
                                      style: new TextStyle(
                                          fontSize: 15.0, color: Colors.orange),
                                    ),
                                  ),
                                ],
                              )),
                          new Padding(
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      '${data['deliveryInvoice']['cgst']} :CGST',
                                      style: new TextStyle(
                                          fontSize: 15.0, color: Colors.orange),
                                    ),
                                  ),
                                ],
                              )),
                          new Padding(
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      '${data['deliveryInvoice']['sgst']} :SGST',
                                      style: new TextStyle(
                                          fontSize: 15.0, color: Colors.orange),
                                    ),
                                  ),
                                ],
                              )),
                          new Padding(
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      '${data['deliveryInvoice']['total_GST']} :Total GST',
                                      style: new TextStyle(
                                          fontSize: 15.0, color: Colors.orange),
                                    ),
                                  ),
                                ],
                              )),
                          new Padding(
                              padding: new EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.toc,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      '${data['deliveryInvoice']['total']} :Total',
                                      style: new TextStyle(
                                          fontSize: 15.0, color: Colors.pink),
                                    ),
                                  ),
                                ],
                              )),
                          new Card(
                            elevation: 30.0,
                            child: new Column(
                              children: <Widget>[
                                new Padding(
                                    padding: new EdgeInsets.all(10.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Icon(
                                            Icons.add_a_photo,
                                            color: Colors.orange.shade300,
                                          ),
                                        ),
                                        new Padding(
                                          padding: new EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: image == null
                                              ? Text(
                                                  'Tap Capture Button to Take a Picture',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.orange,
                                                      fontSize: 15))
                                              : Image.file(image),
                                        ),
                                      ],
                                    )),
                                new SizedBox(
                                  height: 45,
                                  child: new RaisedButton(
                                    child: new Text(
                                      'Got Demurrage Contact H/O',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.yellow),
                                    ),
                                    elevation: 9.0,
                                    splashColor: Colors.blue,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0)),
                                    color: Colors.green,
                                    colorBrightness: Brightness.dark,
                                    onPressed: () {},
//                                      onPressed: getImage
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
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

// Test

//Test

Future<Map> docketSerach(String result) async {
  final ApiService _apiService = locator<ApiService>();
  var api = _apiService.token;

  String url =
      'http://countrywidelogistics.in:82/api/Order/GetDeliveryOrderDetailsAsync/$result';

  Map<String, String> headers = {'Authorization': '$api'};

  http.Response response = await http.get(url, headers: headers);
  print(response.body);
  return json.decode(response.body);
}

//---------if Null ------------------------------------------------------------------------
class IfNull extends StatefulWidget {
  File image;
  int orderid;
//  String amount;
  IfNull({this.image, this.orderid});

  @override
  _IfNullState createState() => _IfNullState();
}

final NavigationService _navigationService = locator<NavigationService>();

class _IfNullState extends State<IfNull> {
  @override
  Widget build(BuildContext context) {
    var mobileheight = MediaQuery.of(context).size.height;
    var mobilewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: new FutureBuilder(
          future: nullupload(
            widget.image,
            widget.orderid.toString(),
          ),
          builder: (context, snapShot) {
            Map data = snapShot.data;

            if (data.hashCode == 200) {
              return Center(
                child: Text(
                  'Done : File successfully Delivered !',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              );
            }

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
                      return Column();
                    }),
              );
            } else if (!snapShot.hasData) {
              return new Center(
                child: new RaisedButton(
                  onPressed: () {
                    _navigationService.navigateReplacementTo(GuestViewRoute);
                    //Navigator.pop(context);
                  },
                  child: new Text('Countinue'),
                  elevation: 7.0,
                  splashColor: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.orange,
                  colorBrightness: Brightness.dark,
                ),
              );
            }
          }),
    );
  }
}

nullupload(
  File image,
  String orderid,
) async {
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
  // get file length
  var length = await image.length();

  // string to uri
  var uri = Uri.parse("http://countrywidelogistics.in:82/api/Upload/pod");

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(image.path));

  print(image.path);

  // add file to multipart
  request.files.add(multipartFile);

  Map<String, String> Data1 = {
    'order_id': orderid,
    'create_inv': '0',
    'extra_amt': '0'
  };
  // key 'order_id' : '1'
  print(Data1);
  request.fields.addAll(Data1);

  final ApiService _apiService = locator<ApiService>();
  var api = _apiService.token;

  Map<String, String> headers = {'Authorization': '$api'};

  request.headers.addAll(headers);
  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}

//---------if True ------------------------------------------------------------------------------
class IfTrue extends StatefulWidget {
  File image;
  int orderid;

  IfTrue({this.image, this.orderid});

  @override
  _IfTrueState createState() => _IfTrueState();
}

class _IfTrueState extends State<IfTrue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: new FutureBuilder(
          future: trueupload(widget.image, widget.orderid.toString()),
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
                      return Column();
                    }),
              );
            } else if (!snapShot.hasData) {
              return new Center(
                child: new RaisedButton(
                  onPressed: () {
                    _navigationService.navigateReplacementTo(GuestViewRoute);
                    //Navigator.pop(context);
                  },
                  child: new Text('Countinue'),
                  elevation: 7.0,
                  splashColor: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.orange,
                  colorBrightness: Brightness.dark,
                ),
              );
            }
          }),
    );
  }
}

trueupload(File image, String orderid) async {
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
  // get file length
  var length = await image.length();

  // string to uri
  var uri = Uri.parse("http://countrywidelogistics.in:82/api/Upload/pod");

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(image.path));

  // add file to multipart
  request.files.add(multipartFile);

  Map<String, String> mymap = {
    'order_id': orderid,
    'create_inv': '0',
    'extra_amt': '0'
  };
  // key 'order_id' : '1'
  print(mymap);
  request.fields.addAll(mymap);

  final ApiService _apiService = locator<ApiService>();
  var api = _apiService.token;

  Map<String, String> headers = {'Authorization': '$api'};

  request.headers.addAll(headers);
  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}

//---------if False ------------------------------------------------------------------------
class IfFalse extends StatefulWidget {
  File image;
  int orderid;
//  String amount;
  IfFalse({this.image, this.orderid});

  @override
  _IfFalseState createState() => _IfFalseState();
}

class _IfFalseState extends State<IfFalse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: new FutureBuilder(
          future: falseupload(widget.image, widget.orderid.toString()),
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
                      return Column();
                    }),
              );
            } else if (!snapShot.hasData) {
              return new Center(
                child: new RaisedButton(
                  onPressed: () {
                    _navigationService.navigateReplacementTo(GuestViewRoute);
                    //Navigator.pop(context);
                  },
                  child: new Text('Countinue'),
                  elevation: 7.0,
                  splashColor: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.orange,
                  colorBrightness: Brightness.dark,
                ),
              );
            }
          }),
    );
  }
}

falseupload(
  File image,
  String orderid,
) async {
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
  // get file length
  var length = await image.length();

  // string to uri
  var uri = Uri.parse("http://countrywidelogistics.in:82/api/Upload/pod");

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(image.path));

  // add file to multipart
  request.files.add(multipartFile);

  Map<String, String> mymap = {
    'order_id': orderid,
    'create_inv': '0',
    'extra_amt': '0'
  };
  // key 'order_id' : '1'
  print(mymap);
  request.fields.addAll(mymap);

  final ApiService _apiService = locator<ApiService>();
  var api = _apiService.token;

  Map<String, String> headers = {'Authorization': '$api'};

  request.headers.addAll(headers);
  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
