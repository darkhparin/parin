import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/animation.dart';
import 'package:cwl/ui/widgets/bottom_sheet.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/trip_Depart_driver_view_Model.dart';
import 'package:cwl/viewmodels/tripupdate_driver_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

class TripDepartDriverView extends StatefulWidget {
  final int _tripId;

  TripDepartDriverView({@required int tripId, Key key})
      : _tripId = tripId,
        super(key: key);

  @override
  _TripDepartDriverViewState createState() => _TripDepartDriverViewState();
}

class _TripDepartDriverViewState extends State<TripDepartDriverView> {
  // final docketnumberController = TextEditingController();

  // clearDocketInput() {
  //   docketnumberController.clear();
  // }
  final sealnoController = TextEditingController();
  final readingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TripDepartDriverViewModel>.withConsumer(
      viewModel: TripDepartDriverViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(widget._tripId),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Depart Trip'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop('Redirected'),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              model.busy ? showLoading() : wayBillList(context, model),
              createCansolwaybill(context, model),
              model.consolidatedEwayBill != null
                  ? model.consolidatedEwayBillResponce == 0
                      ? empty()
                      : departTripSave(model)
                  : departTripSave(model)
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

  Widget empty() {
    return Center(
      heightFactor: 5,
    );
  }

  Widget wayBillList(context, TripDepartDriverViewModel model) {
    return Column(
      children: <Widget>[
        FadeAnimation(
          1,
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
                itemCount: model?.consilidatedEwayBillListDetails?.length,
                itemBuilder: (BuildContext ctxt, int idx) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        ExpansionTile(
                          title: Text(
                            "Docket No: ${model.consilidatedEwayBillListDetails[idx].docketNo}   \nE- Way Bill: (${model.consilidatedEwayBillListDetails[idx].ewayBillNo})",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(
                            Icons.assignment,
                            size: 50,
                            color: Colors.blue,
                          ),
                          trailing: Icon(
                            model.consilidatedEwayBillListDetails[idx]
                                        .ewayBillStatus ==
                                    "Active"
                                ? Icons.check_circle_outline
                                : Icons.close,
                            size: 35,
                          ),
                          backgroundColor: Colors.green[50],
                          tilePadding: EdgeInsets.all(5),
                          subtitle: (Text(
                            'E-Way Bill Status: ${model.consilidatedEwayBillListDetails[idx].ewayBillStatus}',
                            style: TextStyle(color: Colors.green),
                          )),
                          children: <Widget>[
                            Container(
                                height: 130,
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
                                            '${model.consilidatedEwayBillListDetails[idx].from} TO ${model.consilidatedEwayBillListDetails[idx].to}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'ewayBill Date: ${model.consilidatedEwayBillListDetails[idx].ewayBillDate}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Valid Upto:  ${model.consilidatedEwayBillListDetails[idx].ewayBillValidUpto}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Invoice Value: ${model.consilidatedEwayBillListDetails[idx].totalInvoiceValue}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget createCansolwaybill(context, TripDepartDriverViewModel model) {
    return Container(
      child: Center(
        child: BusyButton(
          title: 'Create Way Bill',
          busy: model.busy,
          onPressed: () async {
            model.createConsolidatedEwayBill();
          },
        ),
      ),
    );
  }

  Widget departTripSave(TripDepartDriverViewModel model) {
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
                      placeholder: 'Enter Seal No ',
                      controller: sealnoController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) {
                        model.setsealno(text);
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
                    busy: model.busy,
                    title: 'Depart Trip',
                    onPressed: () async {
                      model.getDepartTripResponce();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
