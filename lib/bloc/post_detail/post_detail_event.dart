part of 'post_detail_bloc.dart';

abstract class PostDetailEvent {
  const PostDetailEvent();
}

@freezed
class GetPostDetail extends PostDetailEvent with _$GetPostDetail {
  const factory GetPostDetail(
    int? postId,
  ) = _GetPostDetail;
}

@freezed
class SendComment extends PostDetailEvent with _$SendComment {
  const factory SendComment(int? postId, {int? parentCommentId}) = _Send;
}

@freezed
class GetComemnt extends PostDetailEvent with _$GetComemnt {
  const factory GetComemnt(
    int? postId,
  ) = _GetComemnt;
}
