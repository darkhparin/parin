import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/models/params/partbupdateparam.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/parameeters/party_add_parameter.dart';
import 'package:cwl/viewmodels/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

import '../locator.dart';

class BookingViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _appVersion;
  String get appVersion => _appVersion;
  void setappVersion() {
    PackageInfo.fromPlatform().then((val) => {_appVersion = val.version});
    notifyListeners();
  }

  List<Commonmodel> _serviceTypes = new List<Commonmodel>();
  List<Commonmodel> get serviceTypes => _serviceTypes;
  void setserviceTypes(List<Commonmodel> model) {
    setserviceType(null);
    settransportAsList(null);
    _serviceTypes = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _serviceType = new Commonmodel();
  Commonmodel get serviceType => _serviceType;
  void setserviceType(Commonmodel model) async {
    _serviceType = model;
    notifyListeners();
    if (_serviceType != null) {
      var result = await _apiService.orderAPIservice
          .getTransportAsResponce(_serviceType.id);
      settransportAsList(result);
    }
  }

  List<Commonmodel> _paymentModes = new List<Commonmodel>();
  List<Commonmodel> get paymentModes => _paymentModes;
  void setpaymentModes(List<Commonmodel> model) {
    setpaymentMode(null);
    setrateCards(null);
    _paymentModes = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _paymentMode = new Commonmodel();
  Commonmodel get paymentMode => _paymentMode;
  void setpaymentMode(Commonmodel model) {
    _paymentMode = model;
    notifyListeners();
  }

  List<Commonmodel> _transportAsList = new List<Commonmodel>();
  List<Commonmodel> get transportAsList => _transportAsList;
  void settransportAsList(List<Commonmodel> model) {
    settransportAs(null);
    setrateCards(null);
    _transportAsList = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _transportAs = new Commonmodel();
  Commonmodel get transportAs => _transportAs;
  void settransportAs(Commonmodel model) {
    setrateCards(null);
    _transportAs = model;
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

  List<Commonmodel> _packageTypes = new List<Commonmodel>();
  List<Commonmodel> get packageTypes => _packageTypes;
  void setpackageTypes(List<Commonmodel> model) {
    setpackageType(null);
    _packageTypes = model == null ? new List<Commonmodel>() : model;
    notifyListeners();
  }

  Commonmodel _packageType = new Commonmodel();
  Commonmodel get packageType => _packageType;
  void setpackageType(Commonmodel model) {
    _packageType = model;
    notifyListeners();
  }

  List<Shapemodel> _shapeTypes = new List<Shapemodel>();
  List<Shapemodel> get shapeTypes => _shapeTypes;
  void setshapeTypes(List<Shapemodel> model) {
    setshapeType(null);
    _shapeTypes = model == null ? new List<Shapemodel>() : model;
    notifyListeners();
  }

  Shapemodel _shapeType = new Shapemodel();
  Shapemodel get shapeType => _shapeType;
  void setshapeType(Shapemodel model) {
    _shapeType = model;
    notifyListeners();
  }

  Future handleStartUpLogic() async {
    try {
      setBusy(true);
      setappVersion();
      var serviceTypeResponce =
          await _apiService.orderAPIservice.getServiceTypesResponce();
      setserviceTypes(serviceTypeResponce);
      var paymentmodeResponce =
          await _apiService.orderAPIservice.getPaymentModesResponce();
      setpaymentModes(paymentmodeResponce);
      var productTypeResponce =
          await _apiService.orderAPIservice.getProductTypesResponce();
      setproductTypes(productTypeResponce);
      var packageTypeResponce =
          await _apiService.orderAPIservice.getPackageTypesResponce();
      setpackageTypes(packageTypeResponce);
      var shapetyperesponce =
          await _apiService.orderAPIservice.getShapeTypesResponce();
      setshapeTypes(shapetyperesponce);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      setserviceTypes(null);
      setpaymentModes(null);
      setproductTypes(null);
      setpackageTypes(null);
    }
  }

  String _errordocketno;
  String get errordocketno => _errordocketno;
  void seterrordocketno(String error) {
    _errordocketno = error;
    notifyListeners();
  }

  String _errorewaybillno;
  String get errorewaybillno => _errorewaybillno;
  void seterrorewaybillno(String error) {
    if (error != null) {
      error = error.replaceAll('Exception : {', '');
      error = error.replaceAll('}', '');
    }
    _errorewaybillno = error;
    notifyListeners();
  }

  Docketnoresponce _docketnoresponce;
  Docketnoresponce get docketnoresponce => _docketnoresponce;
  void setdocketnoresponce(Docketnoresponce value) {
    _docketnoresponce = value;
    notifyListeners();
  }

  String _deliveryPincode;
  String get deliveryPincode => _deliveryPincode;
  void setdeliveryPincode(String pincode) async {
    _deliveryPincode = pincode;
    notifyListeners();
    if (pincode.length > 5) {
      var deliveyBrnach =
          await _apiService.orderAPIservice.getDeliveryBranchResponce(pincode);
      if (deliveyBrnach != null) {
        setdeliveryBrnach(deliveyBrnach.id, deliveyBrnach.name);
        setcanChangeDeliveryBranch(false);
      }
    }
  }

  Ewaybillresponce _ewaybillresponce;
  Ewaybillresponce get ewaybillresponce => _ewaybillresponce;
  void setewaybillresponce(Ewaybillresponce value) {
    _ewaybillresponce = value;
    notifyListeners();
  }

  Future getDocektNoResponce(String docketno) async {
    try {
      setBusy(true);
      seterrordocketno(null);
      seterrorewaybillno(null);
      clearEwayBilllist();
      if (docketno.length == 11 || docketno.length == 7) {
        _docketnoresponce =
            await _apiService.orderAPIservice.getDocketNoResponce(docketno);
        setBusy(false);
        // if (_docketnoresponce != null) {
        //   await _dialogService.showDialog(
        //     title: 'Success',
        //     description: json.encode(_docketnoresponce.toJson()),
        //   );
        // }
      } else {
        setBusy(false);
      }
    } catch (e) {
      setBusy(false);
      seterrordocketno(e.toString());
    }
  }

  String _ewayBillNo;
  String get ewayBillNo => _ewayBillNo;
  void setewayBillNo(String ewb) {
    _ewayBillNo = ewb;
    notifyListeners();
  }

  List<num> _ewayBillList = new List<num>();
  List<num> get ewayBillList => _ewayBillList;

  void addEwayBillNo(num ewaybillNo) {
    if (_ewayBillList != null) {
      if (!_ewayBillList.contains(ewaybillNo)) _ewayBillList.add(ewaybillNo);
    }
    notifyListeners();
  }

  void removeEwayBillNo(num ewaybillNo) {
    if (_ewayBillList != null) {
      if (_ewayBillList.contains(ewaybillNo)) _ewayBillList.remove(ewaybillNo);
    }
    notifyListeners();
  }

  void removeEwayBillNoatindex(int index) {
    if (_ewayBillList != null) {
      var ewaybillno = _ewayBillList.elementAt(index);
      var apiewbitem = _ewaybillresponce.allEwayBills
          .firstWhere((i) => i.ewayBillNo == ewaybillno);
      _ewaybillresponce.allEwayBills.remove(apiewbitem);
      _ewayBillList.removeAt(index);
    }
    notifyListeners();
    if (_ewayBillList.length < 1) {
      clearEwayBilllist();
    }
  }

  void clearEwayBilllist() {
    _ewayBillList = new List<num>();
    _ewaybillresponce = null;
    setconsignors(null);
    setconsignor(null);
    setconsignees(null);
    setconsignee(null);
    notifyListeners();
  }

  List<EwbParty> _consignors = new List<EwbParty>();
  List<EwbParty> get consignors => _consignors;
  void setconsignors(List<EwbParty> value) {
    setconsignor(null);
    _consignors = value == null ? new List<EwbParty>() : value;
    notifyListeners();

    if (_consignors.length == 1) {
      setconsignor(_consignors.first);
    }
  }

  EwbParty _consignor;
  EwbParty get consignor => _consignor;
  void setconsignor(EwbParty party) {
    _consignor = party;
    notifyListeners();

    if (_consignor != null) {
      var productType = new Commonmodel();

      if (_consignor.productType != null) {
        productType.id = _consignor.productType.productId;
        productType.name = _consignor.productType.productName;
      } else {
        productType.name = 'MC Parts';
        productType.id = 3;
      }

      if (_productTypes.length <= 0) {
        var tmplist = new List<Commonmodel>();
        tmplist.add(productType);
        setproductTypes(tmplist);
        setproductType(productType);
      } else {
        var tmpProd = _productTypes.where((ele) => ele.id == 3).first;
        if (tmpProd != null) {
          setproductType(tmpProd);
        } else {
          _productTypes.add(productType);
          setproductTypes(_productTypes);
          setproductType(productType);
        }
      }

      _apiService.orderAPIservice
          .getConsignorPinicodeResponce(consignor.partyId.toString())
          .then((onValue) => {setconsignorpincodes(onValue.pincodes)});
    } else {
      setconsignorpincodes(null);
      setproductType(null);
    }
  }

  List<EwbParty> _consignees = new List<EwbParty>();
  List<EwbParty> get consignees => _consignees;
  void setconsignees(List<EwbParty> value) {
    setconsignee(null);
    _consignees = value == null ? new List<EwbParty>() : value;
    notifyListeners();

    if (_consignees.length == 1) {
      setconsignee(_consignees.first);
    }
  }

  EwbParty _consignee;
  EwbParty get consignee => _consignee;
  void setconsignee(EwbParty party) {
    _consignee = party;
    notifyListeners();
    if (_consignee != null) {
      _apiService.orderAPIservice
          .getConsigneePinicodeResponce(consignee.partyId.toString())
          .then((onValue) => {setconsigneepincodes(onValue.pincodes)});
    } else {
      setconsigneepincodes(null);
    }
  }

  bool _canChangeDeliveryBranch = false;
  bool get canChangeDeliveryBranch => _canChangeDeliveryBranch;
  void setcanChangeDeliveryBranch(bool val) {
    _canChangeDeliveryBranch = val;
    notifyListeners();
  }

  void setdeliveryBrnach(int branchId, String name) async {
    if (_ewaybillresponce != null) {
      _ewaybillresponce.deliveryBranchId = branchId;
      _ewaybillresponce.deliveryBranch = name;
      String gstin = _ewaybillresponce.allEwayBills.first.consigneeGSTIN.trim();
      var parties = await _apiService.orderAPIservice
          .getConsigneeListResponce(branchId, gstin);
      _ewaybillresponce.consignees = parties;
      setconsignees(parties);
    }
  }

  Future getEwayBillReaponce() async {
    try {
      setBusy(true);
      seterrorewaybillno(null);
      setconsignors(null);
      setconsignees(null);
      // var ewaybillReq = new Ewaybillrequest();
      // ewaybillReq.bookingBranchId = _docketnoresponce.bookingBranchId;
      // ewaybillReq.deliveryPincode = num.parse(_deliveryPincode);
      addEwayBillNo(num.parse(_ewayBillNo));
      // ewaybillReq.ewayBills = _ewayBillList;
      var tmpModel = new EwayBillRawRequestModel();
      tmpModel.ewayBills = _ewayBillList;
      _ewaybillresponce = await _apiService.orderAPIservice
          .getEwayBillRawResponce(tmpModel); //(ewaybillReq);
      if (_ewaybillresponce != null) {
        if (_ewaybillresponce.allEwayBills.any((res) => res.hasErrors)) {
          var error =
              _ewaybillresponce.allEwayBills.firstWhere((res) => res.hasErrors);
          throw Exception(error.errors.toString());
        } else {
          if (_ewaybillresponce.docketResponce.bookingBranchId <= 0) {
            if (_ewaybillresponce.deliveryBranchId > 0) {
              setdeliveryPincode(_ewaybillresponce
                  .allEwayBills.first.consigneePincode
                  .toString());
            }
          } else {
            if (_docketnoresponce.bookingBranchId !=
                _ewaybillresponce.docketResponce.bookingBranchId) {
              var canchangeBranch = await _apiService.orderAPIservice
                  .getCanChangeBranchResponce(_docketnoresponce.bookingBranchId,
                      _ewaybillresponce.docketResponce.bookingBranchId);

              if (!canchangeBranch) {
                //  if(!canchangeBranch)  (Change)
                var result = await _dialogService.showConfirmationDialog(
                    cancelTitle: 'No',
                    confirmationTitle: 'Yes',
                    title: 'Are you Sure ?',
                    description:
                        'Branch of pickup location does not match with branch of stationary , Do you want to use this stationary in ${_ewaybillresponce.docketResponce.bookingBranch} branch ?');
                if (result.confirmed) {
                  setdocketnoresponce(_ewaybillresponce.docketResponce);
                }
              }
            }
          }

          if (_ewaybillresponce.consignors != null) {
            if (_ewaybillresponce.consignors.length > 0) {
              setconsignors(_ewaybillresponce.consignors);
            } else {
              setconsignors(null);
            }
          } else {
            setconsignors(null);
            setBusy(false);
            // await _dialogService.showDialog(
            //   title: 'Consignor Not Found',
            //   description: 'Add Party From Desktop  App',
            // );
          }

          if (_ewaybillresponce.consignee_IsURP) {
            if (_ewaybillresponce.deliveryBranchId <= 0) {
              setcanChangeDeliveryBranch(true);
            }
          } else {
            if (_ewaybillresponce.consignees != null) {
              if (_ewaybillresponce.consignees.length > 0) {
                setconsignees(_ewaybillresponce.consignees);
              } else {
                setconsignees(null);
              }
            } else {
              setconsignees(null);
              setBusy(false);
            }
          }
          setBusy(false);
          // await _dialogService.showDialog(
          //   title: 'Success',
          //   description: json.encode(_ewaybillresponce.toJson()),
          // );
        }
      } else {
        clearEwayBilllist();
      }
      setBusy(false);
    } catch (e) {
      setBusy(false);
      clearEwayBilllist();
      seterrorewaybillno(e.toString());
    }
  }

  List<Pincodeshort> _consignorpincodes = new List<Pincodeshort>();
  List<Pincodeshort> get consignorpincodes => _consignorpincodes;

  void setconsignorpincodes(List<Pincodeshort> value) {
    setconsignorpincode(null);
    _consignorpincodes = value == null ? new List<Pincodeshort>() : value;
    notifyListeners();
    if (_consignorpincodes.length == 1) {
      setconsignorpincode(_consignorpincodes.first);
    }
  }

  Pincodeshort _consignorpincode = new Pincodeshort();
  Pincodeshort get consignorpincode => _consignorpincode;

  void setconsignorpincode(Pincodeshort model) {
    _consignorpincode = model;
    notifyListeners();
  }

  List<Pincodeshort> _consigneepincodes = new List<Pincodeshort>();
  List<Pincodeshort> get consigneepincodes => _consigneepincodes;

  void setconsigneepincodes(List<Pincodeshort> value) {
    setconsigneepincode(null);
    _consigneepincodes = value == null ? new List<Pincodeshort>() : value;
    notifyListeners();
    if (_consigneepincodes.length == 1) {
      setconsigneepincode(_consigneepincodes.first);
    }
  }

  Pincodeshort _consigneepincode = new Pincodeshort();
  Pincodeshort get consigneepincode => _consigneepincode;

  void setconsigneepincode(Pincodeshort model) {
    _consigneepincode = model;
    notifyListeners();
  }

  Liablepartyresponce _liablepartyresponce;
  Liablepartyresponce get liablepartyresponce => _liablepartyresponce;
  void setliablepartyresponce(Liablepartyresponce model) {
    _liablepartyresponce = model;
    notifyListeners();
  }

  Future getLiableParty() async {
    try {
      var liablePartyResponce = await _apiService.orderAPIservice
          .getLiablePartyResponce(
              _paymentMode.id, _consignor.partyId, _consignee.partyId);
      setliablepartyresponce(liablePartyResponce);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  List<Ratecardresponce> _rateCards = new List<Ratecardresponce>();
  List<Ratecardresponce> get rateCards => _rateCards;
  void setrateCards(List<Ratecardresponce> value) {
    setrateCard(null);
    setrateCardCharges(null);
    if (value != null) value = value.where((v) => v.isSelectable).toList();
    _rateCards = value == null ? new List<Ratecardresponce>() : value;
    notifyListeners();
    if (_rateCards.length == 1) {
      setrateCard(_rateCards.first);
    }
  }

  Ratecardresponce _rateCard;
  Ratecardresponce get rateCard => _rateCard;
  void setrateCard(Ratecardresponce model) async {
    _rateCard = model;
    notifyListeners();

    if (_rateCard != null) {
      try {
        await getRateCardChargesAsync();
      } catch (e) {}
    } else {
      setrateCardChargesResponce(null);
    }
  }

  Future navigateToPartBUpdateRoute() async {
    var params = new ParamPartBUpdate(
        docketNo: docketnoresponce.docketNo, ewayBills: _ewayBillList);
    var result = await _navigationService.navigateTo(PartBUpdateViewRoute,
        arguments: params);
    if (result != null) {
      if (result == 'false') {
        throw Exception('Please Update Part B');
      } else {
        await getRateCardsAsync();
      }
    }
  }

  Future getRateCardsAsync() async {
    try {
      setBusy(true);

      var isPartBCreated = await _apiService.orderAPIservice
          .getIsPartBCreatedResponce(_ewayBillList);
      setBusy(false);
      if (!isPartBCreated) {
        await navigateToPartBUpdateRoute();
      } else {
        await getLiableParty();
        Ratecardrequestmodel model = new Ratecardrequestmodel();
        model.bookingBranchId = _docketnoresponce.bookingBranchId;
        DateTime now = DateTime.now();
        model.bookingDate = DateFormat('yyyy-MM-dd').format(now);
        model.consigneeId = _consignee.partyId;
        model.consigneePincode = _consigneepincode.pincode;
        model.consignorId = _consignor.partyId;
        model.consignorPincode = _consignorpincode.pincode;
        model.deliveryBranchId = _ewaybillresponce.deliveryBranchId;
        model.paymentModeId = _paymentMode.id;
        model.paymentPartyId = _liablepartyresponce.partyId;
        model.servicetypeId = _serviceType.id;
        model.transportAsId = _transportAs.id;
        model.userId = _apiService.userdetails.userId;

        var ratecardResponce =
            await _apiService.orderAPIservice.getRateCardResponce(model);
        setBusy(false);
        if (ratecardResponce.length > 0) {
          setrateCards(ratecardResponce);
        } else {
          await _dialogService.showDialog(
            title: 'Error',
            description: 'No Rate Card Found',
          );
        }
      }
    } catch (e) {
      setBusy(false);

      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  Ratecardcchargesresponce _ratecardcchargesresponce;
  Ratecardcchargesresponce get rateCardChargesResponce =>
      _ratecardcchargesresponce;
  void setrateCardChargesResponce(Ratecardcchargesresponce model) {
    _ratecardcchargesresponce = model;
    notifyListeners();
    if (_ratecardcchargesresponce != null) {
      setrateCardCharges(model.rateCardCharges);
    } else {
      setrateCardCharges(null);
    }
  }

  List<Ratecardcharges> _rateCardCharges = new List<Ratecardcharges>();
  List<Ratecardcharges> get rateCardCharges => _rateCardCharges;
  void setrateCardCharges(List<Ratecardcharges> value) {
    setrateCardCharge(null);
    _rateCardCharges = value == null ? new List<Ratecardcharges>() : value;
    notifyListeners();
  }

  Ratecardcharges _rateCardCharge = new Ratecardcharges();
  Ratecardcharges get rateCardCharge => _rateCardCharge;
  void setrateCardCharge(Ratecardcharges value) {
    _rateCardCharge = value;
    notifyListeners();
  }

  Future getRateCardChargesAsync() async {
    try {
      setBusy(true);
      Ratecardchargesrequest model = new Ratecardchargesrequest();
      model.bookingBranchId = _docketnoresponce.bookingBranchId;
      model.deliveryBranchId = _ewaybillresponce.deliveryBranchId;

      model.isDefault = _rateCard.isDefault;
      model.oDACard_Id = _rateCard.odaCard_Id;
      model.odadistance = _rateCard.odaDistance;
      model.oPACard_Id = _rateCard.opaCard_Id;
      model.opadistance = _rateCard.opaDistance;
      model.ratecardId = _rateCard.rateCardId;
      model.serviceTypeId = _serviceType.id;
      model.transportAsId = _transportAs.id;

      var ratecardChargesResponce =
          await _apiService.orderAPIservice.getRateCardChargesResponce(model);
      setBusy(false);
      if (ratecardChargesResponce != null) {
        setrateCardChargesResponce(ratecardChargesResponce);
        await _dialogService.showDialog(
          title: 'Success',
          description: 'RateCard Charges',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Error',
          description: 'RateCard Charges Not Found',
        );
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  int _qty;
  int get qty => _qty;
  void setqty(String value) {
    _qty = int.parse(value);
    notifyListeners();
  }

  int _totalweight;
  int get totalweight => _totalweight;
  void settotalweight(String value) {
    _totalweight = int.parse(value);
    notifyListeners();
  }

  List<int> _units = [0, 1, 2];
  List<int> get units => _units;

  int _unit = 0;
  int get unit => _unit;
  void setunit(int value) {
    _unit = value;
    notifyListeners();
  }

  List<Orderlineresponce> _orderLines = new List<Orderlineresponce>();
  List<Orderlineresponce> get orderLines => _orderLines;
  void setorderLines(List<Orderlineresponce> model) {
    _orderLines = model == null ? new List<Orderlineresponce>() : model;
    notifyListeners();
  }

  Future addOrderLine(
      {@required String length, String height = '', String width = ''}) async {
    try {
      setBusy(true);
      Orderlinerequest model = new Orderlinerequest();
      model.actualweight = totalweight;
      model.dimentionMode = unit;
      model.oHeight = height == '' ? 0 : num.parse(height);
      model.oLength = length == null ? 0 : num.parse(length);
      model.oWidth = width == '' ? 0 : num.parse(width);
      model.packageTypeId = packageType.id;
      model.privateMark = '';
      model.productTypeId = productType.id;
      model.qty = qty;
      model.rate = 0;
      model.serviceTypeId = serviceType.id;
      model.shapeId = shapeType.id;
      model.volumeFector = rateCard.volumeFactor;
      var orderLine =
          await _apiService.orderAPIservice.getOrderLineResponce(model);
      setBusy(false);
      if (orderLine != null) {
        if (!_orderLines.any((ol) =>
            ol.actualWeight == model.actualweight &&
            ol.packageType_Id == model.packageTypeId &&
            ol.productType_Id == model.productTypeId)) {
          _orderLines.add(orderLine);
        }
      }
      notifyListeners();
      await getRateCalculation();
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  void removeOrderLineAtIndex(int index) async {
    if (_orderLines != null) {
      var orderline = _orderLines.elementAt(index);
      if (orderline != null) _orderLines.remove(orderline);
    }
    notifyListeners();
    if (_orderLines.length > 0) {
      await getRateCalculation();
    } else {
      setratecalculationresponce(null);
    }
  }

  void clearOrderLine() {
    _orderLines = new List<Orderlineresponce>();
    notifyListeners();
    setratecalculationresponce(null);
  }

  Ratecalculationresponce _ratecalculationresponce;
  Ratecalculationresponce get ratecalculationresponce =>
      _ratecalculationresponce;
  void setratecalculationresponce(Ratecalculationresponce model) {
    _ratecalculationresponce = model;
    notifyListeners();
  }

  Future getRateCalculation() async {
    try {
      setBusy(true);
      Ratecalculationrequest model = new Ratecalculationrequest();

      num actualWeight = 0;
      for (num actw in _orderLines.map((ol) => ol.actualWeight).toList()) {
        actualWeight += actw;
      }
      model.actualWeight = actualWeight;
      model.bookingBranchId = _docketnoresponce.bookingBranchId;
      num chargedWeight = 0;
      for (num actw in _orderLines.map((ol) => ol.chargedWeight).toList()) {
        chargedWeight += actw;
      }
      model.chargedWeight = chargedWeight;
      model.codValue = 0;
      model.company_FinalRate = _ratecardcchargesresponce.company_FinalRate;
      model.company_Margin = _ratecardcchargesresponce.company_Margin;
      model.consigneeId = consignee.partyId;
      model.consigneePincode = _consigneepincode.pincode;
      model.consignorId = _consignor.partyId;
      model.consignorPincode = _consignorpincode.pincode;
      model.deliveryBranchId = _ewaybillresponce.deliveryBranchId;
      model.deliveryTypeId = _consignee.deliveryType.deliveryTypeId;
      model.docketNo = _docketnoresponce.docketNo;
      model.ftlRateCardChargesId = 0; // TODO : Do Something for this
      model.fuelSurchargePercent = _fualsarcharge;
      model.fovPercent = _fov;
      model.isCOD = _codCharge;
      model.isDACC = false;
      model.loadingCharge = _lodingCharge; //_rateCard.loadingCharges;
      model.miscCharge =
          _rateCard.miscCharge > _misCharge ? _rateCard.miscCharge : _misCharge;
      model.oDADistance = _rateCard.odaDistance;
      model.oPADistance = _rateCard.opaDistance;
      model.partyRateCardId = _rateCard.partyRateCardId;
      model.payeeId = _liablepartyresponce.partyId;
      model.paymentModeId = _paymentMode.id;
      model.pickupTypeId = _consignor.pickupType.pickUpTypeId;
      num qty = 0;
      for (num q in _orderLines.map((ol) => ol.qty).toList()) {
        qty += q;
      }
      model.qty = qty;
      model.serviceTypeId = _serviceType.id;
      num totalInvoiceValue = 0;
      for (num inv in _ewaybillresponce.allEwayBills
          .map((ewb) => ewb.total_invoice_value)
          .toList()) {
        totalInvoiceValue += inv;
      }
      model.totalInvoiceValue = totalInvoiceValue;
      model.transportAsId = _transportAs.id;
      model.unloadingCharge = _unloding; //_rateCard.unLoadingcharges;

      var responce =
          await _apiService.orderAPIservice.getRateCalculationResponce(model);
      setBusy(false);
      if (responce != null) {
        setratecalculationresponce(responce);
        // await _dialogService.showDialog(
        //   title: 'Success',
        //   description: json.encode(ratecalculationresponce.toJson()),
        // );
      } else {
        setratecalculationresponce(null);
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  bool _codCharge = false;
  bool get codCharge => _codCharge;
  void setcodChargenotify(bool val) async {
    bool tmp = val;
    _codCharge = tmp != null ? tmp : false;
    notifyListeners();
    if (_codCharge != null) {
      await getRateCalculation();
    }
  }

  num _misCharge = 0;
  num get misCharge => _misCharge;
  void setmisChargenotify(String val) async {
    num tmp = num.tryParse(val);
    _misCharge = tmp != null ? tmp : 0;
    notifyListeners();
    if (_misCharge > 0) {
      await getRateCalculation();
    }
  }

  num _lodingCharge = 0;
  num get lodingCharge => _lodingCharge;
  void setLodingChargenotify(String val) async {
    num tmp = num.tryParse(val);
    _lodingCharge = tmp != null ? tmp : 0;
    notifyListeners();
    if (_lodingCharge > 0) {
      await getRateCalculation();
    }
  }

  num _unloding = 0;
  num get unlodign => _unloding;
  void setUnlodingChargenoty(String val) async {
    num tmp = num.tryParse(val);
    _unloding = tmp != null ? tmp : 0;
    notifyListeners();
    if (_unloding > 0) {
      await getRateCalculation();
    }
  }

  num _fualsarcharge = 0;
  num get fualsarcharge => _fualsarcharge;
  void setfualsarcharge(String val) async {
    num tmp = num.tryParse(val);
    _fualsarcharge = tmp != null ? tmp : 0;
    notifyListeners();
    if (_fualsarcharge > 0) {
      await getRateCalculation();
    }
  }

  num _fov = 0;
  num get fov => _fov;
  void setfov(String val) async {
    num tmp = num.tryParse(val);
    _fov = tmp != null ? tmp : 0;
    notifyListeners();
    if (_fov > 0) {
      await getRateCalculation();
    }
  }

  Future navigateToAddParty(
      {int branchId,
      String branch,
      String gstin,
      bool isURP,
      int pincode = 0}) async {
    var parameter = new PartyAddParameter(
        branch: branch,
        branchId: branchId,
        gstin: gstin,
        isURP: isURP,
        pincode: pincode);
    var result = await _navigationService.navigateTo(BookingPartyAddViewRoute,
        arguments: parameter);
  }

  Future saveOrder(String accountCopy) async {
    try {
      if (accountCopy == null) {
        throw Exception('Please Upload Account Copy');
      }
      setBusy(true);
      var model = new Ordersaverequest();
      model.accountCopyFilePath = '';
      model.accountCopyVerifiedBy = 0;
      model.bookingBranchId = _docketnoresponce.bookingBranchId;
      model.bookingDate =
          '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}';
      model.bookingTime =
          '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
      model.collectionTypeId = 3; // TODO :
      model.consigneeId = _consignee.partyId;
      model.consignorId = _consignor.partyId;
      model.deliveryBranchId = _ewaybillresponce.deliveryBranchId;
      var deliveryLocation = await _apiService.orderAPIservice
          .getOrderLocationResponce(_consigneepincode.pincode);
      model.deliveryLocation = new Locationmodel();
      model.deliveryLocation.address = _consigneepincode.address;
      model.deliveryLocation.cityArea_Id = deliveryLocation.cityArea_Id;
      model.deliveryLocation.city_Id = deliveryLocation.city_Id;
      model.deliveryLocation.postalCode = deliveryLocation.postalCode;
      model.deliveryLocation.state_Id = deliveryLocation.state_Id;

      model.docketNo = _docketnoresponce.docketNo;
      model.docketRemark = ''; // TODO
      model.ewayBills = _ewaybillresponce.allEwayBills;
      model.hasCOD = false;
      model.hasDACC = false;
      model.isAccountCopyVerified = false;
      model.liablePartyId = _liablepartyresponce.partyId;
      model.newRate = _ratecardcchargesresponce.company_FinalRate;
      model.orderCharges = _ratecalculationresponce;
      model.orderLines = _orderLines;
      model.partyRateCardId = _rateCard.partyRateCardId;
      model.paymentModeId = _paymentMode.id;
      var pickupLocation = await _apiService.orderAPIservice
          .getOrderLocationResponce(_consignorpincode.pincode);
      model.pickUpLoaction = new Locationmodel();
      model.pickUpLoaction.address = _consignorpincode.address;
      model.pickUpLoaction.cityArea_Id = pickupLocation.cityArea_Id;
      model.pickUpLoaction.city_Id = pickupLocation.city_Id;
      model.pickUpLoaction.postalCode = pickupLocation.postalCode;
      model.pickUpLoaction.state_Id = pickupLocation.state_Id;

      model.rateCardCharges = _ratecalculationresponce.rateCardCharges;
      model.rateCardId = _rateCard.rateCardId;
      model.serviceTypeId = _serviceType.id;
      model.transportAsId = _transportAs.id;
      model.userId = _apiService.userdetails.userId;
      model.deviceTypeId = 3;
      model.vendorId = 0; // TODO
      model.verifyAtSave = false;
      var result =
          await _apiService.orderAPIservice.getSaveOrderResponce(model);
      int orderidNo = result;
      setBusy(false);
      if (result > 0) {
        await _uploadAccountCopy(result, accountCopy);

        var responce = await _dialogService.showConfirmationDialog(
            title: 'Create Invoice',
            description: 'Are You Sure ?',
            cancelTitle: 'Cancel',
            confirmationTitle: 'Create Invoice');

        if (responce.confirmed) {
          _navigationService.navigateReplacementTo(OrderInvoiceCreateRoute,
              arguments: orderidNo);
        } else {
          _navigationService.navigateReplacementTo(BookingViewRoute);
        }
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  Future _uploadAccountCopy(int orderId, String accountCopy) async {
    try {
      await _apiService.orderAPIservice
          .getAccountCopyUploadResponce(orderId, accountCopy);
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
