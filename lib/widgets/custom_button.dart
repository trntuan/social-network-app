import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme_color.dart';
import '../theme/theme_text.dart';

Widget buttonInkwell({
  required VoidCallback onPressed,
  required String title,
  EdgeInsets? paddingImage,
  EdgeInsets? paddingBtn,
  EdgeInsets? marginBtn,
  ImageProvider? imageLeft,
  double? width,
  double? height,
  double? widthImage,
  double? heightImage,
  TextStyle? styleText,
  Color? backgrountColor,
  double? radius,
}) {
  return Material(
    borderRadius: BorderRadius.circular(radius ?? 79.sp), // Bo 4 góc
    color: backgrountColor ?? ThemeColors.blue, // Màu cam
    child: InkWell(
      onTap: onPressed,
      splashColor: Colors.white.withOpacity(0.5), // Màu loang mực
      borderRadius: BorderRadius.circular(79.sp), // Bo 4 góc cho loang mực
      child: Container(
        padding: paddingBtn ?? EdgeInsets.zero,
        margin: marginBtn ??
            EdgeInsets.symmetric(
              horizontal: 58.sp,
            ),
        width: width ?? 963.sp,
        height: height ?? 158.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Left
            if (imageLeft != null)
              Flexible(
                child: Padding(
                  padding: paddingBtn ??
                      EdgeInsets.only(
                        right: 14.sp,
                      ),
                  child: Image(
                    width: widthImage ?? 62.sp,
                    height: heightImage ?? 62.sp,
                    image: imageLeft,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

            // Title
            if (title.isNotEmpty)
              Flexible(
                child: Text(
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  title,
                  style: styleText ?? ThemeText.size48WhiteBold,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
