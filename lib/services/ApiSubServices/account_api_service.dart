import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

export 'package:cwl/models/test/orderTrackingFullModel.dart';

class AccountAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  AccountAPIService(this._endpoint, this._token, this._client);

  /// Register Employee
  Future<String> registerEmployee(RegisterEmployeeRequest model) async {
    var response = await _client.post(
      '$_endpoint/Account/Register/Employee',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: json.encode(model.toJson()),
    );

    return response.body;
  }

  /// Send OTP For DeviceId Update
  Future<String> sendOTPForDeviceUpdate(String userId) async {
    var response = await _client
        .get('$_endpoint/Account/RequestOTP/DeviceIdUpdate/$userId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  /// Update Device Id
  Future<bool> updateDeviceId(UpdatedeviceIdrequest model) async {
    var response = await _client.post(
      '$_endpoint/Account/UpdateDeviceId',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return response.body == "true";
    } else {
      throw new Exception(response.body);
    }
  }

  /// Request Mobile Verification OTP
  Future<String> sendMobileVerificationOTP(String otpRequestCode) async {
    var response = await _client.post(
      '$_endpoint/Account/RequestOTP/$otpRequestCode',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    return response.body;
  }

  /// Validate OTP For Mobile Confirmation
  Future<bool> validateOTPForMobileConf(
      String oTPRequestCode, String otp) async {
    var response = await _client.post(
      '$_endpoint/Account/ValidateOTP/$oTPRequestCode/$otp',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return response.body == "true";
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get User Details
  Future<Userdetails> getUserDetails() async {
    var response =
        await _client.get('$_endpoint/Account/GetMyUserDetails', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result = Userdetails.fromJson(json.decode(response.body));

      return result;
    } else {
      return null;
    }
  }

  /// Docket Track Full Responce
  Future<OrderTrackingFullModel> docketTrackingFUllResponce(
      String docketNo) async {
    var response = await _client.get(
      '$_endpoint/Order/TrackOrderFull/$docketNo',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
    );

    if (response.statusCode == 200) {
      var result = OrderTrackingFullModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Check Todays Attendance Completed or not ?
  ///
  bool _checkAttendance;
  bool get checkAttendance => _checkAttendance;
  void setcheckAttendance(bool model) {
    _checkAttendance = model;
  }

  Future<bool> checkTodaysAttendanceCompleted() async {
    var response = await _client
        .get('$_endpoint/Attendance/CheckTodaysAttendanceCompleted', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      setcheckAttendance((json.decode(response.body)));
      return (json.decode(response.body));
    } else {
      return null;
    }
  }

  /// GetLast Attendance Responce
  Future<GetLastAttendanceResponce> getLastAttendance() async {
    var response = await _client.get(
      '$_endpoint/Attendance/GetLastAttendance',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
    );

    if (response.statusCode == 200) {
      var result =
          GetLastAttendanceResponce.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// post Attendance Report Request
  Future<bool> postAttendanceReportRequestModel(
      PostAttendanceReportRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/Attendance/PostAttendanceReport',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      var result = (json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// post Attendance Request Model
  Future<bool> postAttendanceRequestModel(
      PostAttendanceRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/Attendance/PostAttendance',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      var result = (json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }
}
