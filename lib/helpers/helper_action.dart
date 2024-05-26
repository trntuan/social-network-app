// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'helper_log.dart';

class HelperAction {
  static Future<void> scrollToTop({
    required ScrollController controller,
    bool isAnimate = false,
  }) async {
    try {
      if (!controller.hasClients) {
        return;
      }
      controller.jumpTo(0);
    } catch (errors, stackTrace) {
      HelperLog.logCatchErrors(
        message: 'scrollToTop',
        errors: errors,
        stackTrace: stackTrace,
      );
    }
  }

  static String getImage(String? image) {
    return 'http://103.82.195.138:9000/social/${image ?? ''}';
  }

  static List<String> getImages(List<String?> images) {
    return images
        .map((image) => 'http://103.82.195.138:9000/social/${image ?? ''}')
        .toList();
  }

  static String avatarDefault(String? image) {
    return 'http://103.82.195.138:9000/social/${image ?? 'avatar_default.jpg'}';
  }
}
