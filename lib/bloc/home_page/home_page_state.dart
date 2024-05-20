part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    List<MyPostsModel>? myPosts,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadMore,
  }) = _HomePageState;
}
