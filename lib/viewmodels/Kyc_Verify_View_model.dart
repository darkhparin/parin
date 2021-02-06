import 'package:cwl/constants/route_names.dart';

import 'package:cwl/models/KycVerificationModel.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/widgets/SnackBar.dart';
import '../locator.dart';
import 'base_model.dart';

class KycverifyedViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      getverifyedPartyResponce();

      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  List<Commonmodel> _productTypes = new List<Commonmodel>();
  List<Commonmodel> get productTypes => _productTypes;
  void setproductTypes(List<Commonmodel> model) {
    setproductType(null);
    _productTypes = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _productType = new Commonmodel();
  Commonmodel get productType => _productType;
  void setproductType(Commonmodel model) {
    _productType = model;
    notifyListeners();
  }

  //GPS API Call
  Future getverifyedPartyResponce() async {
    try {
      var getPartyLatestList =
          await _apiService.partyAPIService.getverifyedPartyResponce();
      setverifyedPartyResponce(getPartyLatestList);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  List<Commonmodel> _partyLatestList = new List<Commonmodel>();
  List<Commonmodel> get partyLatestList => _partyLatestList;
  void setverifyedPartyResponce(List<Commonmodel> model) {
    setPartyList(null);
    _partyLatestList = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _partyLatestList1 = new Commonmodel();
  Commonmodel get partyLatestList1 => _partyLatestList1;
  Future<void> setPartyList(Commonmodel model) async {
    _partyLatestList1 = model;
    notifyListeners();
    if (_partyLatestList1 != null) {
      var setpartyid = _partyLatestList1.id;
      await getPartyContactDetails1(setpartyid);
      notifyListeners();
    }
  }

// Direct Reject KYC
  Commonmodel _partyLatestListReject = new Commonmodel();
  Commonmodel get partyLatestListReject => _partyLatestListReject;
  Future<void> setpartyLatestListReject(Commonmodel model) async {
    _partyLatestListReject = model;
    notifyListeners();
    if (_partyLatestListReject != null) {
      var setpartyid = _partyLatestListReject.id;
      await saveDirectRejectKYC(setpartyid);
      notifyListeners();
    }
  }

  Future getPartyContactDetails1(int setpartyid) async {
    try {
      setBusy(true);
      sethasData(false);
      var partyContactDetails =
          await _apiService.partyAPIService.getPartyContactDetails(setpartyid);
      setpartyContectDetails(partyContactDetails);

      setBusy(false);
      if (partyContactDetails != null) {
        sethasData(true);
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  GetPartyContactDetailsModel _partyContect = new GetPartyContactDetailsModel();
  GetPartyContactDetailsModel get partyContect => _partyContect;
  void setpartyContectDetails(GetPartyContactDetailsModel model) {
    _partyContect = model == null ? new GetPartyContactDetailsModel() : model;
    notifyListeners();
    // if (_partyContect != null) {
    //   var productType = new Commonmodel();

    //   if (partyContect.productType != null) {
    //     productType.id = partyContect.productTypeId;
    //     productType.name = partyContect.productType;
    //   } else {
    //     productType.name = partyContect.productType;
    //     productType.id = partyContect.productTypeId;
    //   }

    //   if (_productTypes.length <= 0) {
    //     var tmplist = new List<Commonmodel>();
    //     tmplist.add(productType);
    //     setproductTypes(tmplist);
    //     setproductType(productType);
    //   } else {
    //     var tmpProd = _productTypes.where((ele) => ele.id == 4).first;
    //     if (tmpProd != null) {
    //       setproductType(tmpProd);
    //     } else {
    //       _productTypes.add(productType);
    //       setproductTypes(_productTypes);
    //       setproductType(productType);
    //     } //sunil soni
    //   }
    // } else {
    //   setproductType(null);
    // }
  }

  bool _hasData = false;
  bool get hasData => _hasData;
  void sethasData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  String _firstName;
  String get firstname => _firstName;
  void setfirstcontact(String value) {
    _firstName = value;
    notifyListeners();
  }

  String _lastName;
  String get lastName => _lastName;
  void setlastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  void setisTesting(bool val) {
    _isTesting = val;
    notifyListeners();
  }

  Future saveDirectRejectKYC(int setpartyid) async {
    try {
      setBusy(true);
      var model = new SaveKycVerificationModel();
      var istesting = _isTesting == true ? false : true;
      model.partyId = setpartyid;
      model.firstName = _partyContect.contactPerson;
      model.lastName = _partyContect.contactPerson;
      model.isVerified = false;
      model.isTesting = true;

      var result = await _apiService.partyAPIService.saveVerifyKYC(model);
      setBusy(false);
      if (result == true) {
        _navigationService.navigateTo(KycVerifyViewRoute);
        rtoastMassage('KYC Rejected');
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  Future saveRejectKYC() async {
    try {
      setBusy(true);
      var model = new SaveKycVerificationModel();
      var istesting = _isTesting == true ? false : true;
      model.partyId = _partyContect.partyId;
      model.firstName = _partyContect.contactPerson;
      model.lastName = _partyContect.contactPerson;
      model.isVerified = false;
      model.isTesting = true;

      var result = await _apiService.partyAPIService.saveVerifyKYC(model);
      setBusy(false);
      if (result == true) {
        _navigationService.navigateTo(KycVerifyViewRoute);
        rtoastMassage('KYC Rejected');
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  Future saveVerifyKYC() async {
    try {
      setBusy(true);
      var model = new SaveKycVerificationModel();
      var istesting = _isTesting == true ? false : true;
      model.partyId = _partyContect.partyId;
      model.firstName = firstname;
      model.lastName = lastName;
      model.isVerified = true;
      model.isTesting = istesting;

      var result = await _apiService.partyAPIService.saveVerifyKYC(model);
      setBusy(false);
      if (result == true) {
        _navigationService.navigateTo(KycVerifyViewRoute);
        rtoastMassage('KYC Verify Sacssesfull');
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
