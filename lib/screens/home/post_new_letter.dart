import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/post_new_letter/post_new_letter_bloc.dart';
import '../../helpers/helper_check.dart';
import '../../widgets/custom_appbar/button_appbar.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/custom_appbar/custom_text_form.dart';
import '../../widgets/custom_button.dart';

class Private {
  final int id;
  final String name;

  const Private(this.id, this.name);
}

const List<Private> getLanguages = <Private>[
  Private(0, 'Công khai'),
  Private(1, 'Bạn bè'),
  Private(2, 'chỉ mình tôi'),
];

class PostNewLetter extends StatefulWidget {
  const PostNewLetter({super.key});

  @override
  State<PostNewLetter> createState() => PposNneLletterState();
}

class PposNneLletterState extends State<PostNewLetter> {
  late final PostNewLetterBloc bloc = GetIt.instance.get<PostNewLetterBloc>();
  int dropdownValue = getLanguages.first.id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<PostNewLetterBloc, PostNewLetterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              title: 'Tạo bài viết mới',
              iconLeft: IconAppbar.back,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: state.listImage.asMap().entries.map(
                      (entry) {
                        final int index = entry.key;
                        // final File? image = entry.value;
                        return Flexible(
                          child: GestureDetector(
                            onTap: () {
                              // Change the image at index
                              bloc.add(
                                SelectImage(
                                  index,
                                ),
                              );
                            },
                            child: _showAvatar(
                              media: state.listImage[index],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.sp),
                    child: CustomTextForm(
                      maxLength: 5000,
                      buildContext: context,
                      maxLines: 8,
                      controller: bloc.formTextController,
                      hintText: 'Nhập nội dung đăng',
                    ),
                  ),
                  DropdownButton(
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    value: dropdownValue,
                    // value: dropdownValue,

                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    items: getLanguages.map((Private lang) {
                      return DropdownMenuItem<int>(
                        value: lang.id,
                        child: Text(lang.name),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        dropdownValue = val!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 100.sp,
                      left: 55.sp,
                      right: 55.sp,
                    ),
                    child: buttonInkwell(
                      marginBtn: EdgeInsets.zero,
                      paddingBtn: EdgeInsets.zero,
                      title: 'đăng bài viết',
                      onPressed: () {
                        bloc.add(
                          Post(
                            typePost: dropdownValue,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _showAvatar({
  required File? media,
}) {
  // check isEmpty
  final bool isEmpty = HelperChecker.empty(media);

  // if not emty

  // show item empty
  return Container(
    width: 300.sp,
    height: 300.sp,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
    ),
    child: isEmpty
        ? const Icon(
            Icons.add_a_photo,
            color: Colors.black,
          )
        : Image(
            image: FileImage(media!),
            fit: BoxFit.cover,
          ),
  );
}
