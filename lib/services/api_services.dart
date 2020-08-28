import 'dart:convert';
import 'dart:io';

import 'package:cwl/services/ApiSubServices/order_api_service.dart';

import 'package:cwl/models/masterindex.dart';
import 'package:http/http.dart' as http;

import 'ApiSubServices/account_api_service.dart';
import 'ApiSubServices/driver_api_service.dart';
import 'ApiSubServices/ewb_api_service.dart';
import 'ApiSubServices/invoice_api_service.dart';
import 'ApiSubServices/open_api_service.dart';
import 'ApiSubServices/party_api_service.dart';
import 'ApiSubServices/trip_api_service.dart';

class ApiService {
  static const endpoint = 'http://countrywidelogistics.in:82/api'; // Live
  //static const endpoint = 'http://192.168.1.104:8339/api'; // Local
  var client = new http.Client();

  String _token;

  String get token => _token;

  void _setToken(String apitoken) {
    _token = apitoken;
  }

  Userdetails _userdetails;
  Userdetails get userdetails => _userdetails;
  void setuserdetails(Userdetails value) {
    _userdetails = value;
  }

  /// Login
  Future<Apiresponce> login(Loginrequest model) async {
    var password = await openAPIService.getEcryptedText(model.password);
    model.password = password;
    print(json.encode(model.toJson()));
    var response = await client.post(
      '$endpoint/Account/Login',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: json.encode(model.toJson()),
    );

    var result = Apiresponce();

    if (response.statusCode == 200) {
      var apitoken = Loginresponce.fromJson(json.decode(response.body));
      var token = 'bearer ${apitoken.access_Token}';
      _setToken(token);
      print(token);
      result.error = false;
      result.message = 'Successfully LoggedIn';
      var userdetailsResponce = await accountAPIService.getUserDetails();
      setuserdetails(userdetailsResponce);
      return result;
    } else {
      result.error = true;
      result.message = response.body;
      return result;
    }
  }

  OpenAPIService _openAPIService;
  OpenAPIService get openAPIService {
    if (_openAPIService == null) {
      _openAPIService = new OpenAPIService(endpoint, client);
    }
    return _openAPIService;
  }

  AccountAPIService _accountAPIService;
  AccountAPIService get accountAPIService {
    if (_accountAPIService == null) {
      _accountAPIService = new AccountAPIService(endpoint, _token, client);
    }
    return _accountAPIService;
  }

  OrderAPIService _orderAPIservice;
  OrderAPIService get orderAPIservice {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_orderAPIservice == null) {
      _orderAPIservice = new OrderAPIService(endpoint, _token, client);
    }
    return _orderAPIservice;
  }

  EWBAPIService _ewbapiService;
  EWBAPIService get ewbAPIService {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_ewbapiService == null) {
      _ewbapiService = new EWBAPIService(endpoint, _token, client);
    }
    return _ewbapiService;
  }

  TripAPIService _tripAPIService;
  TripAPIService get tripAPIService {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_tripAPIService == null) {
      _tripAPIService = new TripAPIService(endpoint, _token, client);
    }
    return _tripAPIService;
  }

  PartyAPIService _partyAPIService;
  PartyAPIService get partyAPIService {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_partyAPIService == null) {
      _partyAPIService = new PartyAPIService(endpoint, _token, client);
    }
    return _partyAPIService;
  }

  InvoiceAPIService _invoiceAPIService;
  InvoiceAPIService get invoiceAPIService {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_invoiceAPIService == null) {
      _invoiceAPIService = new InvoiceAPIService(endpoint, _token, client);
    }
    return _invoiceAPIService;
  }

  DriverAPIService _driverAPIService;
  DriverAPIService get driverAPIService {
    if (_userdetails == null) {
      accountAPIService.getUserDetails().then((value) => setuserdetails(value));
    }
    if (_driverAPIService == null) {
      _driverAPIService = new DriverAPIService(endpoint, _token, client);
    }
    return _driverAPIService;
  }
}
