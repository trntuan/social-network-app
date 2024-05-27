import 'dart:convert';

import '../../../../const/const_path.dart';
import '../../../../models/posts/comment_model.dart';
import '../../../helpers/helper_check.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/posts/all_posts_model.dart';
import '../../../models/posts/friend_recommend_model.dart';
import '../../../models/posts/my_posts_model.dart';
import '../api_service.dart';

Future<List<MyPostModel?>> apiGetAllMyPost() async {
  List<MyPostModel> responseMessage = [];
  final params = {
    'page': '1',
    'limit': '10',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.allMyPosts,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      responseMessage = MyPostModel.fromJsonList(response!.body);
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

// Future<List<MyPostModel?>> apiSendComment() async {
//   List<MyPostModel> responseMessage = [];
// //  final params = {
// //     'page': '1',
// //     'limit': '10',
// //   };
//   try {
//     final response = await ApiService.singleton.get(
//       ConstPathGet.allMyPosts,
//       // params,
//     );

//     if (!HelperChecker.empty(response?.body)) {
//       responseMessage = MyPostModel.fromJsonList(response!.body);
//     }

//     return responseMessage;
//   } catch (errors, stackTrace) {
//     HelperLog.logCatchErrors(
//       errors: errors,
//       stackTrace: stackTrace,
//     );
//   }

//   return responseMessage;
// }

Future<List<PostListModel?>> apiGetAllPosts() async {
  List<PostListModel> responseMessage = [];
  final params = {
    'page': '1',
    'limit': '10',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.allPosts,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      responseMessage =
          jsonData.map((item) => PostListModel.fromJson(item)).toList();
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

Future<List<CommentsModel?>> apiGetComment({
  int? postId,
  int? page = 1,
  int? limit = 10,
}) async {
  List<CommentsModel> comments = [];
  final params = {
    'id': '$postId',
    'page': '$page',
    'limit': '$limit',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.commentPost,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      comments = jsonData.map((item) => CommentsModel.fromJson(item)).toList();
    }

    return comments;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return comments;
}

Future<List<FriendRecommendModel?>> apiGetFriendRecommend() async {
  List<FriendRecommendModel> friendRecommend = [];

  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.friendRecommend,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      friendRecommend =
          jsonData.map((item) => FriendRecommendModel.fromJson(item)).toList();
    }

    return friendRecommend;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return friendRecommend;
}
