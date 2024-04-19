import 'package:http/http.dart';

import '../../const/const_keys.dart';
import '../../const/const_tag.dart';
import '../../helpers/helper_api.dart';
import '../../helpers/helper_log.dart';

class ApiService {
  ApiService._internal();
  static final singleton = ApiService._internal();

  final iOClient = Client();

  ApiService();
  String get token => '';

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
      };

  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParams,
    bool? decoMap,
    bool addToken = true,
    bool isShowTest = false,
  }) async {
    try {
      // if (await HelperApi.deviceIdNotEmpty(path)) {
      if (addToken) {
        // check if queryParams is null then create new map
        if (queryParams == null) {
          queryParams = {ConstKeys.token: token};
        } else {
          /// add token to queryParams
          queryParams[ConstKeys.token] = token;
        }
      }

      final apiUri = HelperApi.buildUri(path, queryParams);

      HelperLog.logApiCall(
        apiUri: '${apiUri}',
        apiPath: path,
        header: headers,
        dataMap: queryParams,
        isShowLog: isShowTest,
      );
      final response = await iOClient.get(
        apiUri,
        headers: headers,
      );

      HelperLog.logApiBody(
        apiPath: path,
        response: response,
        isShowLog: isShowTest,
      );

      return response;
      // }
    } catch (errors, stackTrace) {
      /// log error
      HelperLog.logCatchErrors(
        tag: ConstTag.apiGet,
        message: 'call api',
        errors: errors,
        stackTrace: stackTrace,
      );

      /// check if connection closed recall api
      if (errors
          .toString()
          .contains('Connection closed before full header was received')) {
        // HelperLog.showLTest(
        //   ConstValueDefault.errorConnectionClosed,
        // );
        await Future.delayed(
          const Duration(seconds: 1),
        );

        return get(path, queryParams: queryParams);
      }
    }
    return null;
  }

  Future<Response?> post(String path,
      [Map<String, dynamic>? body, bool addToken = true]) async {
    try {
      // if (await HelperApi.deviceIdNotEmpty(path)) {
      final apiUri = HelperApi.buildUri(path);
      if (addToken) {
        body?[ConstKeys.token] = token;
      }

      /// log call
      HelperLog.logApiCall(
        apiUri: '$apiUri',
        apiPath: path,
        header: headers,
        dataMap: body,
      );

      final response = await iOClient.post(
        apiUri,
        headers: headers,
        body: body,
      );

      HelperLog.logApiBody(apiPath: path, response: response);

      return response;
      // }
    } catch (errors, stackTrace) {
      HelperLog.logCatchErrors(
        tag: ConstTag.apiPost,
        message: 'call api',
        errors: errors,
        stackTrace: stackTrace,
      );

      /// check if connection closed recall api
      if (errors
          .toString()
          .contains('Connection closed before full header was received')) {
        // HelperLog.showLTest(
        //   ConstValueDefault.errorConnectionClosed,
        // );
        await Future.delayed(
          const Duration(seconds: 1),
        );

        return post(path, body);
      }
    }
    return null;
  }
}
