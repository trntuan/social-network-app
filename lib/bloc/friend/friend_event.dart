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

@freezed
class ListFriendSendToYou extends FriendEvent with _$ListFriendSendToYou {
  const factory ListFriendSendToYou() = _ListFriendSendToYou;
}

@freezed
class ListFriendYouSent extends FriendEvent with _$ListFriendYouSent {
  const factory ListFriendYouSent() = _ListFriendYouSent;
}

@freezed
class AddFriend extends FriendEvent with _$AddFriend {
  const factory AddFriend(int? friendId) = _AddFriend;
}

// accept friends

@freezed
class DeleteFriend extends FriendEvent with _$DeleteFriend {
  const factory DeleteFriend(int? friendId) = _DeleteFriend;
}

// delete friends

@freezed
class AcceptFriend extends FriendEvent with _$AcceptFriend {
  const factory AcceptFriend(int? friendId) = _AcceptFriend;
}



  // const factory FriendEvent.friendCurent() = _FriendCurent;
  // const factory FriendEvent.friendSent() = _FriendSent;