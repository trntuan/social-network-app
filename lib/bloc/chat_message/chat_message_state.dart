part of 'chat_message_bloc.dart';

@freezed
class ChatMessageState with _$ChatMessageState {
  const factory ChatMessageState({
    ParamOpenChat? messages,
    ChatModel? chat,
  }) = _ChatMessageState;
}
