import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/services/storage_local_service.dart';

import 'base_model.dart';

class MobileConfOtpViewModel extends BaseModel {
  final StorageLocalService _storageLocalService =
      locator<StorageLocalService>();
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  // String _textContent = 'Waiting for messages...';
  // SmsReceiver _smsReceiver;

  String _otp;
  String get otp => _otp;
  void setotp(String value) {
    _otp = value;
    notifyListeners();
  }

  // void onSmsReceived(String message) {
  //   _textContent = message;
  //   notifyListeners();

  //   if (_textContent.contains(' is your CWL verification code')) {
  //     var otpp = _textContent.replaceAll(' is your CWL verification code', '');
  //     setotp(otpp);
  //   }
  // }

  // void onTimeout() {
  //   _textContent = "Timeout!!!";
  //   notifyListeners();
  // }

  // void _startListening() {
  //   _smsReceiver.startListening();
  //   _textContent = "Waiting for messages...";
  //   notifyListeners();
  // }

  String _errorMsg;
  String get errorMsg => _errorMsg;
  void seterrorMsg(String error) {
    _errorMsg = error;
    notifyListeners();
  }

  String _otpRequestCode;
  String get otpRequestCode => _otpRequestCode;
  void setotpRequestCode(String otpReqCode) {
    _otpRequestCode = otpReqCode;
    notifyListeners();
  }

  bool _isOTPSend = false;
  bool get isOTPSend => _isOTPSend;
  void setisOTPSend(bool value) {
    _isOTPSend = value;
    notifyListeners();
  }

  Future handleStartUpLogic(String otpReqCode) async {
    try {
      setotpRequestCode(otpReqCode);
      setBusy(true);
      // _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
      setisOTPSend(false);
      seterrorMsg(null);
      var result = await _apiService.accountAPIService
          .sendMobileVerificationOTP(_otpRequestCode);
      if (result.contains('Message SuccessFully Submitted')) {
        // _startListening();
        setisOTPSend(true);
      } else {
        seterrorMsg(result);
        await _dialogService.showDialog(
          title: 'Error',
          description: _errorMsg,
        );
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      seterrorMsg(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _errorMsg,
      );
    }
  }

  Future validateOTP(String otp) async {
    try {
      setBusy(true);
      seterrorMsg(null);
      var result = await _apiService.accountAPIService
          .validateOTPForMobileConf(otpRequestCode, otp);
      setBusy(false);
      if (result) {
        _navigationService.navigateReplacementTo(StartupViewRoute);
      }
    } catch (e) {
      setBusy(false);
      seterrorMsg(e.tostring());
      await _dialogService.showDialog(
        title: 'error',
        description: _errorMsg,
      );
    }
  }
}
