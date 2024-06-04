part of 'my_page_bloc.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    MyInfoModel? myInfo,
    List<MyPostModel?>? myPosts,
    @Default(false) bool isLoading,
  }) = _MyPageState;
}
