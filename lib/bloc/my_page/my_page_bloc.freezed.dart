// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfoMyPage {}

/// @nodoc
abstract class $InfoMyPageCopyWith<$Res> {
  factory $InfoMyPageCopyWith(
          InfoMyPage value, $Res Function(InfoMyPage) then) =
      _$InfoMyPageCopyWithImpl<$Res, InfoMyPage>;
}

/// @nodoc
class _$InfoMyPageCopyWithImpl<$Res, $Val extends InfoMyPage>
    implements $InfoMyPageCopyWith<$Res> {
  _$InfoMyPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InfoMyPageImplCopyWith<$Res> {
  factory _$$InfoMyPageImplCopyWith(
          _$InfoMyPageImpl value, $Res Function(_$InfoMyPageImpl) then) =
      __$$InfoMyPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InfoMyPageImplCopyWithImpl<$Res>
    extends _$InfoMyPageCopyWithImpl<$Res, _$InfoMyPageImpl>
    implements _$$InfoMyPageImplCopyWith<$Res> {
  __$$InfoMyPageImplCopyWithImpl(
      _$InfoMyPageImpl _value, $Res Function(_$InfoMyPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InfoMyPageImpl implements _InfoMyPage {
  const _$InfoMyPageImpl();

  @override
  String toString() {
    return 'InfoMyPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InfoMyPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _InfoMyPage implements InfoMyPage {
  const factory _InfoMyPage() = _$InfoMyPageImpl;
}

/// @nodoc
mixin _$PostListMyPage {}

/// @nodoc
abstract class $PostListMyPageCopyWith<$Res> {
  factory $PostListMyPageCopyWith(
          PostListMyPage value, $Res Function(PostListMyPage) then) =
      _$PostListMyPageCopyWithImpl<$Res, PostListMyPage>;
}

/// @nodoc
class _$PostListMyPageCopyWithImpl<$Res, $Val extends PostListMyPage>
    implements $PostListMyPageCopyWith<$Res> {
  _$PostListMyPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostListMyPageImplCopyWith<$Res> {
  factory _$$PostListMyPageImplCopyWith(_$PostListMyPageImpl value,
          $Res Function(_$PostListMyPageImpl) then) =
      __$$PostListMyPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostListMyPageImplCopyWithImpl<$Res>
    extends _$PostListMyPageCopyWithImpl<$Res, _$PostListMyPageImpl>
    implements _$$PostListMyPageImplCopyWith<$Res> {
  __$$PostListMyPageImplCopyWithImpl(
      _$PostListMyPageImpl _value, $Res Function(_$PostListMyPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostListMyPageImpl implements _PostListMyPage {
  const _$PostListMyPageImpl();

  @override
  String toString() {
    return 'PostListMyPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostListMyPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _PostListMyPage implements PostListMyPage {
  const factory _PostListMyPage() = _$PostListMyPageImpl;
}

/// @nodoc
mixin _$MyPageState {
  MyInfoModel? get myInfo => throw _privateConstructorUsedError;
  List<MyPostModel?>? get myPosts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call({MyInfoModel? myInfo, List<MyPostModel?>? myPosts, bool isLoading});
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myInfo = freezed,
    Object? myPosts = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      myInfo: freezed == myInfo
          ? _value.myInfo
          : myInfo // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      myPosts: freezed == myPosts
          ? _value.myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<MyPostModel?>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageStateImplCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$MyPageStateImplCopyWith(
          _$MyPageStateImpl value, $Res Function(_$MyPageStateImpl) then) =
      __$$MyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MyInfoModel? myInfo, List<MyPostModel?>? myPosts, bool isLoading});
}

/// @nodoc
class __$$MyPageStateImplCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$MyPageStateImpl>
    implements _$$MyPageStateImplCopyWith<$Res> {
  __$$MyPageStateImplCopyWithImpl(
      _$MyPageStateImpl _value, $Res Function(_$MyPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myInfo = freezed,
    Object? myPosts = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$MyPageStateImpl(
      myInfo: freezed == myInfo
          ? _value.myInfo
          : myInfo // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      myPosts: freezed == myPosts
          ? _value._myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<MyPostModel?>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MyPageStateImpl implements _MyPageState {
  const _$MyPageStateImpl(
      {this.myInfo, final List<MyPostModel?>? myPosts, this.isLoading = false})
      : _myPosts = myPosts;

  @override
  final MyInfoModel? myInfo;
  final List<MyPostModel?>? _myPosts;
  @override
  List<MyPostModel?>? get myPosts {
    final value = _myPosts;
    if (value == null) return null;
    if (_myPosts is EqualUnmodifiableListView) return _myPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MyPageState(myInfo: $myInfo, myPosts: $myPosts, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageStateImpl &&
            (identical(other.myInfo, myInfo) || other.myInfo == myInfo) &&
            const DeepCollectionEquality().equals(other._myPosts, _myPosts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myInfo,
      const DeepCollectionEquality().hash(_myPosts), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      __$$MyPageStateImplCopyWithImpl<_$MyPageStateImpl>(this, _$identity);
}

abstract class _MyPageState implements MyPageState {
  const factory _MyPageState(
      {final MyInfoModel? myInfo,
      final List<MyPostModel?>? myPosts,
      final bool isLoading}) = _$MyPageStateImpl;

  @override
  MyInfoModel? get myInfo;
  @override
  List<MyPostModel?>? get myPosts;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
