import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:cwl/models/driver/UpdateTripLocaion_request_model.dart';
import 'package:http/http.dart' as http;

class DriverAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  DriverAPIService(this._endpoint, this._token, this._client);

  /// Get Driver Active Trip Responce
  Future<DriverActiveTripModel> getDriverActiveTripResponce() async {
    var response =
        await _client.get('$_endpoint/Driver/GetActiveTrips', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result = DriverActiveTripModel.fromJson(json.decode(response.body));
      return result;
    } else if (response.statusCode == 204) {
      return null;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get TripRoutes Responce
  Future<List<TripRouteModel>> getTripRoutesResponce(int tripId) async {
    var response = await _client
        .get('$_endpoint/Trip/Update/GetTripRoutes/$tripId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          TripRouteModelList.fromJson(json.decode(response.body)).triproutes;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip Truck Load Responce
  Future<List<TripTruckLoadModel>> getTripTruckLoadResponce(
      int tripId, int currentBranchId) async {
    var response = await _client.get(
        '$_endpoint/Trip/Update/GetTruckLoadAsync/$tripId/$currentBranchId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result = TripTruckLoadModelList.fromJson(json.decode(response.body))
          .truckloads;
      return result;
    } else {
      if (response.body == '') {
        return null;
      } else {
        throw new Exception(response.body);
      }
    }
  }

  /// Get Trip Can Plan Responce
  Future<bool> getTripCanPlanResponce(int tripRouteId) async {
    var response = await _client
        .get('$_endpoint/Trip/Update/CanPlan/$tripRouteId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return response.body == "true";
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get LoadDetails For Plan
  Future<List<TripTruckLoadDetailsModel>> getLoadDetailsForPlanResponce(
      int tripRouteId, String code) async {
    var response = await _client.get(
        '$_endpoint/Trip/Update/GetLoadDetails/$tripRouteId/$code',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result =
          TripTruckLoadDetailsModelList.fromJson(json.decode(response.body))
              .truckloaddetails;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Plan For Driver Responce
  Future<bool> getTripPlanForDriverResponce(
      TripPlanForDriverRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/Trip/Update/PlanForDriver',
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

  /// Get Can Arrive Trip Responce
  Future<int> getTripArriveResponce(int tripId) async {
    var response = await _client
        .get('$_endpoint/Trip/Update/CanArriveTrip/$tripId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw new Exception(response.body);
    }
  }

  /// Update Driver Location
  Future updateDriverLocation(UpdateTripLocaion_request_model model) async {
    var response = await _client.post(
      '$_endpoint/Driver/UpdateTripLocaion',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return response.body == null;
    } else {
      throw new Exception(response.body);
    }
  }
}
