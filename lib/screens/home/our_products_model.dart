import '../../utils/image_path.dart';

class OurProductsModel {
  final String name;
  final String description;
  final String price;
  final String orignalPrice;
  final String image;
  final double? discount;
  final bool isNew;
  bool isHover;
  OurProductsModel(this.isNew, this.name, this.description, this.price,
      this.orignalPrice, this.discount, this.image, this.isHover);
}

List<OurProductsModel> ourProductsList = [
  OurProductsModel(false, "Syltherine", "Stylish cafe chair", "Rp 2.500.000",
      "Rp 3.500.000", 30, ImagePath.product1, false),
  OurProductsModel(false, "Leviosa", "Stylish cafe chair", "Rp 2.500.000", "",
      null, ImagePath.product2, false),
  OurProductsModel(false, "Lolito", "Stylish cafe chair", "Rp 7.000.000",
      "Rp 14.000.000", 50, ImagePath.product3, false),
  OurProductsModel(true, "Respira ", "Stylish cafe chair", "Rp 500.000", "",
      null, ImagePath.product4, false),
  OurProductsModel(false, "Grifo", "Night lamp", "Rp 1.500.000", "", null,
      ImagePath.product5, false),
  OurProductsModel(true, "Muggo", "Small mug", "Rp 150.000", "", null,
      ImagePath.product6, false),
  OurProductsModel(false, "Pingky", "Cute bed set", "Rp 7.000.000",
      "Rp 14.000.000", 50, ImagePath.product7, false),
  OurProductsModel(true, "Potty", "Minimalist flower pot", "Rp 500.000", "",
      null, ImagePath.product8, false)
];
