import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/messages/messages_model.dart';
import '../../services/api/api_get/api_get_list.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

@injectable
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(const MessagesState()) {
    on<MessagesEventGetMessages>((event, emit) async {
      final result = await apiGetMessages();

      emit(state.copyWith(messages: result));
    });
  }
  // apiGetMessages
}
