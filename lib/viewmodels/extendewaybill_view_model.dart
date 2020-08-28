import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/viewmodels/base_model.dart';
import 'package:package_info/package_info.dart';

class ExtendEwayBillViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;
  String get errormsg => _errormsg;
  void seterrormsg(String msg) {
    _errormsg = msg;
    notifyListeners();
  }

  List<Extendableewaybill> _ewayBills = new List<Extendableewaybill>();
  List<Extendableewaybill> get ewayBills => _ewayBills;
  void setewayBills(List<Extendableewaybill> model) {
    _ewayBills = model;
    notifyListeners();
  }

  List<String> _validReasons = new List<String>();
  List<String> get validReasons => _validReasons;
  void setvalidReasons(List<String> model) {
    _validReasons = model;
    notifyListeners();
  }

  void addvalidReason(String value) {
    _validReasons.add(value);
    notifyListeners();
  }

  String _validReason;
  String get validReason => _validReason;
  void setvalidReason(String model) {
    _validReason = model;
    notifyListeners();
  }

  num _ewayBillNo;
  num get ewayBillNo => _ewayBillNo;
  void setewayBillNo(num model) {
    _ewayBillNo = model;
    notifyListeners();
  }

  String _vehicleNo;
  String get vehicleNo => _vehicleNo;
  void setvehicleNo(String value) {
    seterrormsg(null);
    value = value.toUpperCase();
    String patttern = r'(^[A-Z]{2}[0-9]{1,2}(?:[A-Z])?(?:[A-Z]*)?[0-9]{4}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      seterrormsg('Provide Valid Vahicle No');
    } else if (!regExp.hasMatch(value)) {
      seterrormsg('Provide Valid Vahicle No');
    } else {
      seterrormsg(null);
      _vehicleNo = value;
    }
    notifyListeners();
  }

  String _remainingDistance;
  String get remainingDistance => _remainingDistance;
  void setremainingDistance(String model) {
    _remainingDistance = model;
    notifyListeners();
  }

  String _extendRemark;
  String get extendRemark => _extendRemark;
  void setextendRemark(String model) {
    _extendRemark = model;
    notifyListeners();
  }

  Future _getExtendableEwayBills() async {
    var ewaybills =
        await _apiService.ewbAPIService.getExtendableEwayBillsResponce();
    setewayBills(ewaybills);
  }

  String _appVersion;
  String get appVersion => _appVersion;
  void setappVersion() {
    PackageInfo.fromPlatform().then((val) => {_appVersion = val.version});
    notifyListeners();
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      setappVersion();
      addvalidReason('Natural Calamity');
      addvalidReason('Law and Order Situation');
      addvalidReason('Transhipment');
      addvalidReason('Accident');
      await _getExtendableEwayBills();
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

  Future extendEwayBill() async {
    try {
      setBusy(true);
      Ewaybillextendrequest model = new Ewaybillextendrequest();
      model.consignment_status = 'M';
      model.eway_bill_number = ewayBillNo;
      model.extend_remarks = extendRemark;
      model.extend_validity_reason = validReason;
      model.remaining_distance = num.parse(remainingDistance);
      model.vehicle_number = vehicleNo;
      var result =
          await _apiService.ewbAPIService.getExtendEwayBillResponce(model);
      if (result) {
        await handleStartUpLogic();
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      seterrormsg(e.toString());
    }
  }
}
