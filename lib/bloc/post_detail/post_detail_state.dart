part of 'post_detail_bloc.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    PostDetailModel? postDetail,
    List<CommentsModel?>? comments,
  }) = _PostDetailState;
}
