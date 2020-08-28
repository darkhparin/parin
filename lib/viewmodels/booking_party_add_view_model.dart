import 'package:cwl/locator.dart';
import 'package:cwl/models/application/index.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/ui/parameeters/party_add_parameter.dart';

import 'base_model.dart';

class BookingPartyAddViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();

  PartyAddParameter _parameter;
  PartyAddParameter get parameter => _parameter;
  void setparameter(PartyAddParameter val) {
    if (val != null) {
      bool isUrp = false;
      if (val.gstin.startsWith('URP')) {
        isUrp = true;
      }
      _parameter = new PartyAddParameter(
          branch: val.branch,
          branchId: val.branchId,
          gstin: val.gstin,
          isURP: isUrp,
          pincode: val.pincode);
    } else {
      _parameter = null;
    }
    notifyListeners();
  }

  String _errormsg;
  String get errormsg => _errormsg;
  void seterrormsg(String msg) {
    _errormsg = msg;
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

  PartyGSTINDetailsModel _partyGSTINDetails;
  PartyGSTINDetailsModel get partyGSTINDetails => _partyGSTINDetails;
  void setpartyGSTINDetails(PartyGSTINDetailsModel val) {
    _partyGSTINDetails = val;
    notifyListeners();
  }

  PartyLocationDetailsModel _partyLocationDetails;
  PartyLocationDetailsModel get partyLocationDetails => _partyLocationDetails;
  void setpartyLocationDetails(PartyLocationDetailsModel val) {
    _partyLocationDetails = val;
    notifyListeners();
    if (_partyLocationDetails != null) {
      if (_partyLocationDetails.cityAreas.length > 0) {
        setcityAreas(_partyLocationDetails.cityAreas);
        setcityArea(_partyLocationDetails.cityAreas.first);
      }
    }
  }

  String _pincode;
  String get pincode => _pincode;
  void setPincode(String val) {
    _pincode = val;
    notifyListeners();
  }

  List<Commonmodel> _cityAreas = new List<Commonmodel>();
  List<Commonmodel> get cityAreas => _cityAreas;
  void setcityAreas(List<Commonmodel> model) {
    setcityArea(null);
    _cityAreas = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _cityArea;
  Commonmodel get cityArea => _cityArea;
  void setcityArea(Commonmodel model) {
    _cityArea = model;
    notifyListeners();
  }

  Future handleStartUpLogic(PartyAddParameter para) async {
    try {
      setBusy(true);

      setparameter(para);
      var productTypeResponce =
          await _apiService.orderAPIservice.getProductTypesResponce();
      setproductTypes(productTypeResponce);

      if (!parameter.isURP) {
        var partyGSTINDetails = await _apiService.partyAPIService
            .getPartyGSTINDetailsResponce(parameter.branchId, parameter.gstin);
        setpartyGSTINDetails(partyGSTINDetails);
      }

      if (parameter.isURP) {
        setPincode(parameter.pincode.toString());
        var pincodeResponce = await _apiService.partyAPIService
            .getPartyLocationResponce(parameter.pincode.toString());
        setpartyLocationDetails(pincodeResponce);
      } else {
        if (!partyGSTINDetails.isLocalGSTIN) {
          setPincode(partyGSTINDetails.pincode.toString());
          var pincodeResponce = await _apiService.partyAPIService
              .getPartyLocationResponce(partyGSTINDetails.pincode.toString());
          setpartyLocationDetails(pincodeResponce);
        } else {
          seterrormsg('Error While Getting Data , Contect H/O');
          await _dialogService.showDialog(
            title: 'Error',
            description: _errormsg,
          );
        }
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

  String _partyName;
  String get partyName => _partyName;
  void setpartyName(String val) {
    _partyName = val;
    notifyListeners();
  }

  String _partyAddress;
  String get partyAddress => _partyAddress;
  void setpartyAddress(String val) {
    _partyAddress = val;
    notifyListeners();
  }

  String _contactPerson;
  String get contactPerson => _contactPerson;
  void setcontactPerson(String val) {
    _contactPerson = val;
    notifyListeners();
  }

  String _contactPersonEmail;
  String get contactPersonEmail => _contactPersonEmail;
  void setcontactPersonEmail(String val) {
    _contactPersonEmail = val;
    notifyListeners();
  }

  String _contactPersonMobile;
  String get contactPersonMobile => _contactPersonMobile;
  void setcontactPersonMobile(String val) {
    _contactPersonMobile = val;
    notifyListeners();
  }

  Future saveParty() async {
    try {
      setBusy(true);
      var model = new Partyliteaddrequest();
      var name = '';
      var address = '';

      if (partyLocationDetails == null) {
        throw Exception('Provide Valid Pincode');
      }

      if (parameter.isURP) {
        if (partyName == null || partyName.length < 5) {
          throw Exception('Provide Valid Party Name');
        }

        if (partyAddress == null || partyAddress.length < 5) {
          throw Exception('Provide Valid Address');
        }
        name = partyName;
        address = partyAddress;
      } else {
        name = partyGSTINDetails.partyName;
        address = partyGSTINDetails.address;
      }

      if (contactPerson.length < 4) {
        throw Exception('Provide Valid Contact Person');
      }

      if (contactPersonMobile.length != 10) {
        throw Exception('Provide Valid Mobile No');
      }

      if (productType == null) {
        throw Exception('Provide Select Product Type');
      }

      model.address = address;
      model.branchId = parameter.branchId;
      model.cityAreaId = cityArea.id;
      model.cityId = partyLocationDetails.city.id;
      model.contactPerson = contactPerson;
      model.deliveryTypeId = 1;
      model.employeeId = _apiService.userdetails.employeeId;
      model.gstin = parameter.gstin;
      model.partyname = name;
      model.phoneM = contactPersonMobile;
      model.phoneO = contactPersonMobile;
      model.pickupTypeId = 6;
      model.pincode = int.parse(_pincode);
      model.productTypeId = productType.id;
      model.stateId = partyLocationDetails.state.id;
      model.userId = _apiService.userdetails.userId;
      var result =
          await _apiService.partyAPIService.getPartyLiteSaveResponce(model);

      if (result > 0) {
        await _dialogService.showDialog(
          title: 'Success',
          description: 'Party Added',
        );
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
