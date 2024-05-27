part of 'friend_bloc.dart';

abstract class FriendEvent {
  const FriendEvent();
}

@freezed
class ListFriendRecommend extends FriendEvent with _$ListFriendRecommend {
  const factory ListFriendRecommend() = _ListFriendRecommend;
}

@freezed
class ListFriendCurent extends FriendEvent with _$ListFriendCurent {
  const factory ListFriendCurent() = _ListFriendCurent;
}

  // const factory FriendEvent.friendCurent() = _FriendCurent;
  // const factory FriendEvent.friendSent() = _FriendSent;