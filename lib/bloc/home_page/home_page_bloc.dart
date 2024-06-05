import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../models/posts/all_posts_model.dart';
import '../../services/api/api_get/api_get_list.dart';
import '../../services/api/api_post/api_like_post.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final controller = ScrollController();

  // void scrollTop() => SchedulerBinding.instance.addPostFrameCallback(
  //       (_) => HelperAction.scrollToTop(
  //         controller: controller,
  //       ),
  //     );

  HomePageBloc() : super(const HomePageState()) {
    on<GetPost>((event, emit) async {
      // get list post
      // final myPosts =
      final data = await apiGetAllPosts();
      // scrollTop();
      emit(state.copyWith(myPosts: data));
    });

    on<GetMorePost>((event, emit) async {
      // get more post
    });

    on<LikePost>(
      (event, emit) async {
        // like post
        final result = await apiLikePost(
          event.postId,
          event.value,
        );

        if (result.isSuccess) {
          final data = await apiGetAllPosts();
          // scrollTop();
          emit(state.copyWith(myPosts: data));

          // add(GetPostDetail(event.postId));
        }
      },
    );
  }
}
