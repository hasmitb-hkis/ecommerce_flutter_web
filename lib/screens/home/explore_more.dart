import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_font_style.dart';
import '../../utils/svg_path.dart';
import '../../widgets/theme_button.dart';

class ExploreMore extends StatefulWidget {
  final List<String> sliderList;
  const ExploreMore({
    super.key,
    required this.sliderList,
  });

  @override
  State<ExploreMore> createState() => _ExploreMoreState();
}

class _ExploreMoreState extends State<ExploreMore>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int selectedIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    // final pdf = pw.Document();

    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.1, top: 50, bottom: 50),
      decoration: const BoxDecoration(color: AppColors.cream2),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "50+ Beautiful rooms \ninspiration",
                    style: MyFontStyle.bold(fontsize: 30),
                  ),
                  7.height,
                  Text(
                    "Our designer already made a lot of beautiful \nprototipe of rooms that inspire you",
                    style: MyFontStyle.bold(fontsize: 14),
                  ),
                  25.height,
                  ThemeButton(
                      height: 48,
                      width: 176,
                      onClick: () {},
                      radius: 0,
                      text: "Explore More",
                      textStyle: MyFontStyle.semiBold(color: AppColors.white))
                ],
              ),
              40.width,
              Flexible(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  width: MediaQuery.sizeOf(context).width,
                  child: CarouselSlider.builder(
                    carouselController: buttonCarouselController,
                    itemCount: widget.sliderList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        selectedIndex == itemIndex
                            ? ScaleTransition(
                                scale: _scaleAnimation,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      widget.sliderList[itemIndex],
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                      bottom: 24,
                                      left: 24,
                                      right: 24,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ClipRect(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 5, sigmaY: 5),
                                              child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 30),
                                                  color: AppColors.white
                                                      .withOpacity(0.6),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Item Index : $itemIndex",
                                                        style: MyFontStyle
                                                            .semiBold(
                                                                color: AppColors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7)),
                                                      ),
                                                      Text(
                                                        "Inner Peace",
                                                        style: MyFontStyle
                                                            .semiBold(
                                                                fontsize: 28,
                                                                color: AppColors
                                                                    .black),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: const BoxDecoration(
                                                color: AppColors.primaryColor),
                                            child: SvgPicture.asset(
                                                SvgPath.forwardArrow),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : ScaleTransition(
                                scale: _scaleAnimation,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 24,
                                      bottom:
                                          MediaQuery.sizeOf(context).height *
                                              0.1),
                                  child: Image.asset(
                                    widget.sliderList[itemIndex],
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                    options: CarouselOptions(
                        autoPlay: false,
                        pageSnapping: false,
                        enlargeCenterPage: false,
                        viewportFraction: 0.4,
                        initialPage: 0,
                        padEnds: false,
                        autoPlayInterval: const Duration(seconds: 5),
                        enableInfiniteScroll: true,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.02,
              right: MediaQuery.sizeOf(context).width * 0.26,
              child: Row(
                children: List.generate(
                    widget.sliderList.length,
                    (index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: index == selectedIndex
                                  ? Border.all(
                                      color: AppColors.primaryColor, width: 2)
                                  : null,
                              shape: BoxShape.circle),
                          child: Container(
                            height: 7,
                            width: 7,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                          ),
                        )),
              )),
          Positioned(
            right: MediaQuery.sizeOf(context).height * 0.06,
            bottom: MediaQuery.sizeOf(context).height * 0.33,
            child: GestureDetector(
              onTap: () {
                buttonCarouselController.animateToPage(selectedIndex + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              onTapDown: (_) {
                _controller.forward();
              },
              onTapUp: (_) {
                Future.delayed(Duration(milliseconds: 600))
                    .then((value) => _controller.reverse());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(SvgPath.forwardArrow2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
