import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/KycVerificationModel.dart';
import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

class PartyAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  PartyAPIService(this._endpoint, this._token, this._client);

  /// Get Party GSTIN Details Responce
  Future<PartyGSTINDetailsModel> getPartyGSTINDetailsResponce(
      int branchId, String gstin) async {
    var response = await _client.get(
        '$_endpoint/Party/GetPartyGSTINDetails/$branchId/$gstin',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      return PartyGSTINDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Party Location Responce
  Future<PartyLocationDetailsModel> getPartyLocationResponce(
      String pincode) async {
    var response = await _client
        .get('$_endpoint/Party/GetLocationResponce/$pincode', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return PartyLocationDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Party Save Lite Responce
  Future<int> getPartyLiteSaveResponce(Partyliteaddrequest model) async {
    print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/Party/AddPartyLite',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Party KYC List Responce
  Future<List<Commonmodel>> getPartyLatestListResponce() async {
    var response =
        await _client.get('$_endpoint/Party/GetPartyLatestList/2000', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return Commonmodellist.fromJson(json.decode(response.body)).commonlist;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Party Contect Details  Responce
  Future<GetPartyContactDetailsModel> getPartyContactDetails(
      int setpartyid) async {
    var response = await _client
        .get('$_endpoint/Party/GetPartyContactDetails/$setpartyid', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return GetPartyContactDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Save KYC Responce
  Future<bool> saveKYCDetails(GetPartyContactDetailsModel model) async {
    print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/Party/UpdatePartyContactDetails',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get verifyed Party KYC List Responce
  Future<List<Commonmodel>> getverifyedPartyResponce() async {
    var response = await _client
        .get('$_endpoint/Party/GetKycPartyListForVerification', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return Commonmodellist.fromJson(json.decode(response.body)).commonlist;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Save Verify KYC
  Future<bool> saveVerifyKYC(SaveKycVerificationModel model) async {
    print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/Party/KycVerification',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw new Exception(response.body);
    }
  }
}
