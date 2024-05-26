part of 'home_page_bloc.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

@freezed
class GetPost extends HomePageEvent with _$GetPost {
  const factory GetPost() = _GetPost;
}

@freezed
class GetMorePost extends HomePageEvent with _$GetPost {
  const factory GetMorePost() = _GetMorePost;
}

@freezed
class LikePost extends HomePageEvent with _$LikePost {
  const factory LikePost(int? postId, {int? value}) = _LikePost;
}
