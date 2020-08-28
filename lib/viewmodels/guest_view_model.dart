import 'package:cwl/locator.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:package_info/package_info.dart';

import 'base_model.dart';

class GuestViewModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();

  String _errormsg;

  String get msg => _errormsg;

  String _appVersion;
  String get appVersion => _appVersion;
  Future setappVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    notifyListeners();
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
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
}
