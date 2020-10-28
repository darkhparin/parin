import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/encryption_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/services/storage_local_service.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final StorageLocalService _storageLocalService =
      locator<StorageLocalService>();
  final EncryptionService _encryptionService = locator<EncryptionService>();
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;

  String get msg => _errormsg;

  String _username;
  String get username => _username;
  void setusername(String value) {
    _username = value;
    notifyListeners();
  }

  String _password;
  String get password => _password;
  void setpassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future login(
      // @required String username,
      // @required String password,
      ) async {
    try {
      setBusy(true);
      var model = new Loginrequest();
      model.userName = username;
      model.password = password;
      model.deviceType = 3;
      model.deviceIds = new List();

      String deviceId = await _storageLocalService.getDeviceId();

      if (deviceId == null) {
        var uuid = Uuid();
        deviceId = uuid.v4();
        await _storageLocalService.setDeviceId(deviceId: deviceId);
      }

      model.deviceIds.add(deviceId);

      var localCredentials = new Localcredentials();
      localCredentials.username = model.userName;
      localCredentials.password = password;
      var painText = json.encode(localCredentials.toJson());
      var ecryData = _encryptionService.encrypt(plainText: painText);
      await _storageLocalService.setLoginCredentials(credentials: ecryData);

      var loginResponce = await _apiService.login(model);

      if (loginResponce.error) {
        _errormsg = loginResponce.message;
        setBusy(false);
        if (_errormsg.contains('Device Not Registered')) {
          var userIdstr = loginResponce.message.replaceAll(
              '{"message":"Error : Device Not Registered , Please Contact H/O - ',
              '');
          userIdstr = userIdstr.replaceAll('"}', '');
          var userId = int.parse(userIdstr);
          _navigationService.navigateReplacementTo(UpdateDeviceIdViewRoute,
              arguments: userId);
        } else if (_errormsg.contains('OTP Request Code : ')) {
          var otpRequestCode = loginResponce.message
              .replaceAll('{"message":"OTP Request Code : ', '');
          otpRequestCode = otpRequestCode.replaceAll('"}', '');
          _navigationService.navigateReplacementTo(MobileConfOtpViewRoute,
              arguments: otpRequestCode);
        } else {
          await _dialogService.showDialog(
            title: 'Login Failure',
            description: _errormsg,
          );
        }
      } else {
        setBusy(false);
        await _apiService.accountAPIService.getUserDetails();
        _navigationService.navigateReplacementTo(GuestViewRoute);
      }
    } catch (e) {
      setBusy(false);
      _errormsg = e.toString();
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(RegisterViewRoute);
  }
}
