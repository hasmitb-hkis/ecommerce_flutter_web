import 'dart:async';
import 'dart:typed_data';
import 'package:ecommerce_web_flutter/screens/home/resume.dart';
import 'package:pdf/pdf.dart';

const examples = <Example>[
  Example('RÉSUMÉ', 'resume.dart', generateResume),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}
