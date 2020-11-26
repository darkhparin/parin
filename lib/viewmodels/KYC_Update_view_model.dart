import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/GPS/GPSRequestModel.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/views/KYC_Update_view.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../locator.dart';
import 'base_model.dart';

class KycUpdateViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      getPartyLatestListResponce();
      var productTypeResponce =
          await _apiService.orderAPIservice.getProductTypesResponce();
      setproductTypes(productTypeResponce);
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  String _gstin;
  String get gstin => _gstin;
  void setgstin(String value) {
    _gstin = value;
    notifyListeners();
  }

  String _contactPerson;
  String get contactPerson => _contactPerson;
  void setcontactPerson(String value) {
    _contactPerson = value;
    notifyListeners();
  }

  String _email;
  String get email => _email;
  void setemail(String val) {
    _email = val;
    notifyListeners();
  }

  String _mobileNo;
  String get mobileNo => _mobileNo;
  void setmobileNo(String val) {
    _mobileNo = val;
    notifyListeners();
  }

  String _officeNo;
  String get officeNo => _officeNo;
  void setofficeNo(String val) {
    _officeNo = val;
    notifyListeners();
  }

  String _address;
  String get address => _address;
  void setaddress(String val) {
    _address = val;
    notifyListeners();
  }

  String _partyPincode;
  String get partyPincode => _partyPincode;
  void setpartyPincode(String val) {
    _partyPincode = val;
    notifyListeners();
  }

  bool _hasEmailAlert = false;
  bool get hasEmailAlert => _hasEmailAlert;
  void sethasEmailAlert(bool val) {
    _hasEmailAlert = val;
    notifyListeners();
  }

  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  void setisDeleted(bool val) {
    _isDeleted = val;
    notifyListeners();
  }

  bool _hasSMSAlert = false;
  bool get hasSMSAlert => _hasSMSAlert;
  void sethasSMSAlert(bool val) {
    _hasSMSAlert = val;
    notifyListeners();
  }

  bool _isODA = false;
  bool get isODA => _isODA;
  void setisODA(bool val) {
    _isODA = val;
    notifyListeners();
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
  Future getPartyLatestListResponce() async {
    try {
      var getPartyLatestList =
          await _apiService.partyAPIService.getPartyLatestListResponce();
      setPartyLatestListResponce(getPartyLatestList);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  List<Commonmodel> _partyLatestList = new List<Commonmodel>();
  List<Commonmodel> get partyLatestList => _partyLatestList;
  void setPartyLatestListResponce(List<Commonmodel> model) {
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

  Future saveKYCDetails() async {
    try {
      setBusy(true);
      var model = new GetPartyContactDetailsModel();

      var partyPincode = _partyPincode == null
          ? partyContect.pincode
          : int.parse(_partyPincode);

      var mobileNo =
          _mobileNo == null ? partyContect.mobileNo : int.parse(_mobileNo);
      var email = _email == null ? partyContect.emailId : _email;
      var gstin = _gstin == null ? partyContect.gstin : _gstin;
      var officeNo = _officeNo == null ? partyContect.officeNo : _officeNo;
      var address = _address == null ? partyContect.address : _address;
      var contactPerson =
          _contactPerson == null ? partyContect.contactPerson : _contactPerson;
      model.partyId = partyContect.partyId;
      model.emailId = email;
      model.hasEmailAlert = _hasEmailAlert;
      model.isDeleted = isDeleted;
      model.gstin = gstin;
      model.gstinStatus = partyContect.gstinStatus;
      model.mobileNo = mobileNo;
      model.hasSmsAlert = _hasSMSAlert;
      model.officeNo = officeNo;
      model.address = address;
      model.branch = partyContect.branch;
      model.branchId = partyContect.branchId;
      model.contactPerson = contactPerson;
      model.pincode = partyPincode;
      model.productTypeId = productType.id;
      model.productType = productType.name;
      // model.branchDistance=partyContect.branchPincode;
      model.branchPincode = partyContect.branchPincode;
      model.isOda = _isODA;

      var result = await _apiService.partyAPIService.saveKYCDetails(model);
      setBusy(false);
      if (result == true) {
        _navigationService.navigateReplacementTo(KycUpdateViewRoute);
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
