class MyPostsModel {
  int? postPostId;
  String? postContent;
  int? postUserPost;
  int? postPrivacyType;
  String? userDisplayName;
  String? userAvatar;
  String? commentCount;
  String? credibilityCount;
  List<String>? postImageUrl;

  MyPostsModel(
      {this.postPostId,
      this.postContent,
      this.postUserPost,
      this.postPrivacyType,
      this.userDisplayName,
      this.userAvatar,
      this.commentCount,
      this.credibilityCount,
      this.postImageUrl});

  MyPostsModel.fromJson(Map<String, dynamic> json) {
    postPostId = json['post_post_id'];
    postContent = json['post_content'];
    postUserPost = json['post_user_post'];
    postPrivacyType = json['post_privacy_type'];
    userDisplayName = json['user_display_name'];
    userAvatar = json['user_avatar'];
    commentCount = json['commentCount'];
    credibilityCount = json['credibilityCount'];
    postImageUrl = json['post_image_url'].cast<String>();
  }
}
