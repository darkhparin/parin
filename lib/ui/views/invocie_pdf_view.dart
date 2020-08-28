import 'dart:typed_data';

import 'package:cwl/services/api_services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

import 'package:cwl/locator.dart';
import 'package:path_provider/path_provider.dart';

import '../../locator.dart';
import 'guest_view.dart';

class PdfViewerPage extends StatefulWidget {
  final int _invoiceId;

  PdfViewerPage({@required int invoiceId, Key key})
      : _invoiceId = invoiceId,
        super(key: key);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final ApiService _apiService = locator<ApiService>();
  String localPath;
  String filePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _apiService.invoiceAPIService.loadPDF(widget._invoiceId).then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDF Invoice',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => GuestView(),
                )),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.blue[500],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory dir = await getApplicationDocumentsDirectory();
          final ByteData bytes = await rootBundle.load("${dir.path}/data.pdf");
          await Share.file('data pdf', 'Countrywide Logistics Invoice.pdf',
              bytes.buffer.asUint8List(), 'application/pdf',
              text: 'CWL Invoice');
        },
        child: Icon(Icons.share),
        backgroundColor: Colors.green,
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

Widget orderInvoiceConfirmation() {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.share),
              backgroundColor: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.share),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      )
    ],
  );
}
