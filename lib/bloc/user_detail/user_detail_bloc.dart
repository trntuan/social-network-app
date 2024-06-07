import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../models/posts/my_posts_model.dart';
import '../../models/user/my_info_model.dart';
import '../../services/api/api_user/api_user.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

@injectable
class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(const UserDetailState()) {
    on<InfoUserDetail>((event, emit) async {
      final result = await apiGetUserDetail(event.userId);

      if (result != null) {
        emit(state.copyWith(userInfo: result));
      }
    });

    on<PostListUserDetail>((event, emit) async {
      final data = await apiGetAllUserPost(event.userId);

      emit(state.copyWith(userPosts: data));
    });
  }
}
