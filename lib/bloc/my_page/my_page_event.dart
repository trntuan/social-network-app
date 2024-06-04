part of 'my_page_bloc.dart';

abstract class MyPageEvent {
  const MyPageEvent();
}

@freezed
class InfoMyPage extends MyPageEvent with _$InfoMyPage {
  const factory InfoMyPage() = _InfoMyPage;
}

@freezed
class PostListMyPage extends MyPageEvent with _$PostListMyPage {
  const factory PostListMyPage() = _PostListMyPage;
}
