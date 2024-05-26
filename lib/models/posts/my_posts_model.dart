import 'dart:convert';

class MyPostModel {
  final int postId;
  final String content;
  final int userId;
  final int privacyType;
  final DateTime createdDate;
  final String displayName;
  final String? avatar;
  final String commentCount;
  final String credibilityCount;
  final List<String> imageUrls;

  MyPostModel({
    required this.postId,
    required this.content,
    required this.userId,
    required this.privacyType,
    required this.createdDate,
    required this.displayName,
    required this.commentCount,
    required this.credibilityCount,
    required this.imageUrls,
    this.avatar,
  });

  factory MyPostModel.fromJson(Map<String, dynamic> json) {
    return MyPostModel(
      postId: json['post_post_id'],
      content: json['post_content'],
      userId: json['post_user_post'],
      privacyType: json['post_privacy_type'],
      createdDate: DateTime.parse(json['post_created_date']),
      displayName: json['user_display_name'],
      avatar: json['user_avatar'],
      commentCount: json['commentCount'],
      credibilityCount: json['credibilityCount'],
      imageUrls: List<String>.from(json['post_image_url']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_post_id': postId,
      'post_content': content,
      'post_user_post': userId,
      'post_privacy_type': privacyType,
      'post_created_date': createdDate.toIso8601String(),
      'user_display_name': displayName,
      'user_avatar': avatar,
      'commentCount': commentCount,
      'credibilityCount': credibilityCount,
      'post_image_url': imageUrls,
    };
  }

  static List<MyPostModel> fromJsonList(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((json) => MyPostModel.fromJson(json)).toList();
  }

  static String toJsonList(List<MyPostModel> posts) {
    final data = posts.map((post) => post.toJson()).toList();
    return json.encode(data);
  }
}
