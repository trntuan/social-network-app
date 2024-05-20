import 'dart:io';

import '../../../const/const_path.dart';
import '../../../helpers/helper_api.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/posts/my_posts_model.dart';
import '../api_service.dart';

Future<List<MyPostsModel?>> apiGetAllMyPost() async {
  final List<MyPostsModel> responseMessage = [];
//  final params = {
//     'page': '1',
//     'limit': '10',
//   };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.allMyPosts,
      // params,
    );

    if (response?.statusCode == 200) {
      final data = HelperApi.returnBody(response, true);

      HelperLog.showLTest('data: $data');

      // MyPostsModel.fromMap(data);

      // await StorageService.writeData();
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

Future<bool> apiPostNewLetter(String content, String privacyType,
    {File? image1, File? image2, File? image3}) async {
  bool response = false;

  try {
    response = await ApiService.singleton.uploadPost(
      ConstPathPost.postNewLetter,
      content,
      privacyType,
      image1: image1,
      image2: image2,
      image3: image3,
      // params,
    );

    return response;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return response;
}
