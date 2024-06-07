import 'dart:convert';

import '../../../const/const_keys.dart';
import '../../../const/const_path.dart';
import '../../../helpers/helper_api.dart';
import '../../../helpers/helper_check.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/params/param_login.dart';
import '../../../models/params/param_register.dart';
import '../../../models/posts/my_posts_model.dart';
import '../../../models/response/response_message.dart';
import '../../../models/user/my_info_model.dart';
import '../../storage/my_data_storage.dart';
import '../../storage/security_storage.dart';
import '../api_service.dart';

Future<ResponseMessage> apiPostRegister(ParamRegister registerParam) async {
  final params = registerParam.toJson();

  ResponseMessage responseMessage = ResponseMessage();

  try {
    final response = await ApiService.singleton.post(
      ConstPathPost.register,
      params,
    );

    responseMessage = HelperApi.handlePostResponse(response);

    if (responseMessage.isSuccess) {
      final data = HelperApi.returnBody(response, true);

      MyDataStorage.singleton.fromMap(data?[ConstKeys.user]);

      await StorageService.writeData();
    }

    return responseMessage;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return responseMessage;
}

Future<ResponseMessage> apiPostLogin(ParamLogin loginParam) async {
  final params = loginParam.toJson();

  ResponseMessage responseMessage = ResponseMessage();

  try {
    final response = await ApiService.singleton.post(
      ConstPathPost.login,
      params,
      false,
    );

    responseMessage = HelperApi.handlePostResponse(response);

    if (responseMessage.isSuccess) {
      final data = HelperApi.returnBody(response, true);

      MyDataStorage.singleton.fromMap(data);

      await StorageService.writeData();
    }

    return responseMessage;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return responseMessage;
}

// user/user_detail

Future<MyInfoModel?> apiGetUserDetail(String? userId) async {
  MyInfoModel? userDetail;
  final params = {
    'id': '$userId',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.userDetail,
      queryParams: params,
    );

    final result = HelperApi.returnBody(response);
    if (!HelperChecker.empty(result)) {
      userDetail = MyInfoModel.fromJson(result!);
    }

    return userDetail;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return userDetail;
}

Future<List<MyPostModel?>> apiGetAllUserPost(String? userId) async {
  final params = {
    'user_id': '$userId',
    'page': '1',
    'limit': '10',
  };
  List<MyPostModel> responseMessage = [];
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.allUserPostList,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      responseMessage =
          jsonData.map((item) => MyPostModel.fromJson(item)).toList();
    }

    return responseMessage;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return responseMessage;
}
