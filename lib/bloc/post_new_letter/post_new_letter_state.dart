part of 'post_new_letter_bloc.dart';

@freezed
class PostNewLetterState with _$PostNewLetterState {
  const factory PostNewLetterState({
    @Default([null, null, null]) List<File?> listImage,
  }) = _PostNewLetterState;
}
