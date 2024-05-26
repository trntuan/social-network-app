class PostDetailModel {
  int? postPostId;
  String? postContent;
  int? postUserPost;
  int? postPrivacyType;
  String? postCreatedDate;
  String? userDisplayName;
  String? userAvatar;
  String? commentCount;
  String? credibilityCount;
  int? likeValue;
  List<String>? postImageUrl;

  PostDetailModel({
    this.postPostId,
    this.postContent,
    this.postUserPost,
    this.postPrivacyType,
    this.postCreatedDate,
    this.userDisplayName,
    this.userAvatar,
    this.commentCount,
    this.credibilityCount,
    this.postImageUrl,
    this.likeValue,
  });

  PostDetailModel.fromJson(Map<String, dynamic> json) {
    postPostId = json['post_post_id'];
    postContent = json['post_content'];
    postUserPost = json['post_user_post'];
    postPrivacyType = json['post_privacy_type'];
    postCreatedDate = json['post_created_date'];
    userDisplayName = json['user_display_name'];
    userAvatar = json['user_avatar'];
    commentCount = json['commentCount'];
    credibilityCount = json['credibilityCount'];
    postImageUrl = json['post_image_url'].cast<String>();
    likeValue = json['like_value'];
  }
}
