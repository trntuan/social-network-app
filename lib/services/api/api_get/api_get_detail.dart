import '../../../../const/const_path.dart';
import '../../../helpers/helper_api.dart';
import '../../../helpers/helper_check.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/posts/post_detail_model.dart';
import '../api_service.dart';

Future<PostDetailModel?> apiGetPostDetail(int? idPost) async {
  PostDetailModel? post;
  final params = {
    'id': '$idPost',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.postDetail,
      queryParams: params,
    );

    final result = HelperApi.returnBody(response);
    if (!HelperChecker.empty(result)) {
      post = PostDetailModel.fromJson(result!);
    }

    return post;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return post;
}
