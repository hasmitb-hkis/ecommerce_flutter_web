import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:ecommerce_web_flutter/utils/my_font_style.dart';
import 'package:ecommerce_web_flutter/utils/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/image_path.dart';
import '../../widgets/theme_button.dart';
import '../home/our_products_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * 0.45,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.shopBg), fit: BoxFit.fill)),
          child: Text(
            "Shop",
            style: MyFontStyle.bold(fontsize: 35),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height * 0.08),
          height: MediaQuery.sizeOf(context).height * 0.1,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(color: AppColors.cream),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    SvgPath.filter,
                  ),
                  12.width,
                  Text(
                    "Filter",
                    style: MyFontStyle.semiBold(fontsize: 17),
                  ),
                  30.width,
                  SvgPicture.asset(
                    SvgPath.grid,
                  ),
                  15.width,
                  SvgPicture.asset(
                    SvgPath.list,
                  ),
                  30.width,
                  Container(
                    color: AppColors.black,
                    width: 1,
                    height: MediaQuery.sizeOf(context).height * 0.04,
                  ),
                  30.width,
                  Text(
                    "Showing 1-16 of 32 results",
                    style: MyFontStyle.semiBold(fontsize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Show",
                    style: MyFontStyle.semiBold(fontsize: 15),
                  ),
                  13.width,
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(color: AppColors.white),
                    child: Text(
                      "10",
                      style: MyFontStyle.semiBold(
                          fontsize: 13, color: AppColors.darkGray),
                    ),
                  ),
                  30.width,
                  Text(
                    "Sort By",
                    style: MyFontStyle.semiBold(fontsize: 15),
                  ),
                  13.width,
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(color: AppColors.white),
                    child: Text(
                      "Default",
                      style: MyFontStyle.semiBold(
                          fontsize: 13, color: AppColors.darkGray),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: ourProductsList.length,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.04,
              vertical: 50),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.75),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            onHover: (isHover) {
              setState(() {
                ourProductsList[index].isHover = isHover;
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
                      ourProductsList[index].image,
                      fit: BoxFit.fill,
                    ),
                    if (ourProductsList[index].isNew)
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
                    if (ourProductsList[index].discount != null)
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
                    if (ourProductsList[index].isHover)
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "1",
                style: MyFontStyle.bold(color: AppColors.white),
              ),
            ),
            20.width,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "2",
                style: MyFontStyle.bold(color: AppColors.white),
              ),
            ),
            20.width,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "3",
                style: MyFontStyle.bold(color: AppColors.white),
              ),
            ),
            20.width,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Next",
                style: MyFontStyle.bold(color: AppColors.white),
              ),
            )
          ],
        ),
        50.height,
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.04),
          height: MediaQuery.sizeOf(context).height * 0.2,
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.cream.withOpacity(0.7),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const IconWithText(
              title: "High Quality",
              description: "crafted from top materials",
              svgPath: SvgPath.trophy,
            ),
            const IconWithText(
              title: "Warranty Protection",
              description: "Over 2 years",
              svgPath: SvgPath.guarantee,
            ),
            const IconWithText(
              title: "Free Shipping",
              description: "Order over 150 \$",
              svgPath: SvgPath.shipping,
            ),
            const IconWithText(
              title: "24 / 7 Support",
              description: "Dedicated support",
              svgPath: SvgPath.customerSupport,
            )
          ]),
        )
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  final String title;
  final String description;
  final String svgPath;
  const IconWithText({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svgPath),
        5.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: MyFontStyle.bold(fontsize: 20),
            ),
            3.height,
            Text(
              description,
              style:
                  MyFontStyle.semiBold(color: AppColors.darkGray, fontsize: 16),
            )
          ],
        )
      ],
    );
  }
}
