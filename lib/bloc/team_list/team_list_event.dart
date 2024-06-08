part of 'team_list_bloc.dart';

abstract class TeamListEvent {
  const TeamListEvent();
}

@freezed
class GetTeamList extends TeamListEvent with _$GetTeamList {
  const factory GetTeamList() = _GetTeamList;
}
