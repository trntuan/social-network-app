class MyInfoModel {
  int? userUserId;
  String? userDisplayName;
  String? userAvatar;
  String? userEmail;
  int? userGender;
  String? userInterests;
  String? userLocation;
  String? userDateOfBirth;
  int? userIsActive;
  String? friendCount;

  MyInfoModel(
      {this.userUserId,
      this.userDisplayName,
      this.userAvatar,
      this.userEmail,
      this.userGender,
      this.userInterests,
      this.userLocation,
      this.userDateOfBirth,
      this.userIsActive,
      this.friendCount});

  MyInfoModel.fromJson(Map<String, dynamic> json) {
    userUserId = json['user_user_id'];
    userDisplayName = json['user_display_name'];
    userAvatar = json['user_avatar'];
    userEmail = json['user_email'];
    userGender = json['user_gender'];
    userInterests = json['user_interests'];
    userLocation = json['user_location'];
    userDateOfBirth = json['user_date_of_birth'];
    userIsActive = json['user_is_active'];
    friendCount = json['friendCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_user_id'] = userUserId;
    data['user_display_name'] = userDisplayName;
    data['user_avatar'] = userAvatar;
    data['user_email'] = userEmail;
    data['user_gender'] = userGender;
    data['user_interests'] = userInterests;
    data['user_location'] = userLocation;
    data['user_date_of_birth'] = userDateOfBirth;
    data['user_is_active'] = userIsActive;
    data['friendCount'] = friendCount;
    return data;
  }
}
