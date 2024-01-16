import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadCV extends StatefulWidget {
  var data;
  ReadCV({Key? key, required this.data}) : super(key: key);

  @override
  State<ReadCV> createState() => _ReadCVState();
}

class _ReadCVState extends State<ReadCV> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CV'),
      ),
      body: SfPdfViewer.network(widget.data),
    );
  }
}
