import 'dart:io';

import '../../../const/const_path.dart';
import '../../../helpers/helper_log.dart';
import '../api_service.dart';

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
