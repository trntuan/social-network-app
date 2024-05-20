import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../services/api/api_post/api_my_post.dart';
import '../../widgets/dialog_popup.dart';

part 'post_new_letter_bloc.freezed.dart';
part 'post_new_letter_event.dart';
part 'post_new_letter_state.dart';

@injectable
class PostNewLetterBloc extends Bloc<PostNewLetterEvent, PostNewLetterState> {
  TextEditingController formTextController = TextEditingController();
  PostNewLetterBloc() : super(const PostNewLetterState()) {
    on<SelectImage>(
      (event, emit) async {
        final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );

        if (image != null) {
          // save image
          final imageFile = File(image.path);

          final List<File?> listImage = List<File?>.from(state.listImage);

          listImage[event.index] = imageFile;
          emit(PostNewLetterState(listImage: listImage));
        }
      },
    );

    on<Post>(
      (event, emit) async {
        // post
        if (formTextController.text.isEmpty) {
          await dialogPopup(
            title: 'Thông báo',
            msg: 'Vui lòng nhập nội dung bài viết',
            useDeny: false,
          );
        } else {
          final value = await apiPostNewLetter(
            formTextController.text,
            '${event.typePost}',
            image1: state.listImage[0],
            image2: state.listImage[1],
            image3: state.listImage[2],
          );

          if (value) {
            // success

            await dialogPopup(
              title: 'Thông báo',
              msg: 'đăng thành công',
              useDeny: false,
            );
          } else {
            // fail

            await dialogPopup(
              title: 'Thông báo',
              msg: 'đăng Thất bại',
              useDeny: false,
            );
          }
        }
      },
    );
  }
}
