import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'app_colors.dart';
import 'constants.dart';

class MyFontStyle {
  static const double _defaultFontSize = 15;

  static TextStyle bold(
      {double fontsize = _defaultFontSize,
      Color color = AppColors.primaryTextColor,
      bool enabledUnderline = false,
      bool enabledLineThrough = false,
      double letterSpacing = 0.0,
      String font = Constants.montserrat,
      List<ui.Shadow>? shadows}) {
    return TextStyle(
      shadows: shadows,
      color: color,
      fontFamily: Constants.montserrat,
      fontSize: fontsize,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.combine([
        enabledUnderline ? TextDecoration.underline : TextDecoration.none,
        enabledLineThrough ? TextDecoration.lineThrough : TextDecoration.none
      ]),
      letterSpacing: letterSpacing,
    );
  }

  // static TextStyle regular(
  //     {double fontsize = _defaultFontSize,
  //     Color color = AppColors.primaryTextColor,
  //     bool enabledUnderline = false,
  //     bool enabledLineThrough = false,
  //     List<ui.Shadow>? shadows}) {
  //   return TextStyle(
  //     shadows: shadows,
  //     fontFamily: Constants.montserrat,
  //     color: color,
  //     fontSize: fontsize,
  //     fontWeight: FontWeight.w300,
  //     decoration: TextDecoration.combine([
  //       enabledUnderline ? TextDecoration.underline : TextDecoration.none,
  //       enabledLineThrough ? TextDecoration.lineThrough : TextDecoration.none
  //     ]),
  //   );
  // }

  static TextStyle semiBold(
      {double fontsize = _defaultFontSize,
      Color color = AppColors.primaryTextColor,
      bool enabledUnderline = false,
      bool enabledLineThrough = false,
      List<ui.Shadow>? shadows}) {
    return TextStyle(
      shadows: shadows,
      fontFamily: Constants.montserrat,
      color: color,
      fontSize: fontsize,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.combine([
        enabledUnderline ? TextDecoration.underline : TextDecoration.none,
        enabledLineThrough ? TextDecoration.lineThrough : TextDecoration.none
      ]),
    );
  }
}
