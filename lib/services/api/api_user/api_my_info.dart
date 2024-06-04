import 'dart:convert';

import '../../../const/const_path.dart';
import '../../../helpers/helper_api.dart';
import '../../../helpers/helper_check.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/posts/my_posts_model.dart';
import '../../../models/user/my_info_model.dart';
import '../api_service.dart';

Future<MyInfoModel?> apiGetMyInfo() async {
  MyInfoModel? myInfo;

  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.myDetail,
    );

    final result = HelperApi.returnBody(response);
    if (!HelperChecker.empty(result)) {
      myInfo = MyInfoModel.fromJson(result!);
    }

    return myInfo;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return myInfo;
}

Future<List<MyPostModel?>> apiGetAllMyPost() async {
  final params = {
    'page': '1',
    'limit': '10',
  };
  List<MyPostModel> responseMessage = [];
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.allMyPosts,
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
