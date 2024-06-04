class FriendRecommendModel {
  int? userId;
  String? displayMame;
  String? avatar;
  int? commonFriends;

  FriendRecommendModel({
    this.userId,
    this.displayMame,
    this.avatar,
    this.commonFriends,
  });

  FriendRecommendModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    displayMame = json['display_name'];
    avatar = json['avatar'];
    commonFriends = json['commonFriends'];
  }
}
