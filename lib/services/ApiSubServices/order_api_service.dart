import 'dart:convert';
import 'dart:io';

import 'package:cwl/models/application/index.dart';
import 'package:http/http.dart' as http;

class OrderAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  OrderAPIService(this._endpoint, this._token, this._client);

  /// Get DocketNo Responce
  Future<Docketnoresponce> getDocketNoResponce(String docketno) async {
    var response = await _client
        .get('$_endpoint/booking/GetDocketNoDetails/$docketno', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result = Docketnoresponce.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get EwayBill Responce
  Future<Ewaybillresponce> getEwayBillResponce(Ewaybillrequest model) async {
    print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/booking/GetEwayBillDetails',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return Ewaybillresponce.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get EwayBill Raw Responce
  Future<Ewaybillresponce> getEwayBillRawResponce(
      EwayBillRawRequestModel model) async {
    print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/booking/GetEwayBillRawDetails',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return Ewaybillresponce.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

// Get Can Change Branch Responce
  Future<bool> getCanChangeBranchResponce(
      int oldBranchId, int newBrnachId) async {
    try {
      var response = await _client.get(
          '$_endpoint/booking/CanChangeBookingBranch/$oldBranchId/$newBrnachId',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: _token
          });

      if (response.statusCode == 200) {
        return response.body == "true";
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> getIsPartBCreatedResponce(List<num> ewayBills) async {
    var response = await _client.post(
      '$_endpoint/booking/GetIsPartBCreated',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(ewayBills),
    );
    if (response.statusCode == 200) {
      return response.body == "true";
    } else {
      throw new Exception(response.body);
    }
  }

  Future<String> getPartBUpdateResponce(PartBUpdateRequest model) async {
    var response = await _client.post(
      '$_endpoint/CWLServices/UpdatePartB',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<Pincodeshortlist> getConsignorPinicodeResponce(
      String consignorId) async {
    var response = await _client.get(
        '$_endpoint/booking/GetConsignorAddressDetails/$consignorId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result = Pincodeshortlist.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<Pincodeshortlist> getConsigneePinicodeResponce(
      String consigneeId) async {
    var response = await _client.get(
        '$_endpoint/booking/GetConsigneeAddressDetails/$consigneeId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result = Pincodeshortlist.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Commonmodel>> getServiceTypesResponce() async {
    var response =
        await _client.get('$_endpoint/booking/GetServiceTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Commonmodellist.fromJson(json.decode(response.body)).commonlist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Commonmodel>> getPaymentModesResponce() async {
    var response =
        await _client.get('$_endpoint/booking/GetPaymentModes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Commonmodellist.fromJson(json.decode(response.body)).commonlist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Commonmodel>> getTransportAsResponce(int serviceTypeId) async {
    var response = await _client
        .get('$_endpoint/booking/GetTransportAsTypes/$serviceTypeId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Commonmodellist.fromJson(json.decode(response.body)).commonlist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<Liablepartyresponce> getLiablePartyResponce(
      int paymentModeId, int consignorId, int consigneeId) async {
    var response = await _client.get(
        '$_endpoint/booking/GetLiablePartyDetails/$paymentModeId/$consignorId/$consigneeId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      var result = Liablepartyresponce.fromJson(json.decode(response.body));
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Ratecard Responce
  Future<List<Ratecardresponce>> getRateCardResponce(
      Ratecardrequestmodel model) async {
    var response = await _client.post(
      '$_endpoint/booking/GetRateCards',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return Ratecardresponcelist.fromJson(json.decode(response.body))
          .ratecardlist;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get RatecardCharges Responce
  Future<Ratecardcchargesresponce> getRateCardChargesResponce(
      Ratecardchargesrequest model) async {
    var response = await _client.post(
      '$_endpoint/booking/GetRateCardCharges',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return Ratecardcchargesresponce.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Commonmodel>> getProductTypesResponce() async {
    var response =
        await _client.get('$_endpoint/booking/GetProductTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Commonmodellist.fromJson(json.decode(response.body)).commonlist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Commonmodel>> getPackageTypesResponce() async {
    var response =
        await _client.get('$_endpoint/booking/GetPackageTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Commonmodellist.fromJson(json.decode(response.body)).commonlist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  Future<List<Shapemodel>> getShapeTypesResponce() async {
    var response =
        await _client.get('$_endpoint/booking/GetShapeTypes', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      var result =
          Shapemodellist.fromJson(json.decode(response.body)).shapelist;
      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get OrderLine Responce
  Future<Orderlineresponce> getOrderLineResponce(Orderlinerequest model) async {
    var response = await _client.post(
      '$_endpoint/booking/GetOrderLineDetails',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return Orderlineresponce.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Rate Calculation Responce
  Future<Ratecalculationresponce> getRateCalculationResponce(
      Ratecalculationrequest model) async {
    //  print(json.encode(model.toJson()));
    var response = await _client.post(
      '$_endpoint/booking/GetRateCalculations',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );
    if (response.statusCode == 200) {
      var result = Ratecalculationresponce.fromJson(json.decode(response.body));

      return result;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Order Location Responce
  Future<Orderpincodelocationresponce> getOrderLocationResponce(
      num pincode) async {
    var response = await _client
        .get('$_endpoint/booking/GetPincodeLocation/$pincode', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });

    if (response.statusCode == 200) {
      return Orderpincodelocationresponce.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Save Order Responce
  Future<int> getSaveOrderResponce(Ordersaverequest model) async {
    var response = await _client.post(
      '$_endpoint/booking/SaveOrder',
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

  Future<bool> getAccountCopyUploadResponce(
      int orderId, String filePath) async {
    Map<String, String> headers = {"Authorization": _token};

    var uri = Uri.parse('$_endpoint/Upload/AccountCopy');
    var request = http.MultipartRequest('POST', uri)
      ..fields['order_id'] = orderId.toString();
    request.headers.addAll(headers);
    request.files.add(
        //http.MultipartFile.fromBytes('file', accountCopy.readAsBytesSync())
        http.MultipartFile('file', File(filePath).readAsBytes().asStream(),
            File(filePath).lengthSync(),
            filename: filePath.split("/").last));
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return respStr.toLowerCase().contains('done');
    } else {
      throw new Exception('${response.reasonPhrase}: $respStr');
    }
  }

  // Get Delivery Branch Responce
  Future<BranchModel> getDeliveryBranchResponce(String deliveryPincode) async {
    var response = await _client
        .get('$_endpoint/booking/GetDeliveryBranch/$deliveryPincode', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });
    if (response.statusCode == 200) {
      return BranchModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  // Get Consignee List Responce
  Future<List<EwbParty>> getConsigneeListResponce(
      int deliveryBranchId, String gstin) async {
    var response = await _client.get(
        '$_endpoint/booking/GetConsigneeListFromGSTIN/$deliveryBranchId/$gstin',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });
    if (response.statusCode == 200) {
      return EwbPartyList.fromJson(json.decode(response.body)).parties;
    } else {
      throw new Exception(response.body);
    }
  }

  /// Get Order Invoice Confirmation Responce
  Future<OrderInvoiceConfirmationModel> getOrderInvoiceConfirmationResponce(
      int orderId) async {
    var response = await _client.get(
        '$_endpoint/Invoice/GetOrderInvoiceConfirmation/$orderId',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: _token
        });

    if (response.statusCode == 200) {
      return OrderInvoiceConfirmationModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }

  ///get Order Invoice Create Responce Responce
  Future<CwlResultModel> getOrderInvoiceCreateResponce(
      OrderInvocieCreateRequestModel model) async {
    var response = await _client.post(
      '$_endpoint/Invoice/CreateOrderInvoice',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "$_token"
      },
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return CwlResultModel.fromJson(json.decode(response.body));
    } else {
      throw new Exception(response.body);
    }
  }
}
