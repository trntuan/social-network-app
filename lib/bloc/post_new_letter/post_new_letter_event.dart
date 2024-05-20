part of 'post_new_letter_bloc.dart';

abstract class PostNewLetterEvent {
  const PostNewLetterEvent();
}

@freezed
class SelectImage extends PostNewLetterEvent with _$SelectImage {
  const factory SelectImage(int index) = _SelectImage;
}

@freezed
class Post extends PostNewLetterEvent with _$Post {
  const factory Post({
    required int typePost,
  }) = _Post;
}
