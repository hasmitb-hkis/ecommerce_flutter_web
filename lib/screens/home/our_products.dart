import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_font_style.dart';
import '../../utils/svg_path.dart';
import '../../widgets/theme_button.dart';
import 'our_products_model.dart';

class OurProducts extends StatefulWidget {
  final List<OurProductsModel> ourProductsListData;
  const OurProducts({
    super.key,
    required this.ourProductsListData,
  });

  @override
  State<OurProducts> createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Our Products",
          style: MyFontStyle.bold(fontsize: 32),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: widget.ourProductsListData.length,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1, vertical: 50),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.80),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            onHover: (isHover) {
              setState(() {
                widget.ourProductsListData[index].isHover = isHover;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.ourProductsListData[index].image,
                      fit: BoxFit.fill,
                    ),
                    if (widget.ourProductsListData[index].isNew)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: AppColors.green, shape: BoxShape.circle),
                          child: Text(
                            "New",
                            style: MyFontStyle.bold(
                                color: AppColors.white, fontsize: 13),
                          ),
                        ),
                      ),
                    if (widget.ourProductsListData[index].discount != null)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: AppColors.red, shape: BoxShape.circle),
                          child: Text(
                            "-${ourProductsList[index].discount}%",
                            style: MyFontStyle.bold(
                                color: AppColors.white, fontsize: 13),
                          ),
                        ),
                      ),
                    if (widget.ourProductsListData[index].isHover)
                      Container(
                        padding: const EdgeInsets.all(25),
                        color: AppColors.black.withOpacity(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ThemeButton(
                              height: 40,
                              width: MediaQuery.sizeOf(context).width,
                              onClick: () {},
                              radius: 0,
                              color: AppColors.white,
                              text: "Add To Cart",
                              textStyle: MyFontStyle.semiBold(
                                  color: AppColors.primaryColor, fontsize: 13),
                            ),
                            24.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(SvgPath.share),
                                  5.width,
                                  Text(
                                    "Share",
                                    style: MyFontStyle.semiBold(
                                        color: AppColors.white, fontsize: 13),
                                  )
                                ]),
                                Row(children: [
                                  SvgPicture.asset(SvgPath.compare),
                                  5.width,
                                  Text(
                                    "Compare",
                                    style: MyFontStyle.semiBold(
                                        color: AppColors.white, fontsize: 13),
                                  )
                                ]),
                                Row(children: [
                                  SvgPicture.asset(SvgPath.like),
                                  5.width,
                                  Text(
                                    "Like",
                                    style: MyFontStyle.semiBold(
                                        color: AppColors.white, fontsize: 13),
                                  )
                                ]),
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                )),
                Container(
                  padding: const EdgeInsets.all(18),
                  color: AppColors.gray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ourProductsList[index].name,
                        style: MyFontStyle.bold(
                            color: AppColors.black, fontsize: 15),
                      ),
                      8.height,
                      Text(
                        ourProductsList[index].description,
                        style: MyFontStyle.semiBold(
                            color: AppColors.darkGray, fontsize: 12),
                      ),
                      8.height,
                      Row(
                        children: [
                          Text(
                            ourProductsList[index].price,
                            style: MyFontStyle.bold(
                                color: AppColors.black, fontsize: 13),
                          ),
                          20.width,
                          Text(
                            ourProductsList[index].orignalPrice,
                            style: MyFontStyle.bold(
                                enabledLineThrough: true,
                                color: AppColors.darkGray.withOpacity(0.7),
                                fontsize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ThemeButton(
          borderColor: AppColors.primaryColor,
          height: 48,
          width: 245,
          radius: 0,
          text: "Show More",
          textStyle: MyFontStyle.semiBold(color: AppColors.primaryColor),
          onClick: () {},
        )
      ],
    );
  }
}
