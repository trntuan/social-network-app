import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../const/const_path.dart';
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
        final result = await apiAcctionFriend(
          event.friendId,
          ConstPathPost.addFriend,
        );

        if (result.isSuccess) {
          add(const ListFriendRecommend());
        }
      },
    );

    on<DeleteFriend>(
      (event, emit) async {
        final result = await apiAcctionFriend(
          event.friendId,
          ConstPathPost.cancelFriend,
        );

        if (result.isSuccess) {
          add(const ListFriendYouSent());
        }
      },
    );

    on<AcceptFriend>(
      (event, emit) async {
        final result = await apiAcctionFriend(
          event.friendId,
          ConstPathPost.confirmFriend,
        );

        if (result.isSuccess) {
          add(const ListFriendSendToYou());
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
