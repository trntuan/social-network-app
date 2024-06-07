import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../helpers/helper_log.dart';
import '../../models/chat/chat_model.dart';
import '../../models/params/param_open_chat.dart';
import '../../services/api/api_get/api_get_list.dart';
import '../../services/api/api_post/api_send_message.dart';

part 'chat_message_event.dart';
part 'chat_message_state.dart';
part 'chat_message_bloc.freezed.dart';

@injectable
class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState> {
  ChatMessageBloc() : super(const ChatMessageState()) {
    on<GetChatData>((event, emit) async {
      final result = await apiGetchat(event.messages.friendId);

      emit(state.copyWith(
        chat: result,
        messages: event.messages,
      ));
    });

    on<LoadChat>((event, emit) async {
      final result = await apiGetchat('${state.messages?.friendId}');
      emit(state.copyWith(chat: result));
    });

    on<SendMessage>((event, emit) async {
      final result = await apiSendMesssage(
        chatId: "${state.chat?.chatId}",
        messsage: event.message,
      );
      if (result.isSuccess) {
        add(const LoadChat());
      } else {
        HelperLog.logSocket(
          'ChatMessageBloc ${result}',
        );
      }
    });
  }
}
