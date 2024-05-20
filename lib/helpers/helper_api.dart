import 'dart:convert';

import 'package:http/http.dart';

import '../const/const_app.dart';
import '../const/const_keys.dart';
import '../const/const_tag.dart';
import '../models/response/response_message.dart';
import 'helper_check.dart';
import 'helper_log.dart';

class HelperApi {
  static Uri buildUri(
    String path, [
    Map<String, dynamic>? params,
  ]) {
    const authority = ConstApp.apiAuthority;
    final apiPath = '${ConstApp.apiPath}$path';

    Uri uri;
    // if (HelperChecker.equal(ConstConfig.appType, Environment.stgvLive)) {
    //   uri = Uri.https(authority, apiPath, params);
    // } else {
    uri = Uri.http(authority, apiPath, params);
    // }

    return uri;
  }

  static Map<String, dynamic>? returnBody(
    Response? response, [
    bool ignoreStatus = false,
  ]) {
    if (response != null) {
      if (response.statusCode == 200 || ignoreStatus) {
        // HelperLog.showLTest('statusCode ${response.statusCode}');
        if (response.body.isNotEmpty) {
          // data body
          final Map<String, dynamic> dataBody;
          // create data with style map
          dataBody = Map<String, dynamic>.from(
            jsonDecode(response.body),
          );
          return dataBody;
        }
      }
      HelperLog.logCatchErrors(
        tag: ConstTag.apiPost,
        message: 'status code ${response.statusCode}',
        errors: response.body,
      );
    }

    /// default return
    return null;
  }

  static ResponseMessage handlePostResponse(
    Response? response,
  ) {
    final ResponseMessage responseMessage = ResponseMessage();
    final int? status = response?.statusCode;

    if (!HelperChecker.empty(status)) {
      // data body
      final Map<String, dynamic> dataBody;
      // create data with style map
      dataBody = Map<String, dynamic>.from(
        jsonDecode(response!.body),
      );
      responseMessage.message = dataBody[ConstKeys.message];
      responseMessage.isSuccess = dataBody[ConstKeys.statusCode] == '200';
      return responseMessage;
    }

    return responseMessage;
  }
}
