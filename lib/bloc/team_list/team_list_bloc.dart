import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_list_event.dart';
part 'team_list_state.dart';
part 'team_list_bloc.freezed.dart';

class TeamListBloc extends Bloc<TeamListEvent, TeamListState> {
  TeamListBloc() : super(TeamListState()) {
    on<TeamListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
