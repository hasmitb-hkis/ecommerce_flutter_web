import 'dart:io';

import 'package:ecommerce_web_flutter/utils/svg_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'home/document.dart';

class ViewPdf extends StatefulWidget {
  const ViewPdf({super.key});

  @override
  State<ViewPdf> createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  // final actions = <PdfPreviewAction>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PdfPreview(
              useActions: false,
              maxPageWidth: 700,
              build: (format) => generateDocument(format),
              onPrinted: _showPrintedToast,
              onShared: _showSharedToast,
            ),
          ),
          InkWell(
            child: SvgPicture.asset(SvgPath.cart),
            onTap: () async {
              await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async =>
                      generateDocument(format));
            },
          ),
        ],
      ),
    );
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }
}
