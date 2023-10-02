import 'package:ecommerce_web_flutter/screens/landing_page.dart';
import 'package:ecommerce_web_flutter/screens/view_pdf.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String landingPage = "/";
  static const String homePage = "/homePage";
  static const String viewPdf = "/viewPdf";

  static Map<String, Widget Function(BuildContext context)> routes = {
    landingPage: (context) => const LandingPage(),
    viewPdf: (context) => const ViewPdf()
  };
}
