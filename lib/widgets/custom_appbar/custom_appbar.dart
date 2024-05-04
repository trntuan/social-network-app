import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/helper_check.dart';
import '../../theme/theme_text.dart';
import 'button_appbar.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({
    super.forceMaterialTransparency,
    super.shadowColor,
    super.key,
    super.centerTitle = true,
    double? elevation,
    IconAppbar? iconRight,
    IconAppbar? iconLeft,
    TextStyle? titleTextStyle,
    Color? backgroundColor,
    String? title,
    double? toolbarHeight,
    EdgeInsets? paddingRight,
    EdgeInsets? paddingLeft,
    Function()? onTapAction,
    Function()? onTapLeading,
  }) : super(
          elevation: elevation ?? 3.sp,
          leadingWidth: toolbarHeight ?? 550.sp,
          backgroundColor: backgroundColor ?? Colors.white,
          toolbarHeight: 131.sp,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!HelperCheck.empty(iconLeft))
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: buttonAppbar(
                    icon: iconLeft!,
                    onTap: onTapLeading,
                  ),
                ),
              if (!HelperCheck.empty(title))
                Flexible(
                  child: Padding(
                    padding: paddingLeft ?? EdgeInsets.zero,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      '$title',
                      textAlign: TextAlign.right,
                      style: titleTextStyle ?? ThemeText.size50Blue,
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            if (!HelperCheck.empty(iconRight))
              Padding(
                padding: paddingRight ?? EdgeInsets.only(right: 20.sp),
                child: buttonAppbar(
                  icon: iconRight ?? IconAppbar.back,
                  onTap: onTapAction,
                ),
              ),
          ],
        );
}
