part of 'user_detail_bloc.dart';

abstract class UserDetailEvent {
  const UserDetailEvent();
}

@freezed
class InfoUserDetail extends UserDetailEvent with _$InfoUserDetail {
  const factory InfoUserDetail(String userId) = _InfoUserDetail;
}

@freezed
class PostListUserDetail extends UserDetailEvent with _$PostListUserDetail {
  const factory PostListUserDetail(String userId) = _PostListUserDetail;
}
