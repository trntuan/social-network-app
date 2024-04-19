import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../theme/theme_text.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({
    super.forceMaterialTransparency,
    super.shadowColor,
    super.key,
    super.bottom,
    super.centerTitle = true,
    double? elevation,
    double? paddingLeft,
    Color? backgroundColor,
    double? toolbarHeight,
    Function()? onTapAction,
  }) : super(
          elevation: elevation ?? 3.sp,
          // surfaceTintColor: ThemeColors.greyCf,
          leadingWidth: toolbarHeight ?? 550.sp,
          backgroundColor: backgroundColor ?? Colors.white,
          toolbarHeight: 131.sp,
          leading: Padding(
            padding: EdgeInsets.only(left: paddingLeft ?? 55.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'NTU social network',
                      style: ThemeText.size70CyanAccent,
                    )
                  ],
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: onTapAction,
                  child: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.sp),
                  child: GestureDetector(
                    onTap: onTapAction,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14159265359),
                      child: Icon(
                        MdiIcons.chatProcessingOutline,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
}

mixin math {}
