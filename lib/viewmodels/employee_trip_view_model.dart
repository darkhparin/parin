import 'package:cwl/models/GPS/GPSRequestModel.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:geocoding/geocoding.dart';

import '../locator.dart';
import 'base_model.dart';

class BranchListViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      // getGPSResponce();

      GpsRequestModel model = new GpsRequestModel();
      model.userId = 1004;
      var gpsResponce = await _apiService.tripAPIService.getGPSResponce(model);
      setgpsresponce(gpsResponce.allLastLocation);

      var userBranchesResponce =
          await _apiService.tripAPIService.getUserBranchesResponce();
      setbranchlists(userBranchesResponce);

      // List ewList1 = new List.from([BranchModel])..addAll([AllLastLocation]);
      // print(ewList1);

      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

//GPS API Call
  Future getGPSResponce() async {
    try {
      GpsRequestModel model = new GpsRequestModel();
      model.userId = 1004;
      var gpsResponce = await _apiService.tripAPIService.getGPSResponce(model);
      setgpsresponce(gpsResponce.allLastLocation);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  List<AllLastLocation> _gpslist = new List<AllLastLocation>();
  List<AllLastLocation> get gpslist => _gpslist;
  void setgpsresponce(List<AllLastLocation> model) {
    _gpslist = model == null ? new List<AllLastLocation>() : model;
    notifyListeners();
  }

// GPS API CAll

  List<BranchModel> _branchlists = new List<BranchModel>();
  List<BranchModel> get branchlists => _branchlists;
  void setbranchlists(List<BranchModel> model) {
    setbranchlist(null);
    _branchlists = model == null ? new List<BranchModel>() : model;
    notifyListeners();
  }

  BranchModel _branchlist = new BranchModel();
  BranchModel get branchlist => _branchlist;
  Future<void> setbranchlist(BranchModel model) async {
    notifyListeners();
    _branchlist = model;
    if (_branchlist != null) {
      var setid = _branchlist.id;
      await getTripListResponce(setid);
      // settriplist(triplist);
      notifyListeners();
    }
  }

  bool _hasData = false;
  bool get hasData => _hasData;
  void sethasData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  List<TripDetailsModel> _triplist = new List<TripDetailsModel>();
  List<TripDetailsModel> get triplist => _triplist;
  Future<void> settriplist(List<TripDetailsModel> val) async {
    _triplist = val == null ? new List<TripDetailsModel>() : val;

    if (_triplist.length > 0 && _gpslist.length > 0) {
      for (var gp in _gpslist) {
        var myData = new TripDetailsModel();
        try {
          setBusy(true);
          myData = _triplist.where((tl) => tl.carrier == gp.vehName).first;
        } catch (e) {
          myData = null;
        }

        if (myData != null) {
          List<Placemark> placemarks = await placemarkFromCoordinates(
              num.parse(gp.latitute), num.parse(gp.longitude));
          Placemark place = placemarks[0];
          // print(
          //     '${place.street},${place.administrativeArea},${place.locality},${place.name},${place.subAdministrativeArea},');

          myData.latitude = num.parse(gp.latitute);
          myData.longitude = num.parse(gp.longitude);
          myData.addressnew = place.subAdministrativeArea.toString();
        }

        setBusy(false);
      }

      // var myaddress = new TripDetailsModel();
      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(21.291420, 70.257031);
      // Placemark place = placemarks[0];
      // print(
      //     '${place.street},${place.administrativeArea},${place.locality},${place.name},${place.subAdministrativeArea},');
      // myaddress.address = place.subAdministrativeArea.toString();
    }
    notifyListeners();
  }

  Future getTripListResponce(int setid) async {
    try {
      setBusy(true);
      sethasData(false);
      var tripListResponce =
          await _apiService.tripAPIService.getTripListResponce(setid);
      settriplist(tripListResponce);
      setBusy(false);
      if (tripListResponce != null) {
        sethasData(true);
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
