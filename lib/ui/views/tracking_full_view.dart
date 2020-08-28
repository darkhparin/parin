import 'package:cwl/services/api_services.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/pincode_finder_view_model.dart';
import 'package:cwl/viewmodels/tracking_full_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

import 'guest_view.dart';

class DocketTrackingViewView extends StatefulWidget {
  @override
  _DocketTrackingViewViewState createState() => _DocketTrackingViewViewState();
}

class _DocketTrackingViewViewState extends State<DocketTrackingViewView> {
  TextEditingController docketnocontroller = TextEditingController();

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DocketTrackingViewModel>.withConsumer(
      viewModel: DocketTrackingViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Docket Tracking',
            style: TextStyle(color: Colors.white),
          ),
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
          centerTitle: true,
          backgroundColor: Colors.blue[500],
        ),
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: renderBody(model),
        ),
      ),
    );
  }

  Widget renderBody(DocketTrackingViewModel model) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Docket No'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InputField(
                        formatter: LengthLimitingTextInputFormatter(11),
                        placeholder: 'Enter Docket No',
                        controller: docketnocontroller,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (text) {
                          model.docketTrackingFUllResponce(text);
                        },
                      ),
                    ),
                  ],
                ),
                model.hasData ? docketCommanDetails(model) : renderNodata(),
              ]),
        ),
      ),
    );
  }

  Widget docketCommanDetails(DocketTrackingViewModel model) {
    final ApiService _apiService = locator<ApiService>();
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.blue[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),

          // height: screenSize.height/2.9,
          // width: screenSize.width/1,

          child: Card(
            elevation: 20,
            // color: Colors.lightGreen[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            margin: EdgeInsets.only(left: 2, right: 2, top: 0, bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: Text(
                              'DWB ${model.docketresponce.code}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 2, 0),
                            child: new Text(
                              '  (Q: ${model.docketresponce.qty})',
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              ' ${model.docketresponce.mode}',
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.arrow_downward,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.docketresponce.consignor}',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.deepOrangeAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.home,
                              color: Colors.blueAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.docketresponce.consignee}',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                  'Pay Mode: ${model.docketresponce.paymentMode}')),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                            // child: RaisedButton(
                            child: Text(
                              'Weight: ${model.docketresponce.weight} ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                            // child: RaisedButton(
                            child: Text(
                              'Freight: ${model.docketresponce.totalFreight} ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: Text(
                              'Booking: ${model.docketresponce.bookingDate}',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 2, 0),
                            child: new Text(
                              '  ${model.docketresponce.bookingStation}',
                              style: new TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: Text(
                              'Delivery: ${model.docketresponce.expDeliveryDate}',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 2, 0),
                            child: new Text(
                              '  ${model.docketresponce.deliveryStation}',
                              style: new TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: new Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Booking Remarks: ${model.docketresponce.bookingRemarks}',
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                                'Delivery Date: ${model.docketresponce.deliveryDate == null ? '00.00.0000' : model.docketresponce.deliveryDate}'),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 20, 20),
                            // child: RaisedButton(
                            child: Text(
                              '  ${model.docketresponce.dwbStatus} ',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  Divider(
                    height: 10,
                    color: Colors.blue,
                  ),
                  gettranshipmentDetails(model),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget gettranshipmentDetails(DocketTrackingViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: model.transhipmentDetails.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              return Container(
                height: 170,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: new AssetImage(
                        'assets/images/trip-update-background.jpg',
                      ),
                    ),
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //       "assets/images/trip-update-background.jpg"),
                    //   fit: BoxFit.cover,
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.all(8.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.all(0.0),
                                    child: Text(
                                      'Transhipment  ${model.transhipmentDetails[idx].sequenceNr}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                        new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: new Text(
                                      ' In ${model.transhipmentDetails[idx].vehicle}',
                                      style: new TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Text(
                            'From:   ${model.transhipmentDetails[idx].fromStation}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'TO:       ${model.transhipmentDetails[idx].toStation}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Trip: ${model.transhipmentDetails[idx].trip}  ||  ',
                                style: const TextStyle(color: Colors.black),
                              ),
                              new Text(
                                ' Weight: ${model.transhipmentDetails[idx].weight}  ||  ',
                                style: new TextStyle(color: Colors.black),
                              ),
                              new Text(
                                ' Qty: ${model.transhipmentDetails[idx].qty}  ||  ',
                                style: new TextStyle(color: Colors.black),
                              ),
                              new Text(
                                ' Hold: ${model.transhipmentDetails[idx].onHoldHours == null ? 0 : model.transhipmentDetails[idx].onHoldHours} Hours',
                                style: new TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dispatch Date: ${model.transhipmentDetails[idx].dispatchDate}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Arrival Date: ${model.transhipmentDetails[idx].arrivalDate}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "",
                        height: double.infinity,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget renderNodata() {
    return Container();
  }
}