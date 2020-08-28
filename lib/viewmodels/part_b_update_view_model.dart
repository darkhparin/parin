import 'package:cwl/models/application/PartBUpdateItemModel.dart';
import 'package:cwl/models/ewaybill/partBUpdateRequest.dart';
import 'package:cwl/models/params/partbupdateparam.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:package_info/package_info.dart';

import '../locator.dart';
import 'base_model.dart';

class PartBUpdateViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<PartBUpdateItemModel> _partBItems = new List<PartBUpdateItemModel>();
  List<PartBUpdateItemModel> get partBItems => _partBItems;
  void setPartBItems(List<PartBUpdateItemModel> val) {
    _partBItems = val == null ? new List<PartBUpdateItemModel>() : val;
    notifyListeners();
  }

  void setPartBItem(
      num ewayBillNo, String status, bool hasError, bool isProcessing) {
    var itm = _partBItems.firstWhere((ewb) => ewb.ewayBill == ewayBillNo);
    if (itm != null) {
      itm.status = status;
      itm.hasError = hasError;
      itm.isProcessing = isProcessing;
      notifyListeners();
    }
  }

  String _docket;
  String get docket => _docket;
  void setdocket(String val) {
    _docket = val;
    notifyListeners();
  }

  String _vehicleNo;
  String get vehicleNo => _vehicleNo;
  void setvehicleNo(String val) {
    _vehicleNo = val;
    notifyListeners();
  }

  Future handleStartUpLogic(ParamPartBUpdate param) async {
    try {
      setBusy(true);
      setdocket(param.docketNo);
      var ewayBills = param.ewayBills
          .map((ewb) => new PartBUpdateItemModel(
              ewayBill: ewb,
              hasError: false,
              status: 'Part B Not Updated',
              isProcessing: false))
          .toList();
      setPartBItems(ewayBills);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  Future updatePartB() async {
    try {
      if (vehicleNo.length < 7) {
        throw Exception('Provide Valid Vehicle No !');
      }
      if (_partBItems.length <= 0) {
        throw Exception('No Valid EwayBills Found !');
      }
      bool hasError = true;
      for (var item in _partBItems) {
        setPartBItem(item.ewayBill, 'Processing', false, true);
        try {
          var model = new PartBUpdateRequest();
          model.eway_bill_number = item.ewayBill;
          model.transporter_document_number = _docket;
          model.vehicle_number = _vehicleNo;
          var result =
              await _apiService.orderAPIservice.getPartBUpdateResponce(model);
          if (result == 'Successfully Updated !') {
            setPartBItem(item.ewayBill, 'Sucessfully Updated', false, false);
          } else {
            setPartBItem(item.ewayBill, result, true, false);
          }
        } catch (e) {
          setPartBItem(item.ewayBill, e.toString(), true, false);
        }
      }

      hasError = _partBItems.any((ewb) => ewb.hasError);

      if (!hasError) {
        _navigationService.pop(result: 'true');
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
