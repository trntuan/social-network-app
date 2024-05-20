import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../models/posts/my_posts_model.dart';
import '../../services/api/api_post/api_my_post.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<GetPost>((event, emit) async {
      // get list post
      // final myPosts =
      await apiGetAllMyPost();
      // emit(state.copyWith(myPosts: myPosts));
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
