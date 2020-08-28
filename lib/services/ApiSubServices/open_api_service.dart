import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

class OpenAPIService {
  final String _endpoint;
  final http.Client _client;

  OpenAPIService(this._endpoint, this._client);

  /// Check Update
  Future<Cwlappversion> getCurrentAppVersion() async {
    var response =
        await _client.get('$_endpoint/CWLServices/GetAppVersion/3', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var result = Cwlappversion.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Encryption
  Future<String> getEcryptedText(String clearText) async {
    var queryParameters = {
      'input': clearText,
    };
    var uri = Uri.http('countrywidelogistics.in:82',
        '/api/CWLServices/GetCWLString', queryParameters);
    var response = await _client.get(uri, headers: {
      ///HttpHeaders.authorizationHeader: 'Token $token',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'text/plain'
    });

    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return 'Error';
    }
  }

  /// Pincode Responce Servicibility  Responce
  Future<PartyServicibilityResponce> getPincodeResponce(String pincode) async {
    var response = await _client
        .get('$_endpoint/CWLServices/PincodeServiceability/$pincode', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var result =
          PartyServicibilityResponce.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }
}
