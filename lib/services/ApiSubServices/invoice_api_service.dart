import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class InvoiceAPIService {
  final String _endpoint;
  final String _token;
  final http.Client _client;

  InvoiceAPIService(this._endpoint, this._token, this._client);

  /// Invoice PDF Download
  Future<String> loadPDF(int invoiceId) async {
    var response =
        await _client.get('$_endpoint/Download/Invoice/$invoiceId', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: _token
    });
    if (response.statusCode == 200) {
      var dir = await getApplicationDocumentsDirectory();
      var file = new File("${dir.path}/data.pdf");

      file.writeAsBytesSync(response.bodyBytes, flush: false);

      return file.path;
    } else {
      throw new Exception(response.body);
    }
  }
}
