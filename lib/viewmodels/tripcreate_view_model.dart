import 'dart:convert';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:package_info/package_info.dart';

import '../locator.dart';
import 'base_model.dart';

class TripCreateViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;
  String get errormsg => _errormsg;
  void seterrormsg(String msg) {
    _errormsg = msg;
    notifyListeners();
  }

  String _appVersion;
  String get appVersion => _appVersion;
  Future setappVersionAsync() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    notifyListeners();
  }

  List<TripTypeModel> _tripTypes = new List<TripTypeModel>();
  List<TripTypeModel> get tripTypes => _tripTypes;
  void settripTypes(List<TripTypeModel> model) {
    settripType(null);
    _tripTypes = model == null ? new List<TripTypeModel>() : model;
    notifyListeners();
  }

  TripTypeModel _tripType;
  TripTypeModel get tripType => _tripType;
  Future settripType(TripTypeModel model) async {
    settoBranches(null);
    _tripType = model;
    notifyListeners();
    if (fromBranch != null && tripType != null) {
      setBusy(true);
      try {
        var tobranchResponce =
            await _apiService.tripAPIService.getTripToBranchesResponce();
        if (tripType.id == 1) {
          settoBranches(tobranchResponce
              .where((t) => t.branch_Id != fromBranch.branch_Id)
              .toList());
        } else {
          settoBranches(tobranchResponce
              .where((t) => t.branch_Id == fromBranch.branch_Id)
              .toList());
        }
      } catch (e) {
        setBusy(false);
      }
      setBusy(false);
    }
  }

  List<BranchShortModel> _fromBranches = new List<BranchShortModel>();
  List<BranchShortModel> get fromBranches => _fromBranches;
  void setfromBranches(List<BranchShortModel> model) {
    setfromBranch(null);
    settoBranches(null);
    _fromBranches = model == null ? new List<BranchShortModel>() : model;
    notifyListeners();
  }

  BranchShortModel _fromBranch;
  BranchShortModel get fromBranch => _fromBranch;
  Future setfromBranch(BranchShortModel model) async {
    _fromBranch = model;
    notifyListeners();
    if (fromBranch != null && tripType != null) {
      setBusy(true);
      try {
        var tobranchResponce =
            await _apiService.tripAPIService.getTripToBranchesResponce();
        if (tripType.id == 1) {
          settoBranches(tobranchResponce
              .where((t) => t.branch_Id != fromBranch.branch_Id)
              .toList());
        } else {
          settoBranches(tobranchResponce
              .where((t) => t.branch_Id == fromBranch.branch_Id)
              .toList());
        }
      } catch (e) {
        setBusy(false);
      }
      setBusy(false);
    }
  }

  List<BranchShortModel> _toBranches = new List<BranchShortModel>();
  List<BranchShortModel> get toBranches => _toBranches;
  void settoBranches(List<BranchShortModel> model) {
    settoBranch(null);
    if (model != null) {
      _toBranches = model;
    } else {
      _toBranches = new List<BranchShortModel>();
    }
    notifyListeners();
    if (_toBranches.length == 1) {
      settoBranch(_toBranches.first);
    }
  }

  BranchShortModel _toBranch;
  BranchShortModel get toBranch => _toBranch;
  void settoBranch(BranchShortModel model) {
    _toBranch = model;
    notifyListeners();
  }

  List<TripServiceTypeModel> _serviceTypes = new List<TripServiceTypeModel>();
  List<TripServiceTypeModel> get serviceTypes => _serviceTypes;
  void setserviceTypes(List<TripServiceTypeModel> model) {
    setserviceType(null);
    _serviceTypes = model == null ? new List<TripServiceTypeModel>() : model;
    notifyListeners();
  }

  TripServiceTypeModel _serviceType;
  TripServiceTypeModel get serviceType => _serviceType;
  Future setserviceType(TripServiceTypeModel model) async {
    setvehicleAutoFill(null);
    setvehicleAutoFillList(null);
    _serviceType = model;
    notifyListeners();
    if (serviceType != null) {
      setBusy(true);
      try {
        var autoFillResponce = await _apiService.tripAPIService
            .getTripAllVehicleListResponce(serviceType.serviceTypeId);
        setvehicleAutoFillList(autoFillResponce);
      } catch (e) {}
      setBusy(false);
    }
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      await setappVersionAsync();
      var tripTypeResponce =
          await _apiService.tripAPIService.getTripTypeResponce();
      settripTypes(tripTypeResponce.where((t) => t.id != 2).toList());
      var fromBranchResponce =
          await _apiService.tripAPIService.getTripFromBranchesResponce();
      setfromBranches(fromBranchResponce);
      var serviceTypeResponce =
          await _apiService.tripAPIService.getTripServiceResponce();
      setserviceTypes(serviceTypeResponce);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  List<TripVehicleAutoFillModel> _vehicleAutoFillList =
      new List<TripVehicleAutoFillModel>();
  List<TripVehicleAutoFillModel> get vehicleAutoFillList =>
      _vehicleAutoFillList;
  void setvehicleAutoFillList(List<TripVehicleAutoFillModel> model) {
    setvehicleAutoFill(null);
    _vehicleAutoFillList =
        model == null ? new List<TripVehicleAutoFillModel>() : model;
    notifyListeners();
  }

  TripVehicleAutoFillModel _vehicleAutoFill;
  TripVehicleAutoFillModel get vehicleAutoFill => _vehicleAutoFill;
  Future setvehicleAutoFill(TripVehicleAutoFillModel model) async {
    setvehicleDetailList(null);
    if (model != null) {
      if (!model.isSelectable) {
        _vehicleAutoFill = null;
        notifyListeners();
        await _dialogService.showDialog(
          title: 'Error',
          description:
              'Vehicle ${model.vehicle_Number} used in Trip No : ${model.tripNo}',
        );
      } else {
        _vehicleAutoFill = model;
        notifyListeners();
      }

      if (_vehicleAutoFill != null) {
        try {
          var vehicleDetailsResponce = await _apiService.tripAPIService
              .getTripVehicleDetailsResponce(fromBranch.branch_Id,
                  serviceType.serviceTypeId, vehicleAutoFill.vehicle_Number);
          setvehicleDetailList(vehicleDetailsResponce);
        } catch (e) {
          await _dialogService.showDialog(
            title: 'Error',
            description: e.toString(),
          );
        }
      }
    } else {
      _vehicleAutoFill = null;
      notifyListeners();
    }
  }

  List<TripVehicleDetailsModel> _vehicleDetailList =
      new List<TripVehicleDetailsModel>();
  List<TripVehicleDetailsModel> get vehicleDetailList => _vehicleDetailList;
  void setvehicleDetailList(List<TripVehicleDetailsModel> model) {
    setresources(null);
    _vehicleDetailList =
        model == null ? new List<TripVehicleDetailsModel>() : model;
    notifyListeners();

    if (_vehicleDetailList.length > 0) {
      var resourcesList = _vehicleDetailList
          .map((r) => new CwlCommonModel(r.broker_Id == null ? 0 : r.broker_Id,
              r.broker, r.broker_Id == 0 ? 1 : r.isVendor ? 3 : 2))
          .toSet()
          .toList();
      setresources(resourcesList);
    }
  }

  Future getVehicleAutoFill(String vehicleNo) async {
    try {
      //setBusy(true);
      setvehicleAutoFillList(null);
      if (serviceType == null) {
        throw new Exception('Select Service Type !');
      }
      var vehicleAutoFillResponce = await _apiService.tripAPIService
          .getTripVehicleAutoFillResponce(serviceType.serviceTypeId, vehicleNo);
      setvehicleAutoFillList(vehicleAutoFillResponce);
      //setBusy(false);
    } catch (e) {
      //setBusy(false);
      setvehicleAutoFillList(null);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  List<CwlCommonModel> _resources = new List<CwlCommonModel>();
  List<CwlCommonModel> get resources => _resources;
  void setresources(List<CwlCommonModel> model) {
    setresource(null);
    _resources = model == null ? new List<CwlCommonModel>() : model;
    notifyListeners();
    if (_resources.length > 0) {
      setresource(_resources[0]);
    }
  }

  CwlCommonModel _resource;
  CwlCommonModel get resource => _resource;
  void setresource(CwlCommonModel model) {
    setdrivers(null);
    _resource = model;
    notifyListeners();
    if (_resource != null) {
      var drivers = new List<CwlCommonModel>();
      var brokers =
          vehicleDetailList.where((v) => v.broker_Id == _resource.id).toList();
      for (var broker in brokers) {
        var tmpD = broker.drivers
            .map((d) => new CwlCommonModel(d.id, d.name, 1))
            .toList();
        drivers.addAll(tmpD);
      }
      setdrivers(drivers);
    }
  }

  List<CwlCommonModel> _drivers = new List<CwlCommonModel>();
  List<CwlCommonModel> get drivers => _drivers;
  void setdrivers(List<CwlCommonModel> model) {
    setdriverOne(null);
    setdriverTwo(null);
    _drivers = model == null ? new List<CwlCommonModel>() : model;
    notifyListeners();
    if (_drivers.length == 1) {
      setdriverOne(_drivers[0]);
    }
  }

  CwlCommonModel _driverOne;
  CwlCommonModel get driverOne => _driverOne;
  Future setdriverOne(CwlCommonModel model) async {
    setdriverTwo(null);
    _driverOne = model;
    notifyListeners();
    if (_driverOne != null) {
      try {
        var result = await _apiService.tripAPIService
            .getTripDriverAvailibityResponce(_driverOne.id);
        if (!result) {
          setdriverOne(null);
          notifyListeners();
          await _dialogService.showDialog(
            title: 'Error',
            description: 'Driver Already Used In Another Trip !',
          );
        }
      } catch (e) {
        await _dialogService.showDialog(
          title: 'Error',
          description: e.toString(),
        );
      }
    }
  }

  CwlCommonModel _driverTwo;
  CwlCommonModel get driverTwo => _driverTwo;
  void setdriverTwo(CwlCommonModel model) {
    _driverTwo = model;
    notifyListeners();
  }

  String _brokertype = '0';
  String get brokertype => _brokertype;
  void setbrokertype(String value) {
    _brokertype = value;
    notifyListeners();
  }

  num _tripRate = 0;
  num get tripRate => _tripRate;
  void settripRate(num val) {
    _tripRate = val;
    notifyListeners();
  }

  List<TripDriverRateCardModel> _tripRateList = List<TripDriverRateCardModel>();
  List<TripDriverRateCardModel> get tripRateList => _tripRateList;
  void settripRateList(List<TripDriverRateCardModel> val) {
    _tripRateList = val == null ? new List<TripDriverRateCardModel>() : val;
    notifyListeners();

    if (_tripRateList.length > 0) {
      if (_tripRateList.first != null) {
        if (_tripRateList.first.rateCard != null) {
          if (_tripRateList.first.rateCard.rateCardCharges.length > 0) {
            if (_tripRateList.first.rateCard.rateCardCharges.first != null) {
              settripRate(
                  _tripRateList.first.rateCard.rateCardCharges.first.rate);
            } else {
              settripRate(0);
            }
          } else {
            settripRate(0);
          }
        } else {
          settripRate(0);
        }
      } else {
        settripRate(0);
      }
    } else {
      settripRate(0);
    }
  }

  bool _hasData = false;
  bool get hasData => _hasData;
  void sethasData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  Future getTripDriverRateCardResponce() async {
    try {
      setBusy(true);
      sethasData(false);
      TripResourceRateCardRequestModel model =
          new TripResourceRateCardRequestModel();
      model.fromBranchId = _fromBranch.branch_Id;
      model.toBranchId = _toBranch.branch_Id;
      model.resourceTypeId = _resource.type;
      model.resourceId = _resource.id == 0 ? _driverOne.id : _resource.id;
      model.serviceId = _serviceType.serviceTypeId;
      model.vehicleId = _vehicleDetailList.first.vehicleType_Id;
      model.brokerRateTypeName = brokertype;

      var tripDriverRateCardResponce =
          await _apiService.tripAPIService.getTripDriverRateCardResponce(model);

      settripRateList(tripDriverRateCardResponce);

      setBusy(false);
      if (_tripRateList.length > 0) {
        sethasData(true);

        // await _dialogService.showDialog(
        //   title: 'Success',
        //   description: '',
        // );
      } else {
        await _dialogService.showDialog(
          title: 'Error',
          description: 'Not Found',
        );
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  num _brokerrate = 0;
  num get brokerrate => _brokerrate;
  void setbrokerrate(String val) async {
    num tmp = num.tryParse(val);
    _brokerrate = tmp != null ? tmp : 0;
    notifyListeners();
  }

  Future getTripSaveResponce() async {
    try {
      setBusy(true);
      TripSaveRequestModel model = new TripSaveRequestModel();

      model.id = 0;
      model.hireCharge = 0.0;
      model.ratePerKM = 0.0;
      model.ratePerKg = 0.0;
      var textboxRateCHarge = brokerrate;
      switch (_tripRateList.first.rateCard.rateCardType_Id) {
        case 1:
          {
            model.hireCharge = textboxRateCHarge;
            break;
          }
        case 2:
          {
            model.ratePerKM = textboxRateCHarge;
            break;
          }
        case 3:
          {
            model.ratePerKg = textboxRateCHarge;
            break;
          }
      }

      switch (_tripRateList.first.rateCard.service_Id) {
        case 1:
          {
            model.plane_Id = _vehicleDetailList.first.vehicle_Id;
            break;
          }
        case 2:
          {
            model.train_Id = _vehicleDetailList.first.vehicle_Id;
            break;
          }
        case 3:
          {
            model.truck_Id = _vehicleDetailList.first.vehicle_Id;
            break;
          }
      }

      model.executedBy = _resource.type;
      // model.isFixedRate = ;
      model.referenceNo = '';
      model.service_Id = _tripRateList.first.rateCard.service_Id;
      model.fromBranch_Id =
          _tripRateList.first.rateCard.rateCardCharges.first.fromBranch_Id;
      model.toBranch_Id =
          _tripRateList.first.rateCard.rateCardCharges.first.toBranch_Id;
      model.trackingStatus_Id = 1;

      if (_resource.id != 0) {
        model.broker_Id = _resource.id;
      }

      model.driver_Id = _driverOne.id;

      if (_driverTwo != null) {
        model.driver2_Id = _driverTwo.id;
      }

      // model.vendorRateId = _tripRateList.first.driverRateCard_Id;
      model.poNumber = '';
      model.rateCardId = _tripRateList.first.rateCard.rateCard_Id;
      model.rateTypeId = _tripRateList.first.rateCard.rateCardType_Id;
      model.driverBrokerRateCardId = _tripRateList.first.driverRateCard_Id;
      model.expectedDuration =
          _tripRateList.first.rateCard.rateCardCharges.first.duration;
      model.divisionRatio =
          _tripRateList.first.rateCard.rateCardCharges.first.divisionRatio;

      var tripSaveResponce =
          await _apiService.tripAPIService.getTripSaveResponce(model);

      setBusy(false);
      if (tripSaveResponce != null) {
        var responce = await _dialogService.showConfirmationDialog(
          title: 'Success',
          description:
              'Trip Created Successfully Trip ID: ${json.encode(tripSaveResponce)}',
          confirmationTitle: 'OK',
          cancelTitle: 'Cancel',
        );

        if (responce.confirmed) {
          _navigationService.navigateReplacementTo(TripCreateViewRoute);
        }
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
