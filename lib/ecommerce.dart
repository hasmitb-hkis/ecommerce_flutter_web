import 'package:ecommerce_web_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'navigation/routes.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      initialRoute: Routes.landingPage,
    );
  }
}
