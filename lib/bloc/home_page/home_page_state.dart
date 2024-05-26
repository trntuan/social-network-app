part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<PostListModel?> myPosts,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadMore,
  }) = _HomePageState;
}
