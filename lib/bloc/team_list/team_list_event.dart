part of 'team_list_bloc.dart';

abstract class TeamListEvent {
  const TeamListEvent();
}

@freezed
class GetTeamListRecommend extends TeamListEvent with _$GetTeamListRecommend {
  const factory GetTeamListRecommend() = _GetTeamListRecommend;
}

@freezed
class GetMyTeamList extends TeamListEvent with _$GetMyTeamList {
  const factory GetMyTeamList() = _GetMyTeamList;
}

@freezed
class JoinTeam extends TeamListEvent with _$JoinTeam {
  const factory JoinTeam(String teamId) = _JoinTeam;
}

@freezed
class OutTeam extends TeamListEvent with _$OutTeam {
  const factory OutTeam(String teamId) = _OutTeam;
}
