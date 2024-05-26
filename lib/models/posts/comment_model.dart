class CommentsModel {
  int? commentsCommentId;
  int? commentsUserId;
  int? commentsParentCommentId;
  String? commentsContent;
  String? commentsCreatedDate;
  int? userUserId;
  String? userDisplayName;
  String? userAvatar;

  CommentsModel(
      {this.commentsCommentId,
      this.commentsUserId,
      this.commentsParentCommentId,
      this.commentsContent,
      this.commentsCreatedDate,
      this.userUserId,
      this.userDisplayName,
      this.userAvatar});



  CommentsModel.fromJson(Map<String, dynamic> json) {
    commentsCommentId = json['comments_comment_id'];
    commentsUserId = json['comments_user_id'];
    commentsParentCommentId = json['comments_parent_comment_id'];
    commentsContent = json['comments_content'];
    commentsCreatedDate = json['comments_created_date'];
    userUserId = json['user_user_id'];
    userDisplayName = json['user_display_name'];
    userAvatar = json['user_avatar'];
  }
}
