import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/helper_check.dart';
import '../../services/navigator/config_navigator.dart';

class CustomTextForm extends TextFormField {
  CustomTextForm({
    super.obscureText,
    super.onChanged,
    super.maxLength,
    super.key,
    super.style,
    super.textInputAction,
    super.minLines,
    super.maxLines,
    super.controller,
    super.cursorColor = Colors.black,
    EdgeInsets? contentPadding,
    String? hintText,
    Color? formColor,
    int? hintMaxLines,
    BuildContext? buildContext,
    String? Function(String?)? validator,
    bool isHideAllBorder = false,
    double borderRadius = 6,
    Function(PointerDownEvent)? onTapOutside,
  }) : super(
          validator: validator ??
              (String? validator) {
                HelperChecker.empty(validator?.trim())
                    ? 'chưa nhập thông tin'
                    : null;
                return null;
              },
          onTapOutside: onTapOutside ??
              (event) {
                final context =
                    buildContext ?? ConfigNavigator.navigatorKey.currentContext;
                HelperChecker.empty(context)
                    ? null
                    : FocusScope.of(context!).unfocus();
              },
          decoration: InputDecoration(
            filled: formColor != null ? true : false,
            fillColor: formColor,
            counterText: '',
            hintText: hintText,
            // hintStyle: hintStyle ?? ThemeTextStyle.size44Grey9bW3,
            hintMaxLines: hintMaxLines,
            contentPadding: contentPadding ?? EdgeInsets.all(30.sp),
            focusedBorder: customInputBorder(
              isHideAllBorder,
              Colors.black,
              borderRadius,
              width: 4.sp,
            ),
            enabledBorder: customInputBorder(
              isHideAllBorder,
              Colors.grey,
              borderRadius,
            ),
            errorBorder: customInputBorder(
              isHideAllBorder,
              Colors.red,
              borderRadius,
            ),
            focusedErrorBorder: customInputBorder(
              isHideAllBorder,
              Colors.red,
              borderRadius,
            ),
          ),
        );
}

InputBorder customInputBorder(
  bool hideBorder,
  Color colorBoder,
  double borderRadius, {
  double? width,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: hideBorder
          ? BorderSide.none
          : BorderSide(
              color: colorBoder,
              width: width ?? 2.sp,
              style: BorderStyle.solid,
            ),
    );
