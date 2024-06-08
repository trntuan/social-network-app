part of 'team_list_bloc.dart';

@freezed
class TeamListState with _$TeamListState {
  const factory TeamListState({
    List<TeamListModel?>? team,
  }) = _TeamListState;
}
