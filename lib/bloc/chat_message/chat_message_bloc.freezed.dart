// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetChatData {
  ParamOpenChat get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetChatDataCopyWith<GetChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChatDataCopyWith<$Res> {
  factory $GetChatDataCopyWith(
          GetChatData value, $Res Function(GetChatData) then) =
      _$GetChatDataCopyWithImpl<$Res, GetChatData>;
  @useResult
  $Res call({ParamOpenChat messages});
}

/// @nodoc
class _$GetChatDataCopyWithImpl<$Res, $Val extends GetChatData>
    implements $GetChatDataCopyWith<$Res> {
  _$GetChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as ParamOpenChat,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetChatDataImplCopyWith<$Res>
    implements $GetChatDataCopyWith<$Res> {
  factory _$$GetChatDataImplCopyWith(
          _$GetChatDataImpl value, $Res Function(_$GetChatDataImpl) then) =
      __$$GetChatDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ParamOpenChat messages});
}

/// @nodoc
class __$$GetChatDataImplCopyWithImpl<$Res>
    extends _$GetChatDataCopyWithImpl<$Res, _$GetChatDataImpl>
    implements _$$GetChatDataImplCopyWith<$Res> {
  __$$GetChatDataImplCopyWithImpl(
      _$GetChatDataImpl _value, $Res Function(_$GetChatDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$GetChatDataImpl(
      null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as ParamOpenChat,
    ));
  }
}

/// @nodoc

class _$GetChatDataImpl implements _GetChatData {
  const _$GetChatDataImpl(this.messages);

  @override
  final ParamOpenChat messages;

  @override
  String toString() {
    return 'GetChatData(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChatDataImpl &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChatDataImplCopyWith<_$GetChatDataImpl> get copyWith =>
      __$$GetChatDataImplCopyWithImpl<_$GetChatDataImpl>(this, _$identity);
}

abstract class _GetChatData implements GetChatData {
  const factory _GetChatData(final ParamOpenChat messages) = _$GetChatDataImpl;

  @override
  ParamOpenChat get messages;
  @override
  @JsonKey(ignore: true)
  _$$GetChatDataImplCopyWith<_$GetChatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoadChat {}

/// @nodoc
abstract class $LoadChatCopyWith<$Res> {
  factory $LoadChatCopyWith(LoadChat value, $Res Function(LoadChat) then) =
      _$LoadChatCopyWithImpl<$Res, LoadChat>;
}

/// @nodoc
class _$LoadChatCopyWithImpl<$Res, $Val extends LoadChat>
    implements $LoadChatCopyWith<$Res> {
  _$LoadChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadChatImplCopyWith<$Res> {
  factory _$$LoadChatImplCopyWith(
          _$LoadChatImpl value, $Res Function(_$LoadChatImpl) then) =
      __$$LoadChatImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChatImplCopyWithImpl<$Res>
    extends _$LoadChatCopyWithImpl<$Res, _$LoadChatImpl>
    implements _$$LoadChatImplCopyWith<$Res> {
  __$$LoadChatImplCopyWithImpl(
      _$LoadChatImpl _value, $Res Function(_$LoadChatImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadChatImpl implements _LoadChat {
  const _$LoadChatImpl();

  @override
  String toString() {
    return 'LoadChat()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChatImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _LoadChat implements LoadChat {
  const factory _LoadChat() = _$LoadChatImpl;
}

/// @nodoc
mixin _$SendMessage {
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendMessageCopyWith<SendMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageCopyWith<$Res> {
  factory $SendMessageCopyWith(
          SendMessage value, $Res Function(SendMessage) then) =
      _$SendMessageCopyWithImpl<$Res, SendMessage>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$SendMessageCopyWithImpl<$Res, $Val extends SendMessage>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res>
    implements $SendMessageCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$SendMessageCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SendMessageImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'SendMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);
}

abstract class _SendMessage implements SendMessage {
  const factory _SendMessage(final String? message) = _$SendMessageImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatMessageState {
  ParamOpenChat? get messages => throw _privateConstructorUsedError;
  ChatModel? get chat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatMessageStateCopyWith<ChatMessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageStateCopyWith<$Res> {
  factory $ChatMessageStateCopyWith(
          ChatMessageState value, $Res Function(ChatMessageState) then) =
      _$ChatMessageStateCopyWithImpl<$Res, ChatMessageState>;
  @useResult
  $Res call({ParamOpenChat? messages, ChatModel? chat});
}

/// @nodoc
class _$ChatMessageStateCopyWithImpl<$Res, $Val extends ChatMessageState>
    implements $ChatMessageStateCopyWith<$Res> {
  _$ChatMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? chat = freezed,
  }) {
    return _then(_value.copyWith(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as ParamOpenChat?,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageStateImplCopyWith<$Res>
    implements $ChatMessageStateCopyWith<$Res> {
  factory _$$ChatMessageStateImplCopyWith(_$ChatMessageStateImpl value,
          $Res Function(_$ChatMessageStateImpl) then) =
      __$$ChatMessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ParamOpenChat? messages, ChatModel? chat});
}

/// @nodoc
class __$$ChatMessageStateImplCopyWithImpl<$Res>
    extends _$ChatMessageStateCopyWithImpl<$Res, _$ChatMessageStateImpl>
    implements _$$ChatMessageStateImplCopyWith<$Res> {
  __$$ChatMessageStateImplCopyWithImpl(_$ChatMessageStateImpl _value,
      $Res Function(_$ChatMessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? chat = freezed,
  }) {
    return _then(_$ChatMessageStateImpl(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as ParamOpenChat?,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
    ));
  }
}

/// @nodoc

class _$ChatMessageStateImpl implements _ChatMessageState {
  const _$ChatMessageStateImpl({this.messages, this.chat});

  @override
  final ParamOpenChat? messages;
  @override
  final ChatModel? chat;

  @override
  String toString() {
    return 'ChatMessageState(messages: $messages, chat: $chat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageStateImpl &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messages, chat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageStateImplCopyWith<_$ChatMessageStateImpl> get copyWith =>
      __$$ChatMessageStateImplCopyWithImpl<_$ChatMessageStateImpl>(
          this, _$identity);
}

abstract class _ChatMessageState implements ChatMessageState {
  const factory _ChatMessageState(
      {final ParamOpenChat? messages,
      final ChatModel? chat}) = _$ChatMessageStateImpl;

  @override
  ParamOpenChat? get messages;
  @override
  ChatModel? get chat;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageStateImplCopyWith<_$ChatMessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
