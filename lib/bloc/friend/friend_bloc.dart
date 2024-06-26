import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../models/posts/friend_recommend_model.dart';
import '../../services/api/api_get/api_get_list.dart';
import '../../services/api/api_post/api_friend.dart';

part 'friend_event.dart';
part 'friend_state.dart';
part 'friend_bloc.freezed.dart';

@injectable
class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(const FriendState()) {
    on<ListFriendRecommend>(
      (event, emit) async {
        final data = await apiGetFriendRecommend();
        emit(
          state.copyWith(friend: data),
        );
      },
    );

    on<ListFriendCurent>(
      (event, emit) async {
        final data = await apiGetMyFriend();
        emit(
          state.copyWith(friend: data),
        );
      },
    );

    on<ListFriendSendToYou>(
      (event, emit) async {
        final data = await apiGetFriendSendToYou();
        emit(
          state.copyWith(friend: data),
        );
      },
    );

    on<AddFriend>(
      (event, emit) async {
        final result = await apiAddFriend(event.friendId);

        if (result.isSuccess) {
          add(const ListFriendRecommend());
        }
      },
    );

    on<ListFriendYouSent>(
      (event, emit) async {
        final data = await apiGetFriendYouSent();
        emit(
          state.copyWith(friend: data),
        );
      },
    );
  }
}
