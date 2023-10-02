import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/image_path.dart';
import 'browse_product.dart';
import 'content.dart';
import 'explore_more.dart';
import 'our_products.dart';
import 'our_products_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> sliderList = [
    ImagePath.slider1,
    ImagePath.slider2,
    ImagePath.slider1,
    ImagePath.slider2,
    ImagePath.slider1,
    ImagePath.slider2
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Content(),
        40.height,
        const BrowseProduct(),
        OurProducts(ourProductsListData: ourProductsList),
        40.height,
        ExploreMore(sliderList: sliderList),
        40.height,
      ],
    );
  }
}
