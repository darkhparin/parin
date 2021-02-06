import 'package:cwl/services/api_services.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/pincode_finder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

import 'guest_view.dart';

class PincodeServiceabilityView extends StatelessWidget {
  TextEditingController pincodeServiceabilitycontroller =
      TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PincodeFinderViewModel>.withConsumer(
      viewModelBuilder: () => PincodeFinderViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Find Pincodes',
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

  Widget renderBody(PincodeFinderViewModel model) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Pincode'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InputField(
                        formatter: LengthLimitingTextInputFormatter(6),
                        placeholder: 'Pincode',
                        controller: pincodeServiceabilitycontroller,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (text) {
                          model.getPincodeResponce(text);
                        },
                      ),
                    ),
                  ],
                ),
                model.hasData ? renderPincodeDetails(model) : renderNodata(),
                model.odaSlab.length > 0 ? getIsODAlist(model) : renderNodata(),
              ]),
        ),
      ),
    );
  }

  Widget renderPincodeDetails(PincodeFinderViewModel model) {
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                              '${model.pincoderesponce?.pincode}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Text(
                              ' ${model.pincoderesponce?.isServicible == true ? 'Pincode Serviceable' : model.pincoderesponce?.isServicible}',
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
                              Icons.home,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.pincoderesponce?.branch} Branch',
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
                              Icons.airport_shuttle,
                              color: Colors.blueAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.pincoderesponce?.distance} KM',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: InputField(
                              placeholder: 'Enter Weight in KG',
                              controller: null,
                              textInputType: TextInputType.number,
                              onChanged: (text) {
                                model.filterODASlab(text);
                              },
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                            // child: RaisedButton(
                            child: Text(
                              '  ${model.pincoderesponce?.isoda == false ? 'NO Charge' : 'ODA Applicable'} ',
                              style: TextStyle(color: Colors.black),
                            ),
                            //   elevation: 10,
                            //   color: Colors.deepPurple,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(8))),
                            // ),
                          ),
                        ],
                      )),
                  Divider(
                    height: 10,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getIsODAlist(PincodeFinderViewModel model) {
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: model.odaSlab.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                elevation: 20,
                // color: Colors.lightGreen[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                child: Text(
                                  ' Distance = ${model.odaSlab[index].distnaceStartIndex} KM TO ${model.odaSlab[index].distanceEndIndex} KM',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
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
                                  Icons.border_inner,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              new Padding(
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: new Text(
                                  ' Weight = ${model.odaSlab[index].weightStartIndex} KG TO ${model.odaSlab[index].weightEndIndex} KG',
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.deepOrangeAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      new Padding(
                          padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Padding(
                                padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                                // child: RaisedButton(
                                child: Text(
                                  ' ODA Charge = ${model.odaSlab[index].charge} Rupee',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //   elevation: 10,
                                //   color: Colors.deepPurple,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(8))),
                                // ),
                              ),
                            ],
                          )),
                      Divider(
                        height: 10,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget renderNodata() {
    return Container();
  }
}
