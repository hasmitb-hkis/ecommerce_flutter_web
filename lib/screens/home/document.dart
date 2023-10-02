/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:typed_data';
import 'package:ecommerce_web_flutter/utils/svg_path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString(SvgPath.guarantee);
  final swirls = await rootBundle.loadString(SvgPath.guarantee);

  final netImage = await networkImage('https://www.nfet.net/nfet.jpg');
  doc.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 0,
          marginLeft: 0,
          marginRight: 0,
          marginTop: 0,
        ),
        orientation: pw.PageOrientation.portrait,
        buildBackground: (context) =>
            pw.SvgImage(svg: shape, fit: pw.BoxFit.fill),
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(
            left: 60,
            right: 60,
            bottom: 30,
          ),
          child: pw.Column(
            children: [
              pw.Spacer(),
              pw.RichText(
                  text: pw.TextSpan(children: [
                pw.TextSpan(
                  text: '${DateTime.now().year}\n',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.grey600,
                    fontSize: 40,
                  ),
                ),
                pw.TextSpan(
                  text: 'Portable Document Format',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ])),
              pw.Spacer(),
              pw.Container(
                  alignment: pw.Alignment.topRight,
                  height: 150,
                  child: pw.Image(netImage)),
              pw.Spacer(flex: 2),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.UrlLink(
                  destination: 'https://wikipedia.org/wiki/PDF',
                  child: pw.Text(
                    'https://wikipedia.org/wiki/PDF',
                    style: const pw.TextStyle(
                      color: PdfColors.pink100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  doc.addPage(
    pw.Page(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Column(
          children: [
            pw.Center(
              child: pw.Text('Table of content',
                  style: pw.Theme.of(context).header0),
            ),
            pw.SizedBox(height: 20),
            pw.TableOfContent(),
            pw.Spacer(),
            pw.Center(
                child: pw.SvgImage(
                    svg: swirls, width: 100, colorFilter: PdfColors.grey)),
            pw.Spacer(),
          ],
        );
      },
    ),
  );

  doc.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(
                level: 0,
                title: 'Portable Document Format',
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Portable Document Format', textScaleFactor: 2),
                      pw.PdfLogo()
                    ])),
            pw.Paragraph(
                text:
                    'In later PDF revisions, a PDF document can also support links (inside document or web page), forms, JavaScript (initially available as plugin for Acrobat 3.0), or any other types of embedded contents that can be handled using plug-ins.'),
            pw.Paragraph(
                text:
                    'PDF 1.6 supports interactive 3D documents embedded in the PDF - 3D drawings can be embedded using U3D or PRC and various other data formats.'),
            pw.Paragraph(
                text:
                    'Two PDF files that look similar on a computer screen may be of very different sizes. For example, a high resolution raster image takes more space than a low resolution one. Typically higher resolution is needed for printing documents than for displaying them on screen. Other things that may increase the size of a file is embedding full fonts, especially for Asiatic scripts, and storing text as graphics. '),
            pw.Header(
                level: 1, text: 'File formats and Adobe Acrobat versions'),
            pw.Paragraph(
                text:
                    'The PDF file format has changed several times, and continues to evolve, along with the release of new versions of Adobe Acrobat. There have been nine versions of PDF and the corresponding version of the software:'),
            pw.TableHelper.fromTextArray(
              border: pw.TableBorder.symmetric(inside: pw.BorderSide.none),
              headerDecoration:
                  pw.BoxDecoration(color: PdfColor.fromHex("#006597")),
              headerStyle: pw.TextStyle(color: PdfColor.fromHex("#FFFFFF")),
              context: context,
              data: const <List<String>>[
                <String>['Date', 'PDF Version', 'Acrobat Version'],
                <String>['1993', 'PDF 1.0', 'Acrobat 1'],
                <String>['1994', 'PDF 1.1', 'Acrobat 2'],
                <String>['1996', 'PDF 1.2', 'Acrobat 3'],
                <String>['1999', 'PDF 1.3', 'Acrobat 4'],
                <String>['2001', 'PDF 1.4', 'Acrobat 5'],
                <String>['2003', 'PDF 1.5', 'Acrobat 6'],
                <String>['2005', 'PDF 1.6', 'Acrobat 7'],
                <String>['2006', 'PDF 1.7', 'Acrobat 8'],
                <String>['2008', 'PDF 1.7', 'Acrobat 9'],
                <String>['2009', 'PDF 1.7', 'Acrobat 9.1'],
                <String>['2010', 'PDF 1.7', 'Acrobat X'],
                <String>['2012', 'PDF 1.7', 'Acrobat XI'],
                <String>['2017', 'PDF 2.0', 'Acrobat DC'],
              ],
            ),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Paragraph(
                text:
                    'Text is available under the Creative Commons Attribution Share Alike License.')
          ]));

  return await doc.save();
}
