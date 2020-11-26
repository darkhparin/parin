import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/tripcreate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import 'guest_view.dart';

class TripCreateView extends StatefulWidget {
  TripCreateView({Key key}) : super(key: key);

  @override
  _TripCreateViewState createState() => _TripCreateViewState();
}

class _TripCreateViewState extends State<TripCreateView> {
  final vehicleNoController = TextEditingController();
  final rateController = TextEditingController();

  final GlobalKey autocmptkeyvehicleNo =
      new GlobalKey<AutoCompleteTextFieldState<TripVehicleAutoFillModel>>();

  AutoCompleteTextField _vehicleAutoFill;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TripCreateViewModel>.withConsumer(
      viewModelBuilder: () => TripCreateViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),

      // onModelReady: (model) async {
      //   await model.handleStartUpLogic();
      //   rateController.text = model.fromBranch.branch_Name != null
      //       ? model.fromBranch.branch_Name
      //       : model.fromBranch.branch_Name;
      // },

      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Trip Create'),
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
        body: model.busy ? showLoading() : getBody(context, model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBody(BuildContext context, TripCreateViewModel model) {
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
              Text(
                'Trip Type',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              getTripType(context, model),
              verticalSpaceSmall,
              Text(
                'From Branch',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              getFromBrnaches(context, model),
              verticalSpaceSmall,
              Text(
                'To Branch',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              getToBrnaches(context, model),
              verticalSpaceSmall,
              Text(
                'Service',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              getServiceTypes(context, model),
              verticalSpaceSmall,
              Text(
                'Vehicle No',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              getVehicleNo(model),
              verticalSpaceSmall,
              model.vehicleAutoFill != null
                  ? getVehicleType(model.vehicleAutoFill.vehicleType)
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              verticalSpaceSmall,
              getResources(context, model),
              model.resource?.type == 2
                  ? isbroker(model)
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              verticalSpaceSmall,
              getDrivers(context, model),
              verticalSpaceSmall,
              getRate(model),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }

  Widget getTripType(context, TripCreateViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<TripTypeModel>(
        value: model.tripType,
        hint: Text('Select Trip Type'),
        isExpanded: true,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 16,
        ),
        items: model.tripTypes
            .map<DropdownMenuItem<TripTypeModel>>((TripTypeModel value) {
          return DropdownMenuItem<TripTypeModel>(
            value: value,
            child: Text(value.type),
          );
        }).toList(),
        onChanged: (TripTypeModel value) {
          model.settripType(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget getFromBrnaches(context, TripCreateViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<BranchShortModel>(
        value: model.fromBranch,
        hint: Text('Select From Branch'),
        isExpanded: true,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 16,
        ),
        items: model.fromBranches
            .map<DropdownMenuItem<BranchShortModel>>((BranchShortModel value) {
          return DropdownMenuItem<BranchShortModel>(
            value: value,
            child: Text(value.branch_Name),
          );
        }).toList(),
        onChanged: (BranchShortModel value) async {
          model.setfromBranch(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget getToBrnaches(context, TripCreateViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<BranchShortModel>(
        value: model.toBranch,
        hint: Text('Select To Branch'),
        isExpanded: true,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 16,
        ),
        items: model.toBranches
            .map<DropdownMenuItem<BranchShortModel>>((BranchShortModel value) {
          return DropdownMenuItem<BranchShortModel>(
            value: value,
            child: Text(value.branch_Name),
          );
        }).toList(),
        onChanged: (BranchShortModel value) async {
          model.settoBranch(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget getServiceTypes(context, TripCreateViewModel model) {
    return Container(
      height: 50,
      child: new DropdownButton<TripServiceTypeModel>(
        value: model.serviceType,
        hint: Text('Select Service Type'),
        isExpanded: true,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 16,
        ),
        items: model.serviceTypes.map<DropdownMenuItem<TripServiceTypeModel>>(
            (TripServiceTypeModel value) {
          return DropdownMenuItem<TripServiceTypeModel>(
            value: value,
            child: Text(value.serviceType),
          );
        }).toList(),
        onChanged: (TripServiceTypeModel value) async {
          setState(() {
            _vehicleAutoFill.clear();
            model.setvehicleAutoFillList(null);
            model.setvehicleAutoFill(null);
          });
          model.setserviceType(value);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }

  Widget row(TripVehicleAutoFillModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          item.vehicle_Number,
          style: TextStyle(
              fontSize: 16.0,
              color: item.isSelectable ? Colors.black : Colors.red),
        ),
        !item.isSelectable
            ? Flexible(
                child: Text(
                  'Used In Trip No : ${item.tripNo}  ',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: item.isSelectable ? Colors.black : Colors.red),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ],
    );
  } 

  Widget getVehicleNo(TripCreateViewModel model) {
    _vehicleAutoFill = AutoCompleteTextField<TripVehicleAutoFillModel>(
      controller: vehicleNoController,
      clearOnSubmit: false,
      itemSubmitted: (item) {
        model.setvehicleAutoFill(item);
        vehicleNoController.text = item.vehicle_Number;
      },
      key: autocmptkeyvehicleNo,
      suggestions: model.vehicleAutoFillList,
      itemBuilder: (context, item) {
        return row(item);
      },
      textChanged: (value) {
        model.setvehicleAutoFill(null);
      },
      itemSorter: (a, b) {
        return a.vehicle_Number.compareTo(b.vehicle_Number);
      },
      itemFilter: (item, query) {
        return item.vehicle_Number.toLowerCase().contains(query.toLowerCase());
      },
    );
    return _vehicleAutoFill;
  }

  Widget getVehicleType(String vehicleType) {
    return Text(
      vehicleType,
      style: TextStyle(fontWeight: FontWeight.w400),
    );
  }

  Widget isbroker(model) {
    return Center(
      child: Row(
        children: <Widget>[
          new Radio(
            value: 'Default Broker Fixed',
            groupValue: model.brokertype,
            onChanged: (val) => model.setbrokertype(val).toString(),
          ),
          new Text(
            'Default Broker Fixed',
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          new Radio(
            value: 'Default Broker per Kg',
            groupValue: model.brokertype,
            onChanged: (val) => model.setbrokertype(val).toString(),
          ),
          new Text(
            'Broker per Kg',
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget getResources(context, TripCreateViewModel model) {
    String resourceName = 'Resource';

    switch (model.resource?.type) {
      case 1:
        resourceName = 'Own';
        break;
      case 2:
        resourceName = 'Broker';
        break;
      case 3:
        resourceName = 'Vendor';
        break;
      default:
        resourceName = 'Resource';
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceSmall,
        Text(
          resourceName,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        Container(
          height: 50,
          child: new DropdownButton<CwlCommonModel>(
            value: model.resource,
            hint: Text('Select Resource'),
            isExpanded: true,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
            ),
            items: model.resources
                .map<DropdownMenuItem<CwlCommonModel>>((CwlCommonModel value) {
              return DropdownMenuItem<CwlCommonModel>(
                value: value,
                child: Text(
                  value.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (CwlCommonModel value) async {
              setState(() {
                _vehicleAutoFill.clear();
              });
              model.setresource(value);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
      ],
    );
  }

  Widget getDrivers(context, TripCreateViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getDriverOne(context, model),
        model.driverOne != null ? getDriverTwo(context, model) : Container(),
      ],
    );
  }

  Widget getDriverOne(context, TripCreateViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceSmall,
        Text(
          'Driver 1',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        Container(
          height: 50,
          child: new DropdownButton<CwlCommonModel>(
            value: model.driverOne,
            hint: Text('Select Driver 1'),
            isExpanded: true,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
            ),
            items: model.drivers
                .map<DropdownMenuItem<CwlCommonModel>>((CwlCommonModel value) {
              return DropdownMenuItem<CwlCommonModel>(
                value: value,
                child: Text(
                  value.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (CwlCommonModel value) async {
              model.setdriverOne(value);
              model.getTripDriverRateCardResponce();
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
      ],
    );
  }

  Widget getDriverTwo(context, TripCreateViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceSmall,
        Text(
          'Driver 2',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        Container(
          height: 50,
          child: new DropdownButton<CwlCommonModel>(
            value: model.driverTwo,
            hint: Text('Select Driver 2'),
            // ${model.driverratecard.basicDieselRate }
            isExpanded: true,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
            ),
            items: model.drivers
                .where((d) => d.id != model.driverOne.id)
                .map<DropdownMenuItem<CwlCommonModel>>((CwlCommonModel value) {
              return DropdownMenuItem<CwlCommonModel>(
                value: value,
                child: Text(
                  value.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (CwlCommonModel value) async {
              model.setdriverTwo(value);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
      ],
    );
  }

  Widget getRate(TripCreateViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceSmall,
        Text(
          'Rate: ${model.tripRate}',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        verticalSpaceSmall,
        model.resource?.type == 2
            ? InputField(
                controller: rateController,
                placeholder: 'Enter Broker Rate',
                isReadOnly: false,
                textInputType: TextInputType.number,
                onChanged: (text) {
                  model.setbrokerrate(text);
                },
              )
            : Container(
                height: 0,
                width: 0,
              ),
        verticalSpaceMedium,
        model.tripRate > 0
            ? Center(
                child: BusyButton(
                  title: 'Create Trip',
                  onPressed: () async {
                    model.getTripSaveResponce();
                  },
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ],
    );
  }
}
