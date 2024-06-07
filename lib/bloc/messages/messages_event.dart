part of 'messages_bloc.dart';

abstract class MessagesEvent {
  const MessagesEvent();
}

@freezed
class MessagesEventGetMessages
    with _$MessagesEventGetMessages
    implements MessagesEvent {
  const factory MessagesEventGetMessages() = _MessagesEventGetMessages;
}
