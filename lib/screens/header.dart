import 'package:ecommerce_web_flutter/screens/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import '../utils/image_path.dart';
import '../utils/my_font_style.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.menu,
    required this.icons,
    required this.selectedIndex,
  });

  final List<MenuModel> menu;
  final List<String> icons;
  final Function(dynamic index) selectedIndex;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  ImagePath.logo,
                  height: 50,
                  width: 50,
                ),
                Text(
                  Constants.appName,
                  style: MyFontStyle.bold(fontsize: 25),
                )
              ],
            ),
          ),
          Row(
            children: List.generate(
                widget.menu.length,
                (index) => GestureDetector(
                      onTap: () {
                        widget.selectedIndex.call(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            color: widget.menu[index].isSelected
                                ? AppColors.primaryColor
                                : null,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.menu[index].title,
                          style: MyFontStyle.semiBold(
                              color: widget.menu[index].isSelected
                                  ? AppColors.white
                                  : AppColors.primaryTextColor),
                        ),
                      ),
                    )),
          ),
          Row(
            children: widget.icons
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SvgPicture.asset(
                        e,
                        height: 15,
                        width: 15,
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
