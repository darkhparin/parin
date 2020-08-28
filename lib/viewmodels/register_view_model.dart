import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/application/commonmodel.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/services/storage_local_service.dart';
import 'package:cwl/viewmodels/base_model.dart';
import 'package:uuid/uuid.dart';

class RegisterViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final StorageLocalService _storageLocalService =
      locator<StorageLocalService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;
  String get errormsg => _errormsg;
  void seterrormsg(String msg) {
    _errormsg = msg;
    notifyListeners();
  }

  List<Commonmodel> _userTypes = new List<Commonmodel>();
  List<Commonmodel> get userTypes => _userTypes;
  void setuserTypes(List<Commonmodel> model) {
    _userTypes = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _userType;
  Commonmodel get userType => _userType;
  void setuserType(Commonmodel model) {
    _userType = model;
    notifyListeners();
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      var tmpUserTypes = new List<Commonmodel>();

      var partyUT = new Commonmodel();
      partyUT.id = 1;
      partyUT.name = 'Customer';

      var employeeUT = new Commonmodel();
      employeeUT.id = 2;
      employeeUT.name = 'Employee';

      var driverUT = new Commonmodel();
      driverUT.id = 4;
      driverUT.name = 'Driver';

      tmpUserTypes.add(partyUT);
      tmpUserTypes.add(employeeUT);
      tmpUserTypes.add(driverUT);

      setuserTypes(tmpUserTypes);
      setuserType(employeeUT);
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

  Future registerEmployee(
      String username, String password, String mobileNo, String email) async {
    try {
      setBusy(true);

      if (userType.id != 2) {
        throw new Exception('Invalid UserType !');
      }

      RegisterEmployeeRequest model = new RegisterEmployeeRequest();
      String deviceId = await _storageLocalService.getDeviceId();

      if (deviceId == null) {
        var uuid = Uuid();
        deviceId = uuid.v4();
        await _storageLocalService.setDeviceId(deviceId: deviceId);
      }
      model.deviceId = deviceId;
      model.deviceTypeId = 2;
      model.email = email;
      if (double.tryParse(mobileNo) == null) {
        throw new Exception('Invalid Mobile No');
      }
      model.mobileNo = mobileNo;
      model.password = password;
      model.userName = username;

      var result = await _apiService.accountAPIService.registerEmployee(model);

      result = result.replaceAll("\"", "");

      if (result != "Success") {
        throw new Exception(result);
      } else {
        _navigationService.navigateTo(LoginViewRoute);
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
