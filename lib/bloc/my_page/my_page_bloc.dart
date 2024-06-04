import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/posts/my_posts_model.dart';
import '../../models/user/my_info_model.dart';
import '../../services/api/api_user/api_my_info.dart';

part 'my_page_event.dart';
part 'my_page_state.dart';
part 'my_page_bloc.freezed.dart';

@injectable
class MyPageBloc extends Bloc<MyPageEvent, MyPageState> {
  MyPageBloc() : super(const MyPageState()) {
    on<InfoMyPage>((event, emit) async {
      final result = await apiGetMyInfo();

      if (result != null) {
        emit(MyPageState(myInfo: result));
      }
    });

    on<PostListMyPage>((event, emit) async {
      final data = await apiGetAllMyPost();

      emit(state.copyWith(myPosts: data));
    });
  }
}
