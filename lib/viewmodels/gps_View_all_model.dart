import 'dart:async';
import 'dart:convert';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/GPS/GPSRequestModel.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:package_info/package_info.dart';

import '../locator.dart';
import 'base_model.dart';

class GpsVehicleViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      GpsRequestModel model = new GpsRequestModel();
      model.userId = 1004;
      var gpsResponce = await _apiService.tripAPIService.getGPSResponce(model);
      setgpsresponce(gpsResponce.allLastLocation);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

//GPS API Call
  // Future getGPSResponce() async {
  //   try {
  //     setBusy(true);
  //     GpsRequestModel model = new GpsRequestModel();
  //     model.userId = 1004;
  //     var gpsResponce = await _apiService.tripAPIService.getGPSResponce(model);
  //     setgpsresponce(gpsResponce.allLastLocation);
  //   } catch (e) {
  //     setBusy(false);
  //     await _dialogService.showDialog(
  //       title: 'Error',
  //       description: e.toString(),
  //     );
  //   }
  // }

  List<AllLastLocation> _gpslist = new List<AllLastLocation>();
  List<AllLastLocation> get gpslist => _gpslist;
  void setgpsresponce(List<AllLastLocation> model) {
    _gpslist = model == null ? new List<AllLastLocation>() : model;
    notifyListeners();
  }
// GPS API CAll

}
