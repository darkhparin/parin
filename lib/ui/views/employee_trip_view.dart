import 'package:cwl/models/application/index.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/models/branch/BranchModel.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/viewmodels/employee_trip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class BranchListView extends StatefulWidget {
  BranchListView({Key key}) : super(key: key);
  @override
  _BranchListViewState createState() => _BranchListViewState();
}

class _BranchListViewState extends State<BranchListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BranchListViewModel>.withConsumer(
      viewModelBuilder: () => BranchListViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Branch Active Trip',
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
        // drawer: AppDrawer(model.appVersion),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getBrnaches(context, model),
              model.busy ? showLoading() : branchTripList(context, model),
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
        color: Colors.lightBlue[50],
      ),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      height: 50,
      child: new DropdownButton<BranchModel>(
        value: model.branchlist,
        hint: Text(' Select Branch'),
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
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () {},
                              child: Text("Departure"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () {},
                              child: Text("Arrive"),
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
