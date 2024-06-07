// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:http/http.dart';

import '../const/const_app.dart';
import '../const/const_tag.dart';

class HelperLog {
  static String reset = '\x1B[0m';
  static String black = '\x1B[30m';
  static String white = '\x1B[37m';
  static String red = '\x1B[31m';
  static String green = '\x1B[32m';
  static String yellow = '\x1B[33m';
  static String blue = '\x1B[34m';
  static String cyan = '\x1B[36m';
  static String magenta = '\x1B[35m';
  static String pink = '\x1B[95m';

  static String logCatchErrors({
    String message = '',
    errors,
    stackTrace,
    String tag = ConstTag.catchErrors,
    bool isSendSocket = true,
  }) {
    final logString = ':: $tag wrong with $message :: '
        '\nERROR :: $errors'
        '\nStackTrace :: $stackTrace';

    if (ConstApp.isShowLog) {
      print(
          '$red $tag\n$red Catch Errors ::: $message\n$red Errors:::  ${errors}\nstackTrace: $stackTrace ,');
    }

    return logString;
  }

  // log using in test cant delete
  static void logInfo(
    String message, {
    String tag = ConstTag.info,
  }) {
    if (ConstApp.isShowLog) {
      log(
        '$green $tag\n$green logInfo ::: $message $reset',
      );
    }
  }

  static void logSocket(
    String message, {
    String tag = ConstTag.info,
  }) {
    if (ConstApp.isShowLog) {
      log(
        '$pink $tag\n$pink logInfo ::: $message $reset',
      );
    }
  }

  // log using in test cant delete
  static void showLTest(
    String message, [
    String tag = ConstTag.test,
  ]) {
    if (ConstApp.isShowLog) {
      log(
        '$yellow $tag\n $yellow showLTest ::: $message $reset',
      );
    }
  }

  static void logApiCall({
    required String apiUri,
    required String apiPath,
    required Map<String, String> header,
    Map<String, dynamic>? dataMap,
    String tag = ConstTag.apiCall,
    bool isShowLog = false,
  }) {
    if (ConstApp.isShowLog) {
      log(
        '${isShowLog ? yellow : white} $tag \n${isShowLog ? yellow : white}Api Uri ::: $apiUri\n${isShowLog ? yellow : white} Params : $apiPath ::: $dataMap\n$white Header : $apiPath ::: $header $reset',
      );
    }
  }

  static void logApiBody({
    required String apiPath,
    required Response response,
    String tag = ConstTag.apiCall,
    bool isShowLog = false,
  }) {
    if (ConstApp.isShowLog) {
      log(
        '${isShowLog ? yellow : white} $tag \n${isShowLog ? yellow : white} Api Path ::: $apiPath\n ${isShowLog ? yellow : white} Response: ${response.body}  $reset',
      );
    }
  }
}
