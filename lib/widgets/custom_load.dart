import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/helper_check.dart';
import '../theme/theme_color.dart';

Widget refreshList({
  required Widget? child,
  bool isLoading = true,
  bool isLoadingMore = false,
  // bool isShowEmptyList = true,
  // ignore: strict_raw_type
  List? itemList,
  String emptyContent = '',
  Function()? onRefresh,
  Function()? onLoad,
}) =>
    CustomEasyRefresh(
      isLoadingMore: isLoadingMore,
      onRefresh: onRefresh,
      onLoad: onLoad,
      child:
          //  isShowEmptyList &&
          HelperChecker.empty(itemList) && isLoading == false
              ? screenListEmty(
                  content: emptyContent,
                )
              : child,
    );

class CustomEasyRefresh extends EasyRefresh {
  CustomEasyRefresh({
    required super.child,
    super.key,
    super.controller,
    super.onRefresh,
    super.onLoad,
    super.spring,
    super.frictionFactor,
    super.notRefreshHeader,
    super.notLoadFooter,
    super.simultaneously,
    super.canRefreshAfterNoMore,
    super.canLoadAfterNoMore,
    super.resetAfterRefresh,
    super.refreshOnStart,
    super.refreshOnStartHeader,
    super.callRefreshOverOffset,
    super.callLoadOverOffset,
    super.fit,
    super.clipBehavior,
    super.scrollBehaviorBuilder,
    super.scrollController,
    super.triggerAxis,
    bool isLoadingMore = false,
  }) : super(
          header: const MaterialHeader(
            color: ThemeColors.brown51,
          ),
          footer: ClassicFooter(
            messageText: '',
            spacing: 0,
            iconDimension: 40,
            textBuilder: (context, state, text) => const SizedBox(),
            pullIconBuilder: (context, state, animation) {
              return isLoadingMore ? widgetLoadMore() : const SizedBox();
            },
          ),
        );
}

Widget screenListEmty({
  String content = '',
  TextStyle? style,
}) =>
    Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: 1.sh,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.sp,
          ),
          child: Center(
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );

Widget widgetLoadMore() {
  return Container(
    alignment: Alignment.center,
    child: const CircularProgressIndicator(
      color: ThemeColors.brown51,
    ),
  );
}
