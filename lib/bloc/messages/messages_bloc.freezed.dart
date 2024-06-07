// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessagesEventGetMessages {}

/// @nodoc
abstract class $MessagesEventGetMessagesCopyWith<$Res> {
  factory $MessagesEventGetMessagesCopyWith(MessagesEventGetMessages value,
          $Res Function(MessagesEventGetMessages) then) =
      _$MessagesEventGetMessagesCopyWithImpl<$Res, MessagesEventGetMessages>;
}

/// @nodoc
class _$MessagesEventGetMessagesCopyWithImpl<$Res,
        $Val extends MessagesEventGetMessages>
    implements $MessagesEventGetMessagesCopyWith<$Res> {
  _$MessagesEventGetMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessagesEventGetMessagesImplCopyWith<$Res> {
  factory _$$MessagesEventGetMessagesImplCopyWith(
          _$MessagesEventGetMessagesImpl value,
          $Res Function(_$MessagesEventGetMessagesImpl) then) =
      __$$MessagesEventGetMessagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessagesEventGetMessagesImplCopyWithImpl<$Res>
    extends _$MessagesEventGetMessagesCopyWithImpl<$Res,
        _$MessagesEventGetMessagesImpl>
    implements _$$MessagesEventGetMessagesImplCopyWith<$Res> {
  __$$MessagesEventGetMessagesImplCopyWithImpl(
      _$MessagesEventGetMessagesImpl _value,
      $Res Function(_$MessagesEventGetMessagesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessagesEventGetMessagesImpl implements _MessagesEventGetMessages {
  const _$MessagesEventGetMessagesImpl();

  @override
  String toString() {
    return 'MessagesEventGetMessages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesEventGetMessagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _MessagesEventGetMessages implements MessagesEventGetMessages {
  const factory _MessagesEventGetMessages() = _$MessagesEventGetMessagesImpl;
}

/// @nodoc
mixin _$MessagesState {
  List<MessagesModel?> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesStateCopyWith<MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res, MessagesState>;
  @useResult
  $Res call({List<MessagesModel?> messages});
}

/// @nodoc
class _$MessagesStateCopyWithImpl<$Res, $Val extends MessagesState>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

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
              as List<MessagesModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagesStateImplCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$$MessagesStateImplCopyWith(
          _$MessagesStateImpl value, $Res Function(_$MessagesStateImpl) then) =
      __$$MessagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MessagesModel?> messages});
}

/// @nodoc
class __$$MessagesStateImplCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$MessagesStateImpl>
    implements _$$MessagesStateImplCopyWith<$Res> {
  __$$MessagesStateImplCopyWithImpl(
      _$MessagesStateImpl _value, $Res Function(_$MessagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessagesStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessagesModel?>,
    ));
  }
}

/// @nodoc

class _$MessagesStateImpl implements _MessagesState {
  const _$MessagesStateImpl({final List<MessagesModel?> messages = const []})
      : _messages = messages;

  final List<MessagesModel?> _messages;
  @override
  @JsonKey()
  List<MessagesModel?> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessagesState(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesStateImplCopyWith<_$MessagesStateImpl> get copyWith =>
      __$$MessagesStateImplCopyWithImpl<_$MessagesStateImpl>(this, _$identity);
}

abstract class _MessagesState implements MessagesState {
  const factory _MessagesState({final List<MessagesModel?> messages}) =
      _$MessagesStateImpl;

  @override
  List<MessagesModel?> get messages;
  @override
  @JsonKey(ignore: true)
  _$$MessagesStateImplCopyWith<_$MessagesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
