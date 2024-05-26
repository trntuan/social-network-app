import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../theme/theme_color.dart';

Widget avatarGallery({
  required List<String?> images,
  double? height,
  String? sex,
  bool isAvatar = true,
  bool disableGestures = true,
  PageController? pageController,
  void Function(int)? onPageChanged,
  void Function()? onPreviousPressed,
  void Function()? onNextPressed,
  void Function()? onTap,
}) =>
    SizedBox(
      height: 1000.sp,
      child: GestureDetector(
        onTap: onTap,
        child: PhotoViewGallery.builder(
          pageController: pageController,
          itemCount: images.length,
          onPageChanged: onPageChanged,
          loadingBuilder: (context, event) => const Center(
            child: CircularProgressIndicator(
              color: ThemeColors.brown51,
            ),
          ),
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              initialScale: PhotoViewComputedScale.covered,
              imageProvider: NetworkImage(images[index] ?? ''),
              disableGestures: disableGestures,
              heroAttributes: PhotoViewHeroAttributes(
                tag: index,
              ),
            );
          },
        ),
      ),
    );
