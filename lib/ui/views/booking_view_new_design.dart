import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider_architecture/provider_architecture.dart';

import 'guest_view.dart';

class BookingView1 extends StatefulWidget {
  BookingView1({Key key}) : super(key: key);

  @override
  _BookingView1State createState() => _BookingView1State();
}

class _BookingView1State extends State<BookingView1> {
  final docketnoController = TextEditingController();
  final deliverypincodeController = TextEditingController();
  final ewaybillNoController = TextEditingController();
  final productTypeController = TextEditingController();
  final packageTypeController = TextEditingController();
  final qtyController = TextEditingController();
  final totalweightController = TextEditingController();
  final olgLengthController = TextEditingController();
  final olgwidthController = TextEditingController();
  final olgheightController = TextEditingController();
  final miscController = TextEditingController();
  final loadingController = TextEditingController();
  final unloadingController = TextEditingController();
  final fuelSurchargePercentController = TextEditingController();
  final fovController = TextEditingController();

  GlobalKey autocmptkeyproducttype =
      new GlobalKey<AutoCompleteTextFieldState<Commonmodel>>();

  GlobalKey autocmptkeypackagetype =
      new GlobalKey<AutoCompleteTextFieldState<Commonmodel>>();

  File _image;

  Widget row(Commonmodel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            item.name,
            style: TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> scanBarcode(BookingViewModel model) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      if (barcodeScanRes.length >= 7 && barcodeScanRes.length <= 11) {
        docketnoController.text = barcodeScanRes;
        model.getDocektNoResponce(barcodeScanRes);
      } else {
        docketnoController.text = '';
        model.setdocketnoresponce(null);
        model.seterrordocketno(null);
      }
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.blue[300]),
      borderRadius: BorderRadius.all(
          Radius.circular(6.0) //         <--- border radius here
          ),
    );
  }

  List<String> _checked = []; //["A", "B"]; For COD DACC
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BookingViewModel>.withConsumer(
      viewModelBuilder: () => BookingViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Order Booking'),
          centerTitle: true,
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
        backgroundColor: Colors.white,
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            physics: ScrollPhysics(), // Fro All Scroll
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bookingPart1(model),
                    typespart2(model),
                    ratePart3(model),
                    orderLinePart4(model),
                    documentPart5(model),
                    verticalSpaceMedium,
                    model.ratecalculationresponce?.totalCharge != null
                        ? finalRate(model)
                        : blanckSize(),
                    verticalSpaceLarge,
                    model.ratecalculationresponce?.totalCharge != null
                        ? saveButton(model)
                        : blanckSize(),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget saveButton(BookingViewModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: BusyButton(
          title: 'Save Booking',
          busy: model.busy,
          onPressed: () async {
            model.saveOrder(_image.path);
          }),
    );
  }

  Widget blanckSize() {
    return SizedBox(
      height: 0,
      width: 0,
    );
  }

  Future getImagefromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      //Cropping the image

      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxWidth: 1054,
        maxHeight: 610,
      );

      if (croppedFile != null) {
        //Compress the image

        var result = await FlutterImageCompress.compressAndGetFile(
          croppedFile.path,
          '${Directory.systemTemp.path}/tmp.jpeg',
          quality: 50,
        );

        setState(() {
          _image = result;
          print(_image.lengthSync());
        });
      }
    }
  }

  Future getImagefromGallary() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      //Cropping the image

      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxWidth: 1054,
        maxHeight: 610,
      );

      if (croppedFile != null) {
        //Compress the image

        var result = await FlutterImageCompress.compressAndGetFile(
          croppedFile.path,
          '${Directory.systemTemp.path}/tmp.jpeg',
          quality: 50,
        );

        setState(() {
          _image = result;
          print(_image.lengthSync());
        });
      }
    }
  }

  Widget getConsignorSelection(BookingViewModel model) {
    if (model.ewaybillresponce != null) {
      if (model.ewaybillresponce.consignor_IsURP ||
          model.ewaybillresponce.consignors.length <= 0) {
        return BusyButton(
            title: 'Add Consignor',
            busy: model.busy,
            onPressed: () {
              model.navigateToAddParty(
                  branch: model.docketnoresponce?.bookingBranch,
                  branchId: model.docketnoresponce?.bookingBranchId,
                  gstin: model
                      .ewaybillresponce?.allEwayBills?.first?.consignorGSTIN,
                  isURP: model.ewaybillresponce.consignor_IsURP);
            });
      } else {
        return Container(
          height: 50,
          child: new DropdownButton<EwbParty>(
            value: model.consignor,
            hint: Text('Select Consignor'),
            isExpanded: true,
            style: TextStyle(color: Colors.deepPurple),
            items: model.consignors
                .map<DropdownMenuItem<EwbParty>>((EwbParty value) {
              return DropdownMenuItem<EwbParty>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
            onChanged: (EwbParty value) {
              model.setconsignor(value);
            },
          ),
        );
      }
    } else {
      return Container();
    }
  }

  Widget getConsigneeSelection(BookingViewModel model) {
    if (model.ewaybillresponce != null) {
      if (model.consignees.length <= 0) {
        return BusyButton(
            title: 'Add Consignee',
            busy: model.busy,
            onPressed: () {
              model.navigateToAddParty(
                  branch: model.ewaybillresponce?.deliveryBranch,
                  branchId: model.ewaybillresponce?.deliveryBranchId,
                  gstin: model
                      .ewaybillresponce?.allEwayBills?.first?.consigneeGSTIN,
                  pincode: model.ewaybillresponce
                      ?.deliveryPincode, // int.parse(model.deliveryPincode),(Change)
                  isURP: model.ewaybillresponce.consignor_IsURP);
            });
      } else {
        return Container(
          height: 50,
          child: new DropdownButton<EwbParty>(
            value: model.consignee,
            hint: Text('Select Consignee'),
            isExpanded: true,
            style: TextStyle(color: Colors.deepPurple),
            items: model.consignees
                .map<DropdownMenuItem<EwbParty>>((EwbParty value) {
              return DropdownMenuItem<EwbParty>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
            onChanged: (EwbParty value) {
              model.setconsignee(value);
            },
          ),
        );
      }
    } else {
      return Container();
    }
  }

  Widget checkDACCCOD(model) {
    return Row(
      children: [
        Text('COD Charge :    '),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
              model.setcodChargenotify(value);
            });
          },
        ),

        // CheckboxGroup(
        //   labels: <String>[
        //     "COD: ${model.ratecalculationresponce?.codCharge == null ? 0.00 : model.ratecalculationresponce?.codCharge}",
        //     "DACC: ${model.ratecalculationresponce?.daccCharge == null ? 0.00 : model.ratecalculationresponce?.daccCharge}",
        //   ],
        //   checked: _checked,
        //   onChange: (bool isChecked, String label, int index) =>
        //       print("isChecked: $isChecked   label: $label  index: $index"),
        //   onSelected: (List selected) => setState(() {
        //     if (selected.length > 1) {
        //       selected.removeAt(0);
        //       print('selected length  ${selected.length}');
        //     } else {
        //       print("only one");
        //     }
        //     _checked = selected;
        //   }),
        // ),
      ],
    );
  }

  Widget bookingPart1(BookingViewModel model) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(0.0),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(model.consignorpincode?.address != null
                        ? model.consigneepincode?.address != null
                            ? Icons.done_all
                            : Icons.error
                        : Icons.error),
                    Text(
                      "  Docket  ${docketnoController.text}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.looks_one,
                  size: 40,
                  color: Colors.blue[900],
                ),
                subtitle: Text(
                    '${model.docketnoresponce?.bookingBranch == null ? '' : model.docketnoresponce?.bookingBranch} To ${model.ewaybillresponce?.deliveryBranch == null ? '' : model.ewaybillresponce?.deliveryBranch}'),
                backgroundColor: Colors.orange[50],
                tilePadding: EdgeInsets.all(5),
                children: <Widget>[
                  Text('Enter Docket No'),
                  Row(children: <Widget>[
                    Expanded(
                      child: InputField(
                        formatter: LengthLimitingTextInputFormatter(11),
                        placeholder: 'Docket No',
                        controller: docketnoController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (text) {
                          model.getDocektNoResponce(text);
                          model.setdocketNoTextFild(text);
                        },
                        validationMessage: model.errordocketno,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () => scanBarcode(model),
                      ),
                    ),
                  ]),
                  verticalSpaceMedium,
                  Text('Enter EwayBill No'),
                  Row(children: <Widget>[
                    Expanded(
                      child: InputField(
                        placeholder: 'EwayBill No',
                        controller: ewaybillNoController,
                        textInputType: TextInputType.number,
                        onChanged: (text) {
                          model.setewayBillNo(text);
                        },
                        validationMessage: model.errorewaybillno,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: BusyButton(
                          title: 'Add',
                          busy: model.busy,
                          onPressed: () {
                            model.getEwayBillReaponce();
                          }),
                    ),
                  ]),
                  verticalSpaceMedium,
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/waybill-background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // decoration: myBoxDecoration(),
                    height: 150,
                    child: new ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Fro All Scroll
                        shrinkWrap: true, // Fro All Scroll
                        itemCount: model.ewayBillList.length,
                        itemBuilder: (BuildContext ctxt, int idx) {
                          return Card(
                            child: ListTile(
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  model.removeEwayBillNoatindex(idx);
                                },
                              ),
                              title: Text(model.ewayBillList[idx].toString()),
                            ),
                          );
                        }),
                  ),
                  Text(
                    'Total E-wayBill:  ${model.ewayBillList.length.toString()}',
                    style: TextStyle(color: Colors.red),
                  ),
                  verticalSpaceMedium,
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blue[200], Colors.white])),
                    height: 30,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          'Booking Branch  ${model.docketnoresponce?.bookingBranch == null ? '' : model.docketnoresponce?.bookingBranch}'),
                    ),
                  ),

                  getConsignorSelection(model),
                  verticalSpaceMedium,
                  Text(
                      'GSTIN : ${model.consignor?.gstNo == null ? '' : model.consignor?.gstNo}'),
                  verticalSpaceMedium,
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Pincodeshort>(
                      value: model.consignorpincode,
                      hint: Text(' Select Pincode'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.consignorpincodes
                          .map<DropdownMenuItem<Pincodeshort>>(
                              (Pincodeshort value) {
                        return DropdownMenuItem<Pincodeshort>(
                          value: value,
                          child: Text(value.pincode.toString()),
                        );
                      }).toList(),
                      onChanged: (Pincodeshort value) {
                        model.setconsignorpincode(value);
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text(
                      'Address : ${model.consignorpincode?.address == null ? '' : model.consignorpincode?.address}'),

                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.blue[200], Colors.white])),
                    height: 30,
                    width: double.infinity,
                    child: Center(),
                  ),

                  /// Booking Branch END--------------------------
                  verticalSpaceMedium,
                  verticalSpaceMedium,

                  /// Delivery Branch START--------------------------
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.orange[200], Colors.white])),
                    height: 30,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          'Delivery Branch  ${model.ewaybillresponce?.deliveryBranch == null ? '' : model.ewaybillresponce?.deliveryBranch}'),
                    ),
                  ),

                  model.canChangeDeliveryBranch
                      ? InputField(
                          placeholder: 'Delivery Pincode',
                          controller: deliverypincodeController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (text) {
                            model.setdeliveryPincode(text);
                          },
                        )
                      : getConsigneeSelection(model),

                  verticalSpaceMedium,
                  Text(
                      'GSTIN : ${model.consignee?.gstNo == null ? '' : model.consignee?.gstNo}'),
                  verticalSpaceMedium,
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Pincodeshort>(
                      value: model.consigneepincode,
                      hint: Text(' Select Pincode'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.consigneepincodes
                          .map<DropdownMenuItem<Pincodeshort>>(
                              (Pincodeshort value) {
                        return DropdownMenuItem<Pincodeshort>(
                          value: value,
                          child: Text(value.pincode.toString()),
                        );
                      }).toList(),
                      onChanged: (Pincodeshort value) {
                        model.setconsigneepincode(value);
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text(
                      'Address : ${model.consigneepincode?.address == null ? '' : model.consigneepincode?.address}'),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.orange[200], Colors.white])),
                    height: 30,
                    width: double.infinity,
                    child: Center(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget typespart2(BookingViewModel model) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(model.serviceType != null
                        ? model.paymentMode != null
                            ? model.transportAs != null
                                ? Icons.done_all
                                : Icons.error
                            : Icons.error
                        : Icons.error),
                    Text(
                      "  Types",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.looks_two,
                  size: 40,
                  color: Colors.blue[700],
                ),
                backgroundColor: Colors.orange[50],
                tilePadding: EdgeInsets.all(5),
                children: <Widget>[
                  Text('Service Type'),
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Commonmodel>(
                      value: model.serviceType,
                      hint: Text(' Select ServiceType'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.serviceTypes
                          .map<DropdownMenuItem<Commonmodel>>(
                              (Commonmodel value) {
                        return DropdownMenuItem<Commonmodel>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (Commonmodel value) {
                        model.setserviceType(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text('Payment Mode'),
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Commonmodel>(
                      value: model.paymentMode,
                      hint: Text(' Select Payment  Mode'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.paymentModes
                          .map<DropdownMenuItem<Commonmodel>>(
                              (Commonmodel value) {
                        return DropdownMenuItem<Commonmodel>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (Commonmodel value) {
                        model.setpaymentMode(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text('Transpoprt AS'),
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Commonmodel>(
                      value: model.transportAs,
                      hint: Text(' Select Transport As'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.transportAsList
                          .map<DropdownMenuItem<Commonmodel>>(
                              (Commonmodel value) {
                        return DropdownMenuItem<Commonmodel>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (Commonmodel value) {
                        model.settransportAs(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ratePart3(BookingViewModel model) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(model.rateCardRate > 0 ? Icons.done_all : Icons.error),
                    Text(
                      " Rate Card",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.looks_3,
                  size: 40,
                  color: Colors.blue[500],
                ),
                subtitle: Text(model.rateCardRate > 0
                    ? "Rate Card Charge ${model.rateCardRate}"
                    : ""),
                backgroundColor: Colors.orange[50],
                tilePadding: EdgeInsets.all(5),
                children: <Widget>[
                  Text('RateCard '),
                  Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    direction: Axis.vertical,
                    children: <Widget>[
                      Container(
                        decoration: myBoxDecoration(),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: new DropdownButton<Ratecardresponce>(
                          value: model.rateCard,
                          hint: Text(' Select RateCard'),
                          isExpanded: true,
                          style: TextStyle(color: Colors.deepPurple),
                          items: model.rateCards
                              .map<DropdownMenuItem<Ratecardresponce>>(
                                  (Ratecardresponce value) {
                            return DropdownMenuItem<Ratecardresponce>(
                              value: value,
                              child: Text(
                                value.rateCardName,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (Ratecardresponce value) {
                            model.setrateCard(value);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: BusyButton(
                            title: 'Refresh RateCard',
                            busy: model.busy,
                            onPressed: () {
                              model.getRateCardsAsync();
                            }),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Text('RateCard Charges :'),
                  Container(
                    decoration: myBoxDecoration(),
                    height: 100,
                    child: new ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Fro All Scroll
                        shrinkWrap: true, // Fro All Scroll
                        itemCount: model.rateCardCharges.length,
                        itemBuilder: (BuildContext ctxt, int idx) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                  model.rateCardCharges[idx].rate.toString()),
                            ),
                          );
                        }),
                  ),
                  verticalSpaceMedium,
                  Text(
                      'OPA Distance : ${model.rateCard?.opaDistance == null ? '' : model.rateCard?.opaDistance}'),
                  Text(
                      'ODA Distance : ${model.rateCard?.odaDistance == null ? '' : model.rateCard?.odaDistance}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget orderLinePart4(BookingViewModel model) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(model.orderLines.length > 0
                        ? Icons.done_all
                        : Icons.error),
                    Text(
                      " Order Line ",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.looks_4,
                  size: 40,
                  color: Colors.blue[400],
                ),
                subtitle: Text(model.orderLines.length > 0
                    ? 'Charged Weight ${model.orderLines?.first?.chargedWeight}'
                    : ''),
                backgroundColor: Colors.orange[50],
                tilePadding: EdgeInsets.all(5),
                children: <Widget>[
                  Text('Select Product Type'),
                  Container(
                    height: 50,
                    child: new DropdownButton<Commonmodel>(
                      value: model.productType,
                      isExpanded: true,
                      hint: Text('Select Product Type'),
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.productTypes
                          .map<DropdownMenuItem<Commonmodel>>(
                              (Commonmodel value) {
                        return DropdownMenuItem<Commonmodel>(
                          value: value,
                          child: Text(value.name.toString()),
                        );
                      }).toList(),
                      onChanged: (Commonmodel value) {
                        model.setproductType(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text('Select Package Type'),
                  Container(
                    height: 50,
                    child: new DropdownButton<Commonmodel>(
                      value: model.packageType,
                      isExpanded: true,
                      hint: Text('Select Package Type'),
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.packageTypes
                          .map<DropdownMenuItem<Commonmodel>>(
                              (Commonmodel value) {
                        return DropdownMenuItem<Commonmodel>(
                          value: value,
                          child: Text(value.name.toString()),
                        );
                      }).toList(),
                      onChanged: (Commonmodel value) {
                        model.setpackageType(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Text('Enter Quantity'),
                  InputField(
                    placeholder: 'Quantity of goods in Numbers',
                    controller: qtyController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (text) {
                      model.setqty(text);
                    },
                  ),
                  verticalSpaceMedium,
                  Text('Enter Actual Weight'),
                  InputField(
                    placeholder: 'Actual Weight',
                    controller: totalweightController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (text) {
                      model.settotalweight(text);
                    },
                  ),
                  verticalSpaceMedium,
                  Text('Shape Type :'),
                  Container(
                    decoration: myBoxDecoration(),
                    height: 50,
                    child: new DropdownButton<Shapemodel>(
                      value: model.shapeType,
                      hint: Text(' Select ShapeType'),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.shapeTypes.map<DropdownMenuItem<Shapemodel>>(
                          (Shapemodel value) {
                        return DropdownMenuItem<Shapemodel>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (Shapemodel value) {
                        model.setshapeType(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InputField(
                          placeholder: 'Legth',
                          controller: olgLengthController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: InputField(
                          placeholder: 'Height',
                          controller: olgheightController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: InputField(
                          placeholder: 'Width',
                          controller: olgwidthController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Unit : ',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 0,
                        groupValue: model.unit,
                        onChanged: (val) => model.setunit(val),
                      ),
                      new Text(
                        'In    ',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: model.unit,
                        onChanged: (val) => model.setunit(val),
                      ),
                      new Text(
                        'Cm    ',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: model.unit,
                        onChanged: (val) => model.setunit(val),
                      ),
                      new Text(
                        'Ft',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: BusyButton(
                        title: 'Add OrderLine',
                        busy: model.busy,
                        onPressed: () async {
                          model.addOrderLine(
                              length: olgLengthController.text == null
                                  ? ''
                                  : olgLengthController.text,
                              height: olgheightController.text == null
                                  ? ''
                                  : olgheightController.text,
                              width: olgwidthController.text == null
                                  ? ''
                                  : olgwidthController.text);
                        }),
                  ),
                  verticalSpaceMedium,
                  Container(
                    height: 100,
                    child: new ListView.builder(
                        itemCount: model.orderLines.length,
                        itemBuilder: (BuildContext ctxt, int idx) {
                          return Card(
                            child: ListTile(
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  model.removeOrderLineAtIndex(idx);
                                },
                              ),
                              title: Text(
                                  'Charged Weight : ${model.orderLines[idx].chargedWeight.toString()}'),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget documentPart5(BookingViewModel model) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(_image != null ? Icons.done_all : Icons.error),
                    Text(
                      "  Upload Documents ",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.looks_5,
                  size: 40,
                  color: Colors.blue[300],
                ),
                backgroundColor: Colors.orange[50],
                tilePadding: EdgeInsets.all(5),
                subtitle: _image != null ? Text('Image') : Text(''),
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                          'A/C Copy from Camera                A/C Copy from Gallery    '),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.blue[200],
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            InkWell(
                              child: Card(
                                child: Center(
                                  widthFactor: 2.1,
                                  child: _image != null
                                      ? Image.file(_image)
                                      : Icon(
                                          Icons.add_a_photo,
                                          size: 80,
                                          color: Colors.blue,
                                        ),
                                ),
                              ),
                              onTap: getImagefromCamera,
                            ),
                            InkWell(
                              child: Card(
                                child: Center(
                                  widthFactor: 2.1,
                                  child: _image != null
                                      ? Image.file(_image)
                                      : Icon(
                                          Icons.photo,
                                          size: 80,
                                          color: Colors.blue,
                                        ),
                                ),
                              ),
                              onTap: getImagefromGallary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget finalRate(BookingViewModel model) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange[50],
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0))),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text(
                  'Final Rate',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            'Rate : ${model.ratecalculationresponce?.rate == null ? 0.0 : model.ratecalculationresponce?.rate}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'Freight : ${model.ratecalculationresponce?.chargableFreight == null ? 0.0 : model.ratecalculationresponce?.chargableFreight}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'Fuel Surcharge : ${model.ratecalculationresponce?.fuelSurcharge == null ? 0.0 : model.ratecalculationresponce?.fuelSurcharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'Docket : ${model.ratecalculationresponce?.docketCharge == null ? 0.0 : model.ratecalculationresponce?.docketCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'POD : ${model.ratecalculationresponce?.podCharge == null ? 0.0 : model.ratecalculationresponce?.podCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'FOD : ${model.ratecalculationresponce?.fodCharge == null ? 0.0 : model.ratecalculationresponce?.fodCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'OPA : ${model.ratecalculationresponce?.opaCharge == null ? 0.0 : model.ratecalculationresponce?.opaCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'ODA : ${model.ratecalculationresponce?.odaCharge == null ? 0.0 : model.ratecalculationresponce?.odaCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'FOV : ${model.ratecalculationresponce?.fovCharge == null ? 0.0 : model.ratecalculationresponce?.fovCharge}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceTiny,
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'Fuel Surcharge :                 ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: InputField(
                placeholder:
                    '${model.ratecalculationresponce?.fuelSurchargePercent == null ? 0.0 : model.ratecalculationresponce?.fuelSurchargePercent}',
                controller: fuelSurchargePercentController,
                textInputType: TextInputType.number,
                onChanged: (text) {
                  model.setfualsarcharge(text);
                },
              ),
            ),
          ]),
          verticalSpaceTiny,
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'FOV In %:                             ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: InputField(
                placeholder:
                    '${model.ratecalculationresponce?.fovPercentage == null ? '0.0' : model.ratecalculationresponce?.fovPercentage}',
                controller: fovController,
                textInputType: TextInputType.number,
                onChanged: (text) {
                  model.setfov(text);
                },
              ),
            ),
          ]),
          verticalSpaceSmall,

          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'Misc Charge :                      ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: InputField(
                  placeholder:
                      '${model.ratecalculationresponce?.miscCharge == null ? 0.0 : model.ratecalculationresponce?.miscCharge}',
                  controller: miscController,
                  textInputType: TextInputType.number,
                  onChanged: (text) {
                    model.setmisChargenotify(text);
                  }),
            ),
          ]),
          // Text(
          //   'Misc Charge : ${model.ratecalculationresponce?.miscCharge == null ? 0.0 : model.ratecalculationresponce?.miscCharge}',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          verticalSpaceTiny,
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'Loading Charge:                 ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: InputField(
                placeholder:
                    '${model.ratecalculationresponce?.loadingCharges == null ? 0.0 : model.ratecalculationresponce?.loadingCharges}',
                controller: loadingController,
                textInputType: TextInputType.number,
                onChanged: (text) {
                  model.setLodingChargenotify(text);
                },
              ),
            ),
          ]),
          // Text(
          //   'Loading : ${model.ratecalculationresponce?.loadingCharges == null ? 0.0 : model.ratecalculationresponce?.loadingCharges}',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          verticalSpaceTiny,
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'Unloading Charge:             ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: InputField(
                placeholder:
                    '${model.ratecalculationresponce?.unLoadingCharges == null ? 0.0 : model.ratecalculationresponce?.unLoadingCharges}',
                controller: unloadingController,
                textInputType: TextInputType.number,
                onChanged: (text) {
                  model.setUnlodingChargenoty(text);
                },
              ),
            ),
          ]),
          // Text(
          //   'Unloading : ${model.ratecalculationresponce?.unLoadingCharges == null ? 0.0 : model.ratecalculationresponce?.unLoadingCharges}',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          verticalSpaceSmall,
          checkDACCCOD(model),

          // Text(
          //   'COD : ${model.ratecalculationresponce?.codCharge == null ? 0.0 : model.ratecalculationresponce?.codCharge}',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          // verticalSpaceSmall,
          // Text(
          //   'DACC : ${model.ratecalculationresponce?.daccCharge == null ? 0.0 : model.ratecalculationresponce?.daccCharge}',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          verticalSpaceSmall,
          Text(
            'Chargable Freight : ₹. ${model.ratecalculationresponce?.costExcludingTax == null ? 0.0 : model.ratecalculationresponce?.costExcludingTax}',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]),
          ),
          verticalSpaceSmall,
          verticalSpaceMedium,
          Text(
            'IGST : ${model.ratecalculationresponce?.igst == null ? 0.0 : model.ratecalculationresponce?.igst}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'SGST : ${model.ratecalculationresponce?.sgst == null ? 0.0 : model.ratecalculationresponce?.sgst}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'CGST : ${model.ratecalculationresponce?.cgst == null ? 0.0 : model.ratecalculationresponce?.cgst}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Text(
            'UGST : ${model.ratecalculationresponce?.ugst == null ? 0.0 : model.ratecalculationresponce?.ugst}',
            style: TextStyle(fontSize: 16.0),
          ),
          verticalSpaceSmall,
          Center(
            child: Text(
              'Total Charge : ₹. ${model.ratecalculationresponce?.totalCharge == null ? 0.0 : model.ratecalculationresponce?.totalCharge}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800]),
            ),
          ),
        ],
      ),
    );
  }
}
