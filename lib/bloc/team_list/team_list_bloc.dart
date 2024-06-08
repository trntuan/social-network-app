import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../const/const_path.dart';
import '../../models/team/team_list_model.dart';
import '../../services/api/api_get/api_get_list.dart';
import '../../services/api/api_post/api_team.dart';

part 'team_list_event.dart';
part 'team_list_state.dart';
part 'team_list_bloc.freezed.dart';

@injectable
class TeamListBloc extends Bloc<TeamListEvent, TeamListState> {
  TeamListBloc() : super(const TeamListState()) {
    on<GetTeamListRecommend>((event, emit) async {
      final data = await apiGetTeam(
        ConstPathGet.teamRecommend,
      );
      emit(
        state.copyWith(team: data),
      );
    });

    on<GetMyTeamList>((event, emit) async {
      final data = await apiGetTeam(
        ConstPathGet.myTeam,
      );
      emit(
        state.copyWith(team: data),
      );
    });

    on<JoinTeam>((event, emit) async {
      final result = await apiAcctionTeam(
        event.teamId,
        ConstPathPost.joinTeam,
      );

      if (result.isSuccess) {
        add(const GetTeamListRecommend());
      }
    });

    on<OutTeam>((event, emit) async {
      final result = await apiAcctionTeam(
        event.teamId,
        ConstPathPost.outTeam,
      );

      if (result.isSuccess) {
        add(const GetMyTeamList());
      }
    });
  }
}
