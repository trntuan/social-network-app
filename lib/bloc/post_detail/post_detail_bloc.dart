import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/posts/comment_model.dart';
import '../../models/posts/post_detail_model.dart';
import '../../services/api/api_get/api_get_detail.dart';
import '../../services/api/api_get/api_get_list.dart';
import '../../services/api/api_post/api_comment.dart';
import '../../services/api/api_post/api_like_post.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';
part 'post_detail_bloc.freezed.dart';

@injectable
class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  TextEditingController textEditingController = TextEditingController();

  PostDetailBloc() : super(const PostDetailState()) {
    on<GetPostDetail>(
      (event, emit) async {
        // get post detail
        final data = await apiGetPostDetail(event.postId);
        emit(state.copyWith(postDetail: data));

        add(GetComemnt(event.postId));
      },
    );

    on<SendComment>(
      (event, emit) async {
        // send comment
        if (textEditingController.text.isEmpty) {
          // show dialog
        } else {
          final result = await apiPostComment(
            event.postId,
            textEditingController.text,
          );

          if (result.isSuccess) {
            textEditingController.clear();
            add(GetPostDetail(state.postDetail?.postPostId));
            add(GetComemnt(event.postId));
          }
          // send comment
        }
      },
    );

    on<GetComemnt>(
      (event, emit) async {
        // get comment
        final data = await apiGetComment(
          postId: event.postId,
        );
        emit(state.copyWith(comments: data));
      },
    );

    // apiLikePost
    on<LikePost>(
      (event, emit) async {
        // like post
        final result = await apiLikePost(
          event.postId,
          event.value,
        );

        if (result.isSuccess) {
          add(GetPostDetail(state.postDetail?.postPostId));
        }
      },
    );
  }
}
