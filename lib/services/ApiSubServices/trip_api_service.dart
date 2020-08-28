import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

class TripAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  TripAPIService(this._endpoint, this._token, this._client);

  /// Get Trip Types Responce
  Future<List<TripTypeModel>> getTripTypeResponce() async {
    var response =
        await _client.get('$_endpoint/Trip/Create/GetTripTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          TripTypeListModel.fromJson(json.decode(response.body)).tripTypes;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip From Branches Responce
  Future<List<BranchShortModel>> getTripFromBranchesResponce() async {
    var response =
        await _client.get('$_endpoint/Trip/Create/GetFromBranches', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          BranchShortListModel.fromJson(json.decode(response.body)).branchList;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip To Branches Responce
  Future<List<BranchShortModel>> getTripToBranchesResponce() async {
    var response =
        await _client.get('$_endpoint/Trip/Create/GetToBranches', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          BranchShortListModel.fromJson(json.decode(response.body)).branchList;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip Service Type Responce
  Future<List<TripServiceTypeModel>> getTripServiceResponce() async {
    var response =
        await _client.get('$_endpoint/Trip/Create/GetServiceTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result = TripServiceTypeListModel.fromJson(json.decode(response.body))
          .servicetypes;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  // Get Trip Vehicle AutoFill Responce
  Future<List<TripVehicleAutoFillModel>> getTripVehicleAutoFillResponce(
      int serviceId, String vehicleNo) async {
    var response = await _client.get(
        '$_endpoint/Trip/Create/GetVehicleAutoFill/$serviceId/$vehicleNo',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result =
          TripVehicleAutoFillListModel.fromJson(json.decode(response.body))
              .vehicles;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  // Get Trip All Vehicle List Responce
  Future<List<TripVehicleAutoFillModel>> getTripAllVehicleListResponce(
      int serviceId) async {
    var response = await _client
        .get('$_endpoint/Trip/Create/GetAllVehicleList/$serviceId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          TripVehicleAutoFillListModel.fromJson(json.decode(response.body))
              .vehicles;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip Vehicle DetailsResponce
  Future<List<TripVehicleDetailsModel>> getTripVehicleDetailsResponce(
      int fromBranchId, int serviceId, String vehicleNo) async {
    var response = await _client.get(
        '$_endpoint/Trip/Create/GetVehicleDetails/$fromBranchId/$serviceId/$vehicleNo',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result =
          TripVehicleDetailsListModel.fromJson(json.decode(response.body))
              .vehicledetails;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Driver Availibity Responce
  Future<bool> getTripDriverAvailibityResponce(int driverId) async {
    var response = await _client.get(
        '$_endpoint/Trip/Create/CheckIfDriverUsedInTrip/$driverId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      return response.body != "true";
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Driver RateCard Responce
  Future<List<TripDriverRateCardModel>> getTripDriverRateCardResponce(
      TripResourceRateCardRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/Trip/Create/GetResourceRateCard',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return TripDriverRateCardListModel.fromJson(json.decode(response.body))
          .driverratecards;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Trip Save Responce
  Future<int> getTripSaveResponce(TripSaveRequestModel model) async {
    print(
      json.encode(model.toJson()),
    );
    var response = await _client.post(
      '$_endpoint/Trip/Create/SaveTrip',
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

  // Get User Branches Responce
  Future<List<BranchModel>> getUserBranchesResponce() async {
    var response =
        await _client.get('$_endpoint/Branch/GetUserBranches', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          BranchModelList.fromJson(json.decode(response.body)).branchList;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Un Planed Loading Tally Responce
  Future<LoadingTallyModel> getGetUnPlanedLoadingTallyResponce(
      int tripId, int tripRouteId) async {
    var response = await _client.get(
        '$_endpoint/Trip/GetUnPlanedLoadingTally/$tripId/$tripRouteId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });
    if (response.statusCode == 200) {
      var result = LoadingTallyModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get  Can Depart Trip Responce
  Future<int> getCanDepartTripResponce(int tripId) async {
    var response = await _client
        .get('$_endpoint/Trip/Update/CanDepartTrip/$tripId', headers: {
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

  /// Depart Trip  Responce
  Future<bool> getDepartTripResponce(DepartTripModel model) async {
    print(
      json.encode(model.toJson()),
    );
    var response = await _client.post(
      '$_endpoint/Trip/Update/DepartTrip',
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

  /// Arrive Trip  Responce
  Future<bool> getArriveTripResponce(ArriveTrip model) async {
    print(
      json.encode(model.toJson()),
    );
    var response = await _client.post(
      '$_endpoint/Trip/Update/ArriveTrip',
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

  /// Trip Details List (Branch Active Trip List)  Responce
  Future<List<TripDetailsModel>> getTripListResponce(int setid) async {
    var response =
        await _client.get('$_endpoint/Trip/Get/GetTrips/$setid', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });
    if (response.statusCode == 200) {
      var result = TripDetailsListModel.fromJson(json.decode(response.body))
          .tripdetailsList;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }
}
