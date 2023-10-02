import 'package:ecommerce_web_flutter/screens/menu_model.dart';
import 'package:ecommerce_web_flutter/screens/shop/shop_page.dart';
import 'package:ecommerce_web_flutter/utils/svg_path.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'footer.dart';
import 'header.dart';
import 'home/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<MenuModel> menu = [
    MenuModel(0, "Home", true),
    MenuModel(1, "Shop", false),
    MenuModel(2, "About", false),
    MenuModel(3, "Contact", false),
  ];
  List<String> icons = [
    SvgPath.person,
    SvgPath.search,
    SvgPath.heart,
    SvgPath.cart
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              menu: menu,
              icons: icons,
              selectedIndex: (index) {
                selectedIndex = index;
                for (var element in menu) {
                  element.isSelected = (element.index == index);
                }
                setState(() {});
              },
            ),
            body(index: selectedIndex),
            Container(
              color: AppColors.darkGray.withOpacity(0.3),
              width: MediaQuery.sizeOf(context).width,
              height: 1,
            ),
            Footer(menu: menu),
          ],
        ),
      ),
    );
  }
}

body({required int index}) {
  switch (index) {
    case 0:
      return const HomePage();
    case 1:
      return const ShopPage();
    default:
      return const HomePage();
  }
}
