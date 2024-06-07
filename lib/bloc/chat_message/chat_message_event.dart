part of 'chat_message_bloc.dart';

abstract class ChatMessageEvent {
  const ChatMessageEvent();
}

@freezed
class GetChatData extends ChatMessageEvent with _$GetChatData {
  const factory GetChatData(
    ParamOpenChat messages,
  ) = _GetChatData;
}

@freezed
class LoadChat extends ChatMessageEvent with _$LoadChat {
  const factory LoadChat() = _LoadChat;
}

@freezed
class SendMessage extends ChatMessageEvent with _$SendMessage {
  const factory SendMessage(
    String? message,
  ) = _SendMessage;
}
