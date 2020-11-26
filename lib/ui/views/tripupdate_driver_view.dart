import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/blinking_text.dart';
import 'package:cwl/ui/widgets/bottom_sheet.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/tripupdate_driver_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/ui/widgets/popup.dart';

class TripUpdateDriverView extends StatefulWidget {
  final int _tripId;

  TripUpdateDriverView({@required int tripId, Key key})
      : _tripId = tripId,
        super(key: key);

  @override
  _TripUpdateDriverViewState createState() => _TripUpdateDriverViewState();
}

class _TripUpdateDriverViewState extends State<TripUpdateDriverView> {
  final docketnumberController = TextEditingController();

  clearDocketInput() {
    docketnumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TripUpdateDriverViewModel>.withConsumer(
      viewModelBuilder: () => TripUpdateDriverViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(widget._tripId),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Trip Update '),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop('Redirected'),
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton:
            model.canPlan ? getFloatingButton(context, model) : Container(),
        body: model.busy ? showLoading() : getBody(context, model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: LoadingWidget(),
    );
  }

  Widget getBody(BuildContext context, TripUpdateDriverViewModel model) {
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
              BusyButton(
                  title: 'Depart Trip',
                  onPressed: () async {
                    model.canDepartTripButton();
                  }),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[200], Colors.white])),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: Text(
                      'Trip Routes (Count : ${model.tripRoutes.length}  )',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              getTripRouteList(model),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.orange[200], Colors.white])),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: BlinkingText(
                      'Truck Load (Count : ${model.truckLoads.length})',
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall,
              getTripTruckLoadList(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFloatingButton(
      BuildContext context, TripUpdateDriverViewModel model) {
    return FloatingActionButton(
      onPressed: () => {
        showPopup(context, _popupBody(context, model), 'Docket', model),
        // _showSignupModalSheet(context, model),
      },
      child: Icon(Icons.add),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
    );
  }

  Widget getFloatingButtonDepartTrip(
      BuildContext context, TripUpdateDriverViewModel model) {
    return FloatingActionButton(
      onPressed: () => {
        // _showSignupModalSheet(context, model),
      },
      child: Icon(Icons.art_track),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);

      if (barcodeScanRes.length >= 5) {
        setState(() {
          docketnumberController.text = barcodeScanRes;
        });
      } else {
        setState(() {
          docketnumberController.text = null;
        });
      }
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  /// Botoomsheet Test---------------------------

  void _showSignupModalSheet(context, TripUpdateDriverViewModel model) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
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
                    Text(
                      'Docket Plan In Your Current Trip',
                      style: TextStyle(fontSize: 18),
                    ),
                    verticalSpaceMedium,
                    Row(children: <Widget>[
                      Expanded(
                        child: InputField(
                          placeholder: 'Docket Number',
                          controller: docketnumberController,
                          textInputType: TextInputType.number,
                          onChanged: (text) => {
                            setState(() {
                              model.setcode(text);
                              if (docketnumberController.text.length == 7 ||
                                  docketnumberController.text.length == 11) {
                                model.getLoadDetails();
                              }
                            }),
                          },
                          validationMessage: model.errormsg,
                        ),
                      ),

                      /// Barcode Scaner Test---------------------------
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              size: 35,
                              color: Colors.red,
                            ),
                            onPressed: scanBarcode),
                      ),

                      /// Barcode Scaner Test---------------------------
                    ]),
                    verticalSpaceSmall,
                    Center(
                      child: FloatingActionButton.extended(
                        icon: Icon(Icons.menu),
                        label: Text('   Get Docket Details   '),
                        onPressed: () => {
                          Navigator.pop(context),
                          _showSignupModalSheet(context, model),
                        },
                      ),
                    ),
                    verticalSpaceMedium,
                    getLoadDetailsList(model),
                    verticalSpaceMedium,
                    model.loadDetailsList.length > 0
                        ? BusyButton(
                            title:
                                'Docket Plan in ${model.currentTripRoute.branch}',
                            busy: model.busy,
                            onPressed: () {
                              model.planLoadForDriver();
                              clearDocketInput();
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget getTripRouteList(TripUpdateDriverViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 24.0),
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.tripRoutes.length,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              margin: EdgeInsets.only(right: 5),
              height: 200,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                color: model.tripRoutes[index].branchColor.toLowerCase() ==
                        "green"
                    ? Colors.green
                    : model.tripRoutes[index].branchColor.toLowerCase() == "red"
                        ? Colors.red
                        : Colors.black,
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.withAlpha(50),
                                    blurRadius: 10.0),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${model.tripRoutes[index].seqNo}. ${model.tripRoutes[index].branch}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Arrival Time : ${model.tripRoutes[index].arrivalTime == null ? '\nWaiting...' : model.tripRoutes[index].arrivalTime}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Departure Time : ${model.tripRoutes[index].departureTime == null ? 'Waiting...' : model.tripRoutes[index].departureTime}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getTripTruckLoadList(TripUpdateDriverViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: model.truckLoads.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              return Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/trip-update-background.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withAlpha(100),
                            blurRadius: 10.0),
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
                            Text(
                              '${model.truckLoads[idx].fromBranch}  TO  ${model.truckLoads[idx].toBranch}',
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '  ${model.truckLoads[idx].packageType} (${model.truckLoads[idx].qty})',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '  ${model.truckLoads[idx].vehicleNo} Via ${model.truckLoads[idx].serviceType}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '  Total Weight ${model.truckLoads[idx].weight} KG',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '  (Docket No. ${model.truckLoads[idx].code})',
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
              // return Card(
              //   child: ListTile(
              //     trailing: IconButton(
              //       icon: FaIcon(
              //         FontAwesomeIcons.truck,
              //         color: Colors.green,
              //       ),
              //       onPressed: () {},
              //     ),
              //     title: Text(
              //         '${model.truckLoads[idx].loadType} (${model.truckLoads[idx].code})'),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }

  Widget getLoadDetailsList(TripUpdateDriverViewModel model) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: model.loadDetailsList.length,
        itemBuilder: (BuildContext ctxt, int idx) {
          return Card(
            child: ListTile(
              trailing: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.box,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              title: Text(
                  '${model.loadDetailsList[idx].loadType} Docket (${model.loadDetailsList[idx].code})'),
            ),
          );
        },
      ),
    );
  }

  ///--------------------testing Part -----------------------------------------------------------
  Widget _popupBody(context, TripUpdateDriverViewModel model) {
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
                Text(
                  'Docket Plan In Your Current Trip',
                  style: TextStyle(fontSize: 18),
                ),
                verticalSpaceMedium,
                Row(children: <Widget>[
                  Expanded(
                    child: InputField(
                      placeholder: 'Docket Number',
                      controller: docketnumberController,
                      textInputType: TextInputType.number,
                      onChanged: (text) => {
                        setState(() {
                          model.setcode(text);
                          if (docketnumberController.text.length == 7 ||
                              docketnumberController.text.length == 11 ||
                              docketnumberController.text.length == 6) {
                            model.getLoadDetails();
                          }
                        }),
                      },
                      validationMessage: model.errormsg,
                    ),
                  ),

                  /// Barcode Scaner Test---------------------------
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 35,
                          color: Colors.red,
                        ),
                        onPressed: scanBarcode),
                  ),

                  /// Barcode Scaner Test---------------------------
                ]),
                verticalSpaceSmall,
                Center(
                  child: FloatingActionButton.extended(
                    icon: Icon(Icons.arrow_forward),
                    label: Text('   NEXT   '),
                    onPressed: () => {
                      model.getLoadDetailsByScanner(docketnumberController),
                      Navigator.pop(context),
                      _showSignupModalSheet(context, model),
                    },
                  ),
                ),
                verticalSpaceMedium,
                // getLoadDetailsList(model),
                verticalSpaceMedium,
                // model.loadDetailsList.length > 0
                //     ? BusyButton(
                //         title:
                //             'Docket Plan in ${model.currentTripRoute.branch}',
                //         busy: model.busy,
                //         onPressed: () {
                //           model.planLoadForDriver();
                //           clearDocketInput();
                //         },
                //       )
                //     : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  showPopup(BuildContext context, Widget widget, String title,
      TripUpdateDriverViewModel model,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 50,
        child: PopupContent(
          content: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
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
