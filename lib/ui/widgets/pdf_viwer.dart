import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PDFViwer extends StatefulWidget {
  const PDFViwer({Key key}) : super(key: key);

  @override
  _PDFViwerState createState() => _PDFViwerState();
}

class _PDFViwerState extends State<PDFViwer> {
  PdfController _pdfController;

  @override
  void initState() {
    // _pdfController = PdfController(document: PdfDocument.openData(data));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: renderBody(),
    );
  }

  Widget renderBody() {
    PdfController _pdfController;
  }
}
