import 'dart:io';

import 'package:http/http.dart';

import '../../const/const_keys.dart';
import '../../const/const_tag.dart';
import '../../helpers/helper_api.dart';
import '../../helpers/helper_log.dart';
import '../storage/my_data_storage.dart';

class ApiService {
  ApiService._internal();
  static final singleton = ApiService._internal();

  final iOClient = Client();

  ApiService();
  String get token => MyDataStorage.singleton.token ?? '';

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
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
      final Map<String, String> headers = {};

// Kiểm tra và thêm token vào headers
      if (addToken) {
        headers['Authorization'] = 'Bearer $token';
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

  Future<bool> uploadPost(String url, String content, String privacyType,
      {File? image1, File? image2, File? image3}) async {
    final request = MultipartRequest('POST', HelperApi.buildUri(url));

    request.headers['Authorization'] = 'Bearer $token';
    // Thêm các trường văn bản vào request
    request.fields['content'] = content;
    request.fields['privacy_type'] = privacyType;

    // Thêm các tệp hình ảnh vào request nếu không null
    if (image1 != null) {
      request.files.add(await MultipartFile.fromPath('image1', image1.path));
    }
    if (image2 != null) {
      request.files.add(await MultipartFile.fromPath('image2', image2.path));
    }
    if (image3 != null) {
      request.files.add(await MultipartFile.fromPath('image3', image3.path));
    }

    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Upload successful

      HelperLog.logInfo('Upload successful');

      return true;
    } else {
      // Handle error

      HelperLog.logInfo('Upload failed with status: ${response.statusCode}');

      return false;
    }
  }
}
