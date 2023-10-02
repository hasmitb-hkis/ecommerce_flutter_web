import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/constants.dart';
import '../utils/my_font_style.dart';
import 'menu_model.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.menu,
  });

  final List<MenuModel> menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    Constants.appName,
                    style: MyFontStyle.bold(fontsize: 24),
                  ),
                  50.height,
                  Text(
                      "400 University Drive Suite 200 Coral \nGables,\nFL 33134 USA",
                      style: MyFontStyle.semiBold(
                          fontsize: 16, color: AppColors.gray2))
                ],
              ),
              50.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Links",
                    style:
                        MyFontStyle.bold(fontsize: 16, color: AppColors.gray2),
                  ),
                  20.height,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          menu.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  menu[index].title,
                                  style: MyFontStyle.semiBold(fontsize: 16),
                                ),
                              )))
                ],
              ),
              50.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Help",
                    style:
                        MyFontStyle.bold(fontsize: 16, color: AppColors.gray2),
                  ),
                  40.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Options",
                        style: MyFontStyle.semiBold(fontsize: 16),
                      ),
                      40.height,
                      Text(
                        "Returns",
                        style: MyFontStyle.semiBold(fontsize: 16),
                      ),
                      40.height,
                      Text(
                        "Privacy Policies",
                        style: MyFontStyle.semiBold(fontsize: 16),
                      ),
                    ],
                  )
                ],
              ),
              50.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "News Letter",
                    style:
                        MyFontStyle.bold(fontsize: 16, color: AppColors.gray2),
                  ),
                  40.height,
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide.none,
                                  left: BorderSide.none,
                                  right: BorderSide.none,
                                  bottom: BorderSide(
                                      width: 1, color: AppColors.black))),
                          width: 200,
                          child: TextField(
                              cursorColor: AppColors.black,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 15),
                                hintText: "Enter your email address",
                                hintStyle: MyFontStyle.semiBold(
                                    color: AppColors.gray2, fontsize: 13),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ))),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide.none,
                                left: BorderSide.none,
                                right: BorderSide.none,
                                bottom: BorderSide(
                                    width: 1, color: AppColors.black))),
                        child: Text("SUBSCRIBE",
                            style: MyFontStyle.semiBold(fontsize: 13)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          20.height,
          Container(
            color: AppColors.darkGray.withOpacity(0.3),
            width: MediaQuery.sizeOf(context).width,
            height: 1,
          ),
          40.height,
          Text(
            "2023 furino. All rights reverved",
            style: MyFontStyle.semiBold(
                fontsize: 16, color: AppColors.black.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
