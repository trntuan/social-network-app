import 'package:flutter/material.dart';

class ParamsGalleryImage {
  final String tag;
  final int valueIndex;
  final dynamic urlImage;
  final String? gender;
  final bool isMemory;
  final Function({
    int? index,
    String? url,
    BuildContext? context,
  })? onChangeImage;

  ParamsGalleryImage({
    required this.tag,
    required this.urlImage,
    this.valueIndex = 0,
    this.gender,
    this.onChangeImage,
    this.isMemory = false,
  });
}
