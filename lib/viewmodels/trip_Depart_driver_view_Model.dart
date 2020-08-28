import 'dart:convert';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/viewmodels/base_model.dart';
import 'package:package_info/package_info.dart';

class TripDepartDriverViewModel extends BaseModel {
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

  ConsolidatedEwayBillRequestModel _consolidatedEwayBill;
  ConsolidatedEwayBillRequestModel get consolidatedEwayBill =>
      _consolidatedEwayBill;
  void setConsolidatedEwayBillReqestresponce(
      ConsolidatedEwayBillRequestModel val) {
    _consolidatedEwayBill = val;
    notifyListeners();
    if (_consolidatedEwayBill != null) {
      setConsilidatedEwayBillListresponce(_consolidatedEwayBill.ewayBills);
    } else {
      setConsilidatedEwayBillListresponce(null);
    }
  }

  List<ConsilidatedEwayBillModel> _consilidatedEwayBillListDetails =
      new List<ConsilidatedEwayBillModel>();
  List<ConsilidatedEwayBillModel> get consilidatedEwayBillListDetails =>
      _consilidatedEwayBillListDetails;
  void setConsilidatedEwayBillListresponce(
      List<ConsilidatedEwayBillModel> val) {
    _consilidatedEwayBillListDetails =
        val == null ? new List<ConsilidatedEwayBillModel>() : val;
    notifyListeners();
  }

  Future handleStartUpLogic(int tripid) async {
    try {
      setBusy(true);
      settripId(tripid);
      var consolidatedEwayBillResponce = await _apiService.ewbAPIService
          .getConsolidatedEwayBillResponce(tripId);

      setConsolidatedEwayBillReqestresponce(consolidatedEwayBillResponce);

      // var loadingTallyResponce = await _apiService.tripAPIService
      //     .getLoadingTallyResponce(tripId, departTripResponce);

      seterrormsg(null);

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

  /// can Depart Trip Button
  int _consolidatedEwayBillResponce = 0;
  int get consolidatedEwayBillResponce => _consolidatedEwayBillResponce;
  void setconsolidatedEwayBillResponce(int val) {
    _consolidatedEwayBillResponce = val == null ? 0 : val;
    notifyListeners();
  }

  Future createConsolidatedEwayBill() async {
    try {
      setBusy(true);

      ConsolidatedEwayBillRequestModel model = consolidatedEwayBill;

      var responce = await _apiService.ewbAPIService
          .createConsolidatedEwayBillRequest(model);
      if (responce > 0) {
        setconsolidatedEwayBillResponce(responce);
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

  String _sealno = '0';
  String get sealno => _sealno;
  void setsealno(String value) {
    _sealno = value;
    notifyListeners();
  }

  String _reading = '0';
  String get reading => _reading;
  void setreading(String value) {
    _reading = value;
    notifyListeners();
  }

  Future getDepartTripResponce() async {
    try {
      setBusy(true);
      DepartTripModel model = new DepartTripModel();
      var numreadign = num.parse(_reading);

      model.reading = numreadign;
      model.tripId = tripId;
      model.sealNo = sealno;

      var arriveTripResponce =
          await _apiService.tripAPIService.getDepartTripResponce(model);

      setBusy(false);
      if (arriveTripResponce != null) {
        var responce = await _dialogService.showConfirmationDialog(
          title: 'Success',
          description: 'Trip Depart Success ',
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
