import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../helpers/helper_log.dart';
import '../../models/posts/all_posts_model.dart';
import '../../services/api/api_get/api_get_list.dart';
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
      HelperLog.showLTest(data.length.toString());
      // scrollTop();
      emit(state.copyWith(myPosts: data));
    });

    on<GetMorePost>((event, emit) async {
      // get more post
    });

    // await event.map(
    //   getPost: (e) async {
    //     // get list post
    //     await apiGetAllMyPost();
    //   },
    //   getMorePost: (e) {
    //     // get more post
    //   },
    // );
  }
}
