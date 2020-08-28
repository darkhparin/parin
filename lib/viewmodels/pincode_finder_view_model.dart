import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';

import 'package:cwl/services/navigation_service.dart';

import 'base_model.dart';

class PincodeFinderViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  PartyServicibilityResponce _pincoderesponce;
  PartyServicibilityResponce get pincoderesponce => _pincoderesponce;
  void setpincoderesponce(PartyServicibilityResponce val) {
    _pincoderesponce = val;
    notifyListeners();

    if (_pincoderesponce != null) {
      setodaSlab(_pincoderesponce.odaSlab);
    } else {
      setodaSlab(null);
    }
  }

  List<ODASlabModel> _odaSlab = new List<ODASlabModel>();
  void setodaSlab(List<ODASlabModel> val) {
    _odaSlab = val == null ? new List<ODASlabModel>() : val;
    notifyListeners();
  }

  List<ODASlabModel> _odaSlabFiltered = new List<ODASlabModel>();
  List<ODASlabModel> get odaSlab => _odaSlabFiltered;
  void setodaSlabFiltered(List<ODASlabModel> val) {
    _odaSlabFiltered = val == null ? new List<ODASlabModel>() : val;
    notifyListeners();
  }

  /// filter ODA Weight *
  void filterODASlab(String weight) {
    var _weight = num.tryParse(weight);
    if (_odaSlab.length > 0 && _pincoderesponce != null) {
      var distance = _pincoderesponce.distance;
      var filter = _odaSlab
          .where((d) =>
              d.weightEndIndex >= _weight &&
              d.weightStartIndex <= _weight &&
              d.distanceEndIndex >= distance &&
              d.distnaceStartIndex <= distance)
          .toList();
      setodaSlabFiltered(filter);
    } else {
      setodaSlabFiltered(null);
    }
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

  Future getPincodeResponce(String pincode) async {
    try {
      setBusy(true);
      sethasData(false);
      if (pincode.length == 6) {
        var responce =
            await _apiService.openAPIService.getPincodeResponce(pincode);
        setpincoderesponce(responce);
        setBusy(false);
        if (_pincoderesponce != null) {
          sethasData(true);
          // await _dialogService.showDialog(
          //   title: 'Success',
          //   description: json.encode(_pincoderesponce.toJson()),
          // );
        }
      } else {
        setBusy(false);
        sethasData(false);
      }
    } catch (e) {
      setBusy(false);
      sethasData(false);
      seterrorpincode(e.toString());
    }
  }
}
