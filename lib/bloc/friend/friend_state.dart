part of 'friend_bloc.dart';

@freezed
class FriendState with _$FriendState {
  const factory FriendState({
    @Default([]) List<FriendRecommendModel?> friend,
    @Default(false) bool isLoading,
  }) = _FriendState;
}
