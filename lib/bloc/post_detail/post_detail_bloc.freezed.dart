// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetPostDetail {
  int? get postId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetPostDetailCopyWith<GetPostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostDetailCopyWith<$Res> {
  factory $GetPostDetailCopyWith(
          GetPostDetail value, $Res Function(GetPostDetail) then) =
      _$GetPostDetailCopyWithImpl<$Res, GetPostDetail>;
  @useResult
  $Res call({int? postId});
}

/// @nodoc
class _$GetPostDetailCopyWithImpl<$Res, $Val extends GetPostDetail>
    implements $GetPostDetailCopyWith<$Res> {
  _$GetPostDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPostDetailImplCopyWith<$Res>
    implements $GetPostDetailCopyWith<$Res> {
  factory _$$GetPostDetailImplCopyWith(
          _$GetPostDetailImpl value, $Res Function(_$GetPostDetailImpl) then) =
      __$$GetPostDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? postId});
}

/// @nodoc
class __$$GetPostDetailImplCopyWithImpl<$Res>
    extends _$GetPostDetailCopyWithImpl<$Res, _$GetPostDetailImpl>
    implements _$$GetPostDetailImplCopyWith<$Res> {
  __$$GetPostDetailImplCopyWithImpl(
      _$GetPostDetailImpl _value, $Res Function(_$GetPostDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_$GetPostDetailImpl(
      freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetPostDetailImpl implements _GetPostDetail {
  const _$GetPostDetailImpl(this.postId);

  @override
  final int? postId;

  @override
  String toString() {
    return 'GetPostDetail(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostDetailImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostDetailImplCopyWith<_$GetPostDetailImpl> get copyWith =>
      __$$GetPostDetailImplCopyWithImpl<_$GetPostDetailImpl>(this, _$identity);
}

abstract class _GetPostDetail implements GetPostDetail {
  const factory _GetPostDetail(final int? postId) = _$GetPostDetailImpl;

  @override
  int? get postId;
  @override
  @JsonKey(ignore: true)
  _$$GetPostDetailImplCopyWith<_$GetPostDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendComment {
  int? get postId => throw _privateConstructorUsedError;
  int? get parentCommentId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendCommentCopyWith<SendComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCommentCopyWith<$Res> {
  factory $SendCommentCopyWith(
          SendComment value, $Res Function(SendComment) then) =
      _$SendCommentCopyWithImpl<$Res, SendComment>;
  @useResult
  $Res call({int? postId, int? parentCommentId});
}

/// @nodoc
class _$SendCommentCopyWithImpl<$Res, $Val extends SendComment>
    implements $SendCommentCopyWith<$Res> {
  _$SendCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? parentCommentId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res> implements $SendCommentCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? postId, int? parentCommentId});
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$SendCommentCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? parentCommentId = freezed,
  }) {
    return _then(_$SendImpl(
      freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl(this.postId, {this.parentCommentId});

  @override
  final int? postId;
  @override
  final int? parentCommentId;

  @override
  String toString() {
    return 'SendComment(postId: $postId, parentCommentId: $parentCommentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, parentCommentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      __$$SendImplCopyWithImpl<_$SendImpl>(this, _$identity);
}

abstract class _Send implements SendComment {
  const factory _Send(final int? postId, {final int? parentCommentId}) =
      _$SendImpl;

  @override
  int? get postId;
  @override
  int? get parentCommentId;
  @override
  @JsonKey(ignore: true)
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikePost {
  int? get postId => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikePostCopyWith<LikePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikePostCopyWith<$Res> {
  factory $LikePostCopyWith(LikePost value, $Res Function(LikePost) then) =
      _$LikePostCopyWithImpl<$Res, LikePost>;
  @useResult
  $Res call({int? postId, int? value});
}

/// @nodoc
class _$LikePostCopyWithImpl<$Res, $Val extends LikePost>
    implements $LikePostCopyWith<$Res> {
  _$LikePostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikePostImplCopyWith<$Res>
    implements $LikePostCopyWith<$Res> {
  factory _$$LikePostImplCopyWith(
          _$LikePostImpl value, $Res Function(_$LikePostImpl) then) =
      __$$LikePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? postId, int? value});
}

/// @nodoc
class __$$LikePostImplCopyWithImpl<$Res>
    extends _$LikePostCopyWithImpl<$Res, _$LikePostImpl>
    implements _$$LikePostImplCopyWith<$Res> {
  __$$LikePostImplCopyWithImpl(
      _$LikePostImpl _value, $Res Function(_$LikePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? value = freezed,
  }) {
    return _then(_$LikePostImpl(
      freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LikePostImpl implements _LikePost {
  const _$LikePostImpl(this.postId, {this.value});

  @override
  final int? postId;
  @override
  final int? value;

  @override
  String toString() {
    return 'LikePost(postId: $postId, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikePostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      __$$LikePostImplCopyWithImpl<_$LikePostImpl>(this, _$identity);
}

abstract class _LikePost implements LikePost {
  const factory _LikePost(final int? postId, {final int? value}) =
      _$LikePostImpl;

  @override
  int? get postId;
  @override
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetComemnt {
  int? get postId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetComemntCopyWith<GetComemnt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetComemntCopyWith<$Res> {
  factory $GetComemntCopyWith(
          GetComemnt value, $Res Function(GetComemnt) then) =
      _$GetComemntCopyWithImpl<$Res, GetComemnt>;
  @useResult
  $Res call({int? postId});
}

/// @nodoc
class _$GetComemntCopyWithImpl<$Res, $Val extends GetComemnt>
    implements $GetComemntCopyWith<$Res> {
  _$GetComemntCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetComemntImplCopyWith<$Res>
    implements $GetComemntCopyWith<$Res> {
  factory _$$GetComemntImplCopyWith(
          _$GetComemntImpl value, $Res Function(_$GetComemntImpl) then) =
      __$$GetComemntImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? postId});
}

/// @nodoc
class __$$GetComemntImplCopyWithImpl<$Res>
    extends _$GetComemntCopyWithImpl<$Res, _$GetComemntImpl>
    implements _$$GetComemntImplCopyWith<$Res> {
  __$$GetComemntImplCopyWithImpl(
      _$GetComemntImpl _value, $Res Function(_$GetComemntImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_$GetComemntImpl(
      freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetComemntImpl implements _GetComemnt {
  const _$GetComemntImpl(this.postId);

  @override
  final int? postId;

  @override
  String toString() {
    return 'GetComemnt(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetComemntImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetComemntImplCopyWith<_$GetComemntImpl> get copyWith =>
      __$$GetComemntImplCopyWithImpl<_$GetComemntImpl>(this, _$identity);
}

abstract class _GetComemnt implements GetComemnt {
  const factory _GetComemnt(final int? postId) = _$GetComemntImpl;

  @override
  int? get postId;
  @override
  @JsonKey(ignore: true)
  _$$GetComemntImplCopyWith<_$GetComemntImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostDetailState {
  PostDetailModel? get postDetail => throw _privateConstructorUsedError;
  List<CommentsModel?>? get comments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostDetailStateCopyWith<PostDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailStateCopyWith<$Res> {
  factory $PostDetailStateCopyWith(
          PostDetailState value, $Res Function(PostDetailState) then) =
      _$PostDetailStateCopyWithImpl<$Res, PostDetailState>;
  @useResult
  $Res call({PostDetailModel? postDetail, List<CommentsModel?>? comments});
}

/// @nodoc
class _$PostDetailStateCopyWithImpl<$Res, $Val extends PostDetailState>
    implements $PostDetailStateCopyWith<$Res> {
  _$PostDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postDetail = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      postDetail: freezed == postDetail
          ? _value.postDetail
          : postDetail // ignore: cast_nullable_to_non_nullable
              as PostDetailModel?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostDetailStateImplCopyWith<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  factory _$$PostDetailStateImplCopyWith(_$PostDetailStateImpl value,
          $Res Function(_$PostDetailStateImpl) then) =
      __$$PostDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostDetailModel? postDetail, List<CommentsModel?>? comments});
}

/// @nodoc
class __$$PostDetailStateImplCopyWithImpl<$Res>
    extends _$PostDetailStateCopyWithImpl<$Res, _$PostDetailStateImpl>
    implements _$$PostDetailStateImplCopyWith<$Res> {
  __$$PostDetailStateImplCopyWithImpl(
      _$PostDetailStateImpl _value, $Res Function(_$PostDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postDetail = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$PostDetailStateImpl(
      postDetail: freezed == postDetail
          ? _value.postDetail
          : postDetail // ignore: cast_nullable_to_non_nullable
              as PostDetailModel?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel?>?,
    ));
  }
}

/// @nodoc

class _$PostDetailStateImpl implements _PostDetailState {
  const _$PostDetailStateImpl(
      {this.postDetail, final List<CommentsModel?>? comments})
      : _comments = comments;

  @override
  final PostDetailModel? postDetail;
  final List<CommentsModel?>? _comments;
  @override
  List<CommentsModel?>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostDetailState(postDetail: $postDetail, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDetailStateImpl &&
            (identical(other.postDetail, postDetail) ||
                other.postDetail == postDetail) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, postDetail, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDetailStateImplCopyWith<_$PostDetailStateImpl> get copyWith =>
      __$$PostDetailStateImplCopyWithImpl<_$PostDetailStateImpl>(
          this, _$identity);
}

abstract class _PostDetailState implements PostDetailState {
  const factory _PostDetailState(
      {final PostDetailModel? postDetail,
      final List<CommentsModel?>? comments}) = _$PostDetailStateImpl;

  @override
  PostDetailModel? get postDetail;
  @override
  List<CommentsModel?>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$PostDetailStateImplCopyWith<_$PostDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
