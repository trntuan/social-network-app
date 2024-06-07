part of 'user_detail_bloc.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState({
    MyInfoModel? userInfo,
    List<MyPostModel?>? userPosts,
    @Default(false) bool isLoading,
  }) = _UserDetailState;
}
