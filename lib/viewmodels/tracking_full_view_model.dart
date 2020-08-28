import 'dart:convert';

import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';

import 'package:cwl/services/navigation_service.dart';

import 'base_model.dart';

class DocketTrackingViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  OrderTrackingFullModel _docketresponce;
  OrderTrackingFullModel get docketresponce => _docketresponce;
  void setdocketresponce(OrderTrackingFullModel val) {
    _docketresponce = val;
    notifyListeners();
    if (_docketresponce != null) {
      settranshipmentDetailsresponce(_docketresponce.transhipmentDetails);
    } else {
      settranshipmentDetailsresponce(null);
    }
  }

  List<OrderTrackingFullModeltsd> _transhipmentDetails =
      new List<OrderTrackingFullModeltsd>();
  List<OrderTrackingFullModeltsd> get transhipmentDetails =>
      _transhipmentDetails;
  void settranshipmentDetailsresponce(List<OrderTrackingFullModeltsd> val) {
    _transhipmentDetails =
        val == null ? new List<OrderTrackingFullModeltsd>() : val;
    notifyListeners();
  }

  bool _hasData = false;
  bool get hasData => _hasData;
  void sethasData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  String _errorpincode;
  String get errorpincode => _errorpincode;
  void seterrorpincode(String error) {
    _errorpincode = error;
    notifyListeners();
  }

  Future docketTrackingFUllResponce(docketNo) async {
    try {
      setBusy(true);
      sethasData(false);
      if (docketNo.length == 11 || docketNo.length == 7) {
        var responce = await _apiService.accountAPIService
            .docketTrackingFUllResponce(docketNo);
        setdocketresponce(responce);
        setBusy(false);
        if (_docketresponce != null) {
          setdocketresponce(responce);
          sethasData(true);

          // await _dialogService.showDialog(
          //   title: 'Success',
          //   description: json.encode(_docketresponce.toJson()),
          // );
        }
      } else {
        setBusy(false);
        sethasData(false);
      }
    } catch (e) {
      setBusy(false);
      sethasData(false);
      await _dialogService.showDialog(
        title: 'Error Docket Tracking',
        description: 'Provide Velid Docket Number',
      );
      seterrorpincode(e.toString());
    }
  }
}
