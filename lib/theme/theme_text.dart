import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_color.dart';

class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    super.fontWeight = FontWeight.normal,
    super.fontSize,
    super.color,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.fontFamilyFallback,
  });

  factory CustomTextStyle.bold({
    FontWeight? fontWeight = FontWeight.bold,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) =>
      CustomTextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: decoration,
      );
}

class ThemeText {
  static final size63Red5d = CustomTextStyle(
    color: ThemeColors.red5d,
    fontSize: 63.sp,
  );

  static final size40Black = CustomTextStyle(
    color: Colors.black,
    fontSize: 48.sp,
  );

  static final size40BlackBold = CustomTextStyle.bold(
    color: Colors.black,
    fontSize: 48.sp,
  );

  static final size48WhiteBold = CustomTextStyle.bold(
    color: Colors.white,
    fontSize: 48.sp,
  );

  static final size70CyanAccent = CustomTextStyle.bold(
    color: ThemeColors.skyBlue,
    fontSize: 50.sp,
  );

  static final size80BlackBold = CustomTextStyle.bold(
    color: Colors.black,
    fontSize: 80.sp,
  );
}
