import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/driver/UpdateTripLocaion_request_model.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';

import '../locator.dart';
import 'base_model.dart';

class DashBoardDriverViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool _hasLocationPermission = false;
  bool get hasLocationPermission => _hasLocationPermission;
  void sethasLocationPermission(bool value) {
    _hasLocationPermission = value;
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

  final Geolocator geolocator = Geolocator();
  final LocationOptions locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  StreamSubscription<Position> _positionStreamSubscription;

  double _latitude;
  double get latitude => _latitude;
  void setlatitude(double value) {
    _latitude = value;
    notifyListeners();
  }

  double _longitude;
  double get longitude => _longitude;
  void setlongitude(double value) {
    _longitude = value;
    notifyListeners();
  }

  Future checkLocationPermission() async {
    try {
      seterrormsg(null);
      if (await Permission.locationAlways.request().isGranted) {
        if (await Permission.locationAlways.serviceStatus.isEnabled) {
          print('got location perm and enabled');
          sethasLocationPermission(true);
        } else {
          seterrormsg('Please make sure you enable GPS and try again');
          sethasLocationPermission(false);
          await getCurrentLocation();
        }
      } else {
        if (await Permission.locationAlways.isPermanentlyDenied) {
          sethasLocationPermission(false);
          print('location perm permanently denied');
          openAppSettings();
        } else {
          await Permission.location.request();
        }
      }
    } catch (e) {
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      if (position == null) {
        setlatitude(null);
        setlongitude(null);
      } else {
        setlatitude(position.latitude);
        setlongitude(position.longitude);
      }
      checkDistanceFromBranchForArrival();
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
    } catch (e) {
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Future listenLocationStream() async {
    try {
      _positionStreamSubscription = geolocator
          .getPositionStream(locationOptions)
          .listen((Position position) {
        if (position == null) {
          setlatitude(null);
          setlongitude(null);
        } else {
          setlatitude(position.latitude);
          setlongitude(position.longitude);
        }
        checkDistanceFromBranchForArrival();
        print(position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
      });
    } catch (e) {
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Future updateDriverLocation() async {
    try {
      setBusy(false);
      UpdateTripLocaion_request_model model =
          new UpdateTripLocaion_request_model();
      model.tripId = _driverActiveTripModel.tripId;
      model.latitude = _latitude;
      model.longitude = _longitude;
      var updateDriverLocationResponce =
          await _apiService.driverAPIService.updateDriverLocation(model);
      print(updateDriverLocationResponce);
    } catch (e) {
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void checkDistanceFromBranchForArrival() {
    if (_currentTripRoute == null) {
      return;
    }
    var lat1 = _latitude;
    var lon1 = _longitude;
    var lat2 = _currentTripRoute.latitude;
    var lon2 = _currentTripRoute.longitude;

    if (lat1 != null && lon1 != null && lat2 != null && lon2 != null) {
      var distance = _calculateDistance(lat1, lon1, lat2, lon2);
      print(distance);
      if (distance <= 0.2) {
        setcanArriveLocal(true);
      } else {
        setcanArriveLocal(false);
      }
    }
  }

  bool _canArriveLocal = false;
  bool get canArriveLocal => _canArriveLocal;
  void setcanArriveLocal(bool val) async {
    if (val) {
      val = _canArriveTripRouteId > 0;
    }
    _canArriveLocal = val;
    notifyListeners();
  }

  int _canArriveTripRouteId = 0;
  int get canArriveTripRouteId => _canArriveTripRouteId;
  void setcanArriveTripRouteId(int val) async {
    _canArriveTripRouteId = val;
    notifyListeners();
  }

  Future getActiveTrip() async {
    try {
      var activeTrip =
          await _apiService.driverAPIService.getDriverActiveTripResponce();
      setdriverActiveTripModel(activeTrip);
      if (activeTrip != null) {
        continuousLocationSend();
      }
    } catch (e) {
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  continuousLocationSend() async {
    const fiveSeconds = const Duration(seconds: 20);
    // _fetchData() is your function to fetch data
    Timer.periodic(fiveSeconds, (Timer t) => updateDriverLocation());
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);

      await setappVersionAsync();
      setBusy(false);
      await checkLocationPermission();
      if (hasLocationPermission) {
        await listenLocationStream();
        if (latitude == null && longitude == null) {
          await getCurrentLocation();
        }
      }
      if (_apiService.userdetails.userTypeId == 4 ||
          _apiService.userdetails.userTypeId == 3) {
        await getActiveTrip();
      } else {
        DriverActiveTripModel model = new DriverActiveTripModel();
        model.fromBranch = 'Test';
        model.fromBranchId = 0;
        model.isUpTrip = false;
        model.toBranch = 'Test';
        model.toBranchId = 0;
        model.tripId = 0;
        model.tripName = 'Test';
        setdriverActiveTripModel(model);
      }
    } catch (e) {
      setBusy(false);
      seterrormsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  DriverActiveTripModel _driverActiveTripModel;
  DriverActiveTripModel get driverActiveTripModel => _driverActiveTripModel;
  void setdriverActiveTripModel(DriverActiveTripModel model) async {
    _driverActiveTripModel = model;
    notifyListeners();
    if (_driverActiveTripModel != null) {
      var tripRouteResponce = await _apiService.driverAPIService
          .getTripRoutesResponce(_driverActiveTripModel.tripId);
      settripRoutes(tripRouteResponce);
    }
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
  void setcurrentTripRoute(TripRouteModel val) async {
    _currentTripRoute = val;
    notifyListeners();
    if (_currentTripRoute != null) {
      try {
        var candata = await _apiService.driverAPIService
            .getTripArriveResponce(_driverActiveTripModel.tripId);
        setcanArriveTripRouteId(candata);
      } catch (e) {
        setcanArriveTripRouteId(0);
      }
    }
  }

  Future navigateToTripUpdate() async {
    if (_driverActiveTripModel != null) {
      var result = await _navigationService.navigateTo(
          TripUpdateDriverViewRoute,
          arguments: _driverActiveTripModel.tripId);
      if (result != null) {
        print(result.toString());
        //await handleStartUpLogic();

      }
    } else {
      seterrormsg('No Active Trip Found');
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  String _unsealno = '0';
  String get unsealno => _unsealno;
  void setunsealno(String value) {
    _unsealno = value;
    notifyListeners();
  }

  String _reading = '0';
  String get reading => _reading;
  void setreading(String value) {
    _reading = value;
    notifyListeners();
  }

  Future getArriveTripResponce() async {
    try {
      setBusy(true);
      ArriveTrip model = new ArriveTrip();
      var numreadign = num.parse(_reading);

      model.reading = numreadign;
      model.tripId = _driverActiveTripModel.tripId;
      model.unSealNo = unsealno;

      var arriveTripResponce =
          await _apiService.tripAPIService.getArriveTripResponce(model);

      setBusy(false);
      if (arriveTripResponce != null) {
        var responce = await _dialogService.showConfirmationDialog(
          title: 'Success',
          description: 'Trip Arrive Success ${json.encode(arriveTripResponce)}',
          confirmationTitle: 'OK',
        );

        if (responce.confirmed) {
          _navigationService.navigateReplacementTo(DashBoardDriverViewRoute);
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
