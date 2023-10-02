import 'package:ecommerce_web_flutter/utils/image_path.dart';

class BrowseModel {
  final String image;
  final String name;

  BrowseModel(this.image, this.name);
}

List<BrowseModel> browseList = [
  BrowseModel(ImagePath.browse1, "Dining"),
  BrowseModel(ImagePath.browse2, "Living"),
  BrowseModel(ImagePath.browse3, "Bedroom")
];
