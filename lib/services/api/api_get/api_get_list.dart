import 'dart:convert';

import '../../../../const/const_path.dart';
import '../../../../models/posts/comment_model.dart';
import '../../../helpers/helper_check.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/chat/chat_model.dart';
import '../../../models/messages/messages_model.dart';
import '../../../models/posts/all_posts_model.dart';
import '../../../models/posts/friend_recommend_model.dart';
import '../../../models/posts/my_posts_model.dart';
import '../../../models/team/team_list_model.dart';
import '../../storage/my_data_storage.dart';
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

//
//

Future<ChatModel?> apiGetchat(String? userId) async {
  ChatModel? chat;
  final params = {
    'user1Id': '${MyDataStorage.singleton.userId}',
    'user2Id': '${userId}',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.historyChat,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final jsonData = jsonDecode(response?.body.toString() ?? '');

      chat = ChatModel.fromJson(jsonData);
    }

    return chat;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return chat;
}

Future<List<MessagesModel?>> apiGetMessages() async {
  List<MessagesModel> messages = [];
  final params = {
    'userId': '${MyDataStorage.singleton.userId}',
  };
  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.chat,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      messages = jsonData.map((item) => MessagesModel.fromJson(item)).toList();
    }

    return messages;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return messages;
}

//

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

Future<List<FriendRecommendModel?>> apiGetMyFriend() async {
  List<FriendRecommendModel> myFriend = [];

  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.myfriend,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      myFriend =
          jsonData.map((item) => FriendRecommendModel.fromJson(item)).toList();
    }

    return myFriend;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return myFriend;
}

Future<List<FriendRecommendModel?>> apiGetFriendSendToYou() async {
  List<FriendRecommendModel> myFriend = [];

  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.friendSentToYou,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      myFriend =
          jsonData.map((item) => FriendRecommendModel.fromJson(item)).toList();
    }

    return myFriend;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return myFriend;
}

//

Future<List<FriendRecommendModel?>> apiGetFriendYouSent() async {
  List<FriendRecommendModel> myFriend = [];

  try {
    final response = await ApiService.singleton.get(
      ConstPathGet.friendYouSent,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      myFriend =
          jsonData.map((item) => FriendRecommendModel.fromJson(item)).toList();
    }

    return myFriend;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return myFriend;
}

Future<List<TeamListModel?>> apiGetTeam(
  String url,
) async {
  final params = {
    'user_id': '${MyDataStorage.singleton.userId}',
  };
  List<TeamListModel> team = [];

  try {
    final response = await ApiService.singleton.get(
      url,
      queryParams: params,
    );

    if (!HelperChecker.empty(response?.body)) {
      final List<dynamic> jsonData =
          jsonDecode(response?.body.toString() ?? '');
      team = jsonData.map((item) => TeamListModel.fromJson(item)).toList();
    }

    return team;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return team;
}
