part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState({
    @Default([]) List<MessagesModel?> messages,
  }) = _MessagesState;
}
