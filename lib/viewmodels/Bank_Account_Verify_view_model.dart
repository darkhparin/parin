import 'dart:typed_data';
import 'package:cwl/models/application/BankAccountVerifyModel.dart';
import 'package:cwl/models/application/PANVerifyModel.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/encryption_service.dart';
import 'package:cwl/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class BankAccountViewModel extends BaseModel {
  final EncryptionService _encryptionService = locator<EncryptionService>();
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);

      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  String _ifsc;
  String get ifsc => _ifsc;
  void setifsc(String value) {
    _ifsc = value;
    notifyListeners();
  }

  String _accountNo;
  String get accountNo => _accountNo;
  void setaccountNo(String value) {
    _accountNo = value;
    notifyListeners();
  }

  String _accountName;
  String get accountName => _accountName;
  void setaccountName(String value) {
    _accountName = value;
    notifyListeners();
  }

  Future submitBankDetails() async {
    try {
      setBusy(true);
      var ifsc1 = ifsc.toUpperCase();
      var bankAccountResponce = await _apiService.accountAPIService
          .getBankAccountDetails(ifsc1, accountNo, accountName);
      setBankAccount(bankAccountResponce);

      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  BankAccountVerifyModel _bankAccountVerify;
  BankAccountVerifyModel get getbankAccountVerify => _bankAccountVerify;
  void setBankAccount(BankAccountVerifyModel model) {
    _bankAccountVerify = model;
    notifyListeners();
  }

  String _panNumber;
  String get panNumber => _panNumber;
  void setpanNumber(String value) {
    _panNumber = value;
    notifyListeners();
  }

  Future submitPANDetails() async {
    try {
      setBusy(true);
      var panNumber1 = panNumber.toUpperCase();
      var panNumberResponce =
          await _apiService.accountAPIService.getPANNumberDetails(panNumber1);
      setpanNumberres(panNumberResponce);

      setBusy(false);
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  PanVerifyModel _panNumberVerify;
  PanVerifyModel get getpanNumberVerify => _panNumberVerify;
  void setpanNumberres(PanVerifyModel model) {
    _panNumberVerify = model;
    notifyListeners();
  }
}
