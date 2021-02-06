import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/application/index.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/shared/progress_indicetor.dart';
import 'package:cwl/ui/widgets/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';

import 'base_model.dart';

class GuestViewModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;

  String get msg => _errormsg;

  String _appVersion;
  String get appVersion => _appVersion;
  Future setappVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    notifyListeners();
  }

  bool _checkTodaysAttendance = false;
  bool get checkTodaysAttendance => _checkTodaysAttendance;
  Future<void> setcheckTodaysAttendance(bool value) async {
    _checkTodaysAttendance = value;
    notifyListeners();
    if (checkTodaysAttendance == false) {
      // await getLastAttendance();
      rtoastMassageRed('Your Attendance Pending');
    }
  }

  Future getLastAttendance() async {
    try {
      setBusy(true);
      var getLastAttend =
          await _apiService.accountAPIService.getLastAttendance();
      setLastAttendanceResponce(getLastAttend);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  GetLastAttendanceResponce _getLastAttendance;
  GetLastAttendanceResponce get getLastAttendances => _getLastAttendance;
  void setLastAttendanceResponce(GetLastAttendanceResponce model) {
    _getLastAttendance = model;
    notifyListeners();
  }

  String _attendance;
  String get attendancereport => _attendance;
  void setAttendancetext(String value) {
    _attendance = value;
    notifyListeners();
  }

  Future postAttendanceReportRequestModel() async {
    try {
      setBusy(true);
      PostAttendanceReportRequestModel model =
          new PostAttendanceReportRequestModel();
      model.lastAttendanceId = getLastAttendances.attendanceId;
      model.report = attendancereport;

      var postAttendanceReportResponce = await _apiService.accountAPIService
          .postAttendanceReportRequestModel(model);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  int _attendancePresent = 1;
  int get attendancePresent => _attendancePresent;
  void setattendancePresent(int value) {
    _attendancePresent = value;
    notifyListeners();
  }

  String _errormsg1;
  String get errormsg => _errormsg;
  void seterrormsg1(String msg) {
    _errormsg = msg;
    notifyListeners();
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
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
    } catch (e) {
      seterrormsg1(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg1,
      );
    }
  }

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

  Future postAttendanceRequestModel() async {
    try {
      setBusy(true);

      PostAttendanceRequestModel model = new PostAttendanceRequestModel();
      model.attendancetype = attendancePresent;
      model.latitude = latitude == null ? 0.0 : latitude;
      model.longitude = longitude == null ? 0.0 : longitude;

      var postAttendanceRequestResponce =
          await _apiService.accountAPIService.postAttendanceRequestModel(model);
      setpostAttendanceRequestResponce(postAttendanceRequestResponce);
      if (postAttendanceRequestResponce == true) {
        _navigationService.navigateReplacementTo(GuestViewRoute);
        rtoastMassage('Attendance Punch Successfully');
      } else {
        setBusy(true);
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title:
            e.toString().contains('Please Provide Valid Latitude & Longitude')
                ? 'Tourn ON GPS (Location)'
                : 'ERROR',
        description: e.toString().replaceAll(
            'Please Provide Valid Latitude & Longitude',
            'TOURN ON YOUR GPS (LOACTION SERVICE)'),
      );
    }
  }

  bool _postAttendanceRequestResponce = false;
  bool get postAttendanceRequestResponce => _postAttendanceRequestResponce;
  void setpostAttendanceRequestResponce(bool value) async {
    _postAttendanceRequestResponce = value;
    notifyListeners();
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      getCurrentLocation();
      var checkTodaysAttendance =
          await _apiService.accountAPIService.checkTodaysAttendanceCompleted();
      setcheckTodaysAttendance(checkTodaysAttendance);
      var userdetailsResponce =
          await _apiService.accountAPIService.getUserDetails();
      setuserdetails(userdetailsResponce);

      await setappVersion();

      setBusy(false);
    } catch (e) {
      setBusy(false);
      _errormsg = e.toString();
      await _dialogService.showDialog(
        title: 'Error',
        description: _errormsg,
      );
    }
  }

  Userdetails _userdetails;
  Userdetails get userdetails => _userdetails;
  void setuserdetails(Userdetails value) {
    _userdetails = value;
  }
}
