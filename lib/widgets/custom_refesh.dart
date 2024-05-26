import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import '../helpers/helper_check.dart';
import 'custom_load.dart';

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
            color: Colors.black,
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
