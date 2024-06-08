class TeamListModel {
  int? teamTeamId;
  String? teamTeamName;
  String? teamLogo;
  String? teamDescription;
  int? teamCreatorUser;
  int? teamPrivacyType;
  int? teamReviewType;
  String? memberCount;

  TeamListModel(
      {this.teamTeamId,
      this.teamTeamName,
      this.teamLogo,
      this.teamDescription,
      this.teamCreatorUser,
      this.teamPrivacyType,
      this.teamReviewType,
      this.memberCount});

  TeamListModel.fromJson(Map<String, dynamic> json) {
    teamTeamId = json['team_team_id'];
    teamTeamName = json['team_team_name'];
    teamLogo = json['team_logo'];
    teamDescription = json['team_description'];
    teamCreatorUser = json['team_creator_user'];
    teamPrivacyType = json['team_privacy_type'];
    teamReviewType = json['team_review_type'];
    memberCount = json['memberCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_team_id'] = teamTeamId;
    data['team_team_name'] = teamTeamName;
    data['team_logo'] = teamLogo;
    data['team_description'] = teamDescription;
    data['team_creator_user'] = teamCreatorUser;
    data['team_privacy_type'] = teamPrivacyType;
    data['team_review_type'] = teamReviewType;
    data['memberCount'] = memberCount;
    return data;
  }
}
