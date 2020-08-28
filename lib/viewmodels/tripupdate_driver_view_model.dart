import 'dart:convert';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/viewmodels/base_model.dart';
import 'package:package_info/package_info.dart';

class TripUpdateDriverViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  int _tripId;
  int get tripId => _tripId;
  void settripId(int val) {
    _tripId = val;
    notifyListeners();
  }

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

  List<TripRouteModel> _tripRoutes = new List<TripRouteModel>();
  List<TripRouteModel> get tripRoutes => _tripRoutes;
  void settripRoutes(List<TripRouteModel> val) {
    _tripRoutes = val == null ? new List<TripRouteModel>() : val;
    notifyListeners();

    if (_tripRoutes.length > 0) {
      setcurrentTripRoute(_tripRoutes.firstWhere((el) => el.isSelectable));
    }
  }

  TripRouteModel _currentTripRoute;
  TripRouteModel get currentTripRoute => _currentTripRoute;
  void setcurrentTripRoute(TripRouteModel val) {
    _currentTripRoute = val;
    notifyListeners();
  }

  List<TripTruckLoadModel> _truckLoads = new List<TripTruckLoadModel>();
  List<TripTruckLoadModel> get truckLoads => _truckLoads;
  void settruckLoads(List<TripTruckLoadModel> val) {
    _truckLoads = val == null ? new List<TripTruckLoadModel>() : val;
    notifyListeners();
  }

  bool _canPlan = false;
  bool get canPlan => _canPlan;
  void setcanPlan(bool val) {
    _canPlan = val == null ? false : val;
    notifyListeners();
  }

  /// can Depart Trip Button
  int _canDepartTrip = 0;
  int get canDepartTrip => _canDepartTrip;
  void setcanDepartTrip(int val) {
    _canDepartTrip = val == null ? 0 : val;
    notifyListeners();
  }

  Future canDepartTripButton() async {
    try {
      setBusy(true);
      var responce =
          await _apiService.tripAPIService.getCanDepartTripResponce(_tripId);
      if (responce > 0) {
        setcanDepartTrip(responce);
        await _navigationService.navigateTo(TripDepartDriverViewRoute,
            arguments: _tripId);
      }
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

  Future handleStartUpLogic(int tripid) async {
    try {
      setBusy(true);
      settripId(tripid);

      seterrormsg(null);

      var tripRouteResponce =
          await _apiService.driverAPIService.getTripRoutesResponce(tripId);
      settripRoutes(tripRouteResponce);

      if (currentTripRoute != null) {
        var truckLoadResponce = await _apiService.driverAPIService
            .getTripTruckLoadResponce(tripId, currentTripRoute.branchId);
        settruckLoads(truckLoadResponce);

        if (!currentTripRoute.canPlan) {
          setcanPlan(currentTripRoute.canPlan);
        } else {
          if (!currentTripRoute.isFirst && !currentTripRoute.isLast) {
            if (currentTripRoute.arrivalTime != null) {
              setcanPlan(currentTripRoute.canPlan);
            } else {
              setcanPlan(false);
            }
          } else if (currentTripRoute.isFirst &&
              currentTripRoute.departureTime == null) {
            setcanPlan(currentTripRoute.canPlan);
          } else {
            setcanPlan(false);
          }
        }
      }

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

  String _code;
  String get code => _code;
  void setcode(String value) {
    _code = value;
    notifyListeners();
    setloadDetailsList(null);
    seterrormsg(null);
  }

  List<TripTruckLoadDetailsModel> _loadDetailsList =
      new List<TripTruckLoadDetailsModel>();
  List<TripTruckLoadDetailsModel> get loadDetailsList => _loadDetailsList;
  void setloadDetailsList(List<TripTruckLoadDetailsModel> value) {
    _loadDetailsList =
        value == null ? new List<TripTruckLoadDetailsModel>() : value;
    notifyListeners();
  }

  Future getLoadDetails() async {
    try {
      setBusy(true);
      setloadDetailsList(null);
      var responce = await _apiService.driverAPIService
          .getLoadDetailsForPlanResponce(currentTripRoute.id, code);
      if (responce.length > 0) {
        setloadDetailsList(responce);
      }
      setBusy(false);
    } catch (e) {
      setloadDetailsList(null);
      setBusy(false);
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Future getLoadDetailsByScanner(docketnumberController) async {
    var code = docketnumberController.text;
    try {
      setBusy(true);
      setloadDetailsList(null);
      var responce = await _apiService.driverAPIService
          .getLoadDetailsForPlanResponce(currentTripRoute.id, code);
      if (responce.length > 0) {
        setloadDetailsList(responce);
      }
      setBusy(false);
    } catch (e) {
      setloadDetailsList(null);
      setBusy(false);
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Future planLoadForDriver() async {
    try {
      setBusy(true);
      for (var loadDetails in loadDetailsList) {
        TripPlanForDriverRequestModel model =
            new TripPlanForDriverRequestModel();
        model.loadId = loadDetails.id;
        model.loadTypeId = loadDetails.loadTypeId;
        model.tripRouteId = currentTripRoute.id;
        var responce = await _apiService.driverAPIService
            .getTripPlanForDriverResponce(model);
        if (responce) {
          _navigationService.pop();
          await handleStartUpLogic(tripId);
        }
      }
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
}
