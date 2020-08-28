import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

class EWBAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  EWBAPIService(this._endpoint, this._token, this._client);

  // Get Extendable EwayBills Responce
  Future<List<Extendableewaybill>> getExtendableEwayBillsResponce() async {
    var response = await _client
        .get('$_endpoint/CWLServices/GetExtendableEwayBills', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Extendableewaybills.fromJson(json.decode(response.body)).ewaybills;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Extend EwayBill Responce
  Future<bool> getExtendEwayBillResponce(Ewaybillextendrequest model) async {
    var response = await _client.post(
      '$_endpoint/CWLServices/ExtendEwayBill',
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

  /// Get  GetConsolidated API RequestData  Responce
  Future<ConsolidatedEwayBillRequestModel> getConsolidatedEwayBillResponce(
      int tripId) async {
    var response = await _client.get(
        '$_endpoint/CWLServices/GetConsolidatedAPIRequestData/$tripId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });
    if (response.statusCode == 200) {
      return ConsolidatedEwayBillRequestModel.fromJson(
          json.decode(response.body));
    } else if (response.statusCode == 204) {
      return null;
    } else {
      throw new Exception(response.body);
    }
  }

  ///  Create Consolidated EwayBill Responce
  Future<int> createConsolidatedEwayBillRequest(
      ConsolidatedEwayBillRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/CWLServices/CreateConsolidatedEwayBill',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    print(model.toJson());
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw new Exception(response.body);
    }
  }
}
