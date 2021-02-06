import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/encryption_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/services/storage_local_service.dart';
import 'package:cwl/ui/widgets/SnackBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final StorageLocalService _storageLocalService =
      locator<StorageLocalService>();
  final EncryptionService _encryptionService = locator<EncryptionService>();
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _errormsg;

  String get msg => _errormsg;

  Future handleStartUpLogic() async {
    try {
      setBusy(true);

      String deviceId = await _storageLocalService.getDeviceId();

      if (deviceId == null) {
        var uuid = Uuid();
        deviceId = uuid.v4();
        await _storageLocalService.setDeviceId(deviceId: deviceId);
      }

      var versionData = await _apiService.openAPIService.getCurrentAppVersion();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String buildNumber = packageInfo.buildNumber;

      if (versionData == null) {
        _errormsg = 'error';
      } else {
        if (versionData.version.toString() != buildNumber) {
          _navigationService.navigateReplacementTo(UpdateViewRoute);
        } else {
          var localCredentialsEcry =
              await _storageLocalService.getLoginCredentials();
          if (localCredentialsEcry != null) {
            var localCredentials =
                _encryptionService.decrypt(base64: localCredentialsEcry);
            var loginModel =
                Localcredentials.fromJson(json.decode(localCredentials));
            var loginResponce = await _login(
                username: loginModel.username,
                password: loginModel.password,
                deviceId: deviceId);
            if (!loginResponce.error) {
              Future sleep1() {
                return new Future.delayed(
                    const Duration(seconds: 3),
                    () => _navigationService
                        .navigateReplacementTo(GuestViewRoute));
              }

              rtoastMassage('Welcome ${loginModel.username}');
              sleep1();
            } else {
              if (loginResponce.message.contains('Device Not Registered')) {
                var userIdstr = loginResponce.message.replaceAll(
                    '{"message":"Error : Device Not Registered , Please Contact H/O - ',
                    '');
                userIdstr = userIdstr.replaceAll('"}', '');
                var userId = int.parse(userIdstr);

                _navigationService.navigateReplacementTo(
                    UpdateDeviceIdViewRoute,
                    arguments: userId);
              } else {
                _navigationService.navigateReplacementTo(LoginViewRoute);
              }
            }
          } else {
            _navigationService.navigateReplacementTo(LoginViewRoute);
          }
        }
      }
    } catch (e) {
      setBusy(false);
      _errormsg = e.toString();
      await _dialogService.showDialog(
        buttonTitle: 'Close App',
        title: 'Error > No Internet Connection.',
        description: 'Please Turn on Mobile or WIFI Connection.',
      );
    }
  }

  Future<Apiresponce> _login({
    @required String username,
    @required String password,
    @required String deviceId,
  }) async {
    try {
      var model = new Loginrequest();
      model.userName = username;
      model.password = password;
      model.deviceType = 3;
      model.deviceIds = new List();
      model.deviceIds.add(deviceId);

      return await _apiService.login(model);
    } catch (e) {
      return null;
    }
  }
}
