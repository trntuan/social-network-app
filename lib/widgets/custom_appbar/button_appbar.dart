import 'package:flutter/material.dart';
import '../../services/get_it/get_instance.dart';

enum IconAppbar {
  back,
  close,
  setting,
}

Widget buttonAppbar({
  required IconAppbar icon,
  Function()? onTap,
}) {
  switch (icon) {
    case IconAppbar.back:
      return TextButton(
        onPressed: () {
          GetStores.navigator.pop();
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
          size: 30,
        ),
      );
    case IconAppbar.close:
      return TextButton(
        onPressed: () {
          GetStores.navigator.pop();
        },
        child: const Icon(
          Icons.close_rounded,
          color: Colors.white,
          size: 50,
        ),
      );
    case IconAppbar.setting:
      return TextButton(
        onPressed: onTap ?? () {},
        child: const Icon(
          Icons.settings_rounded,
          color: Colors.black,
        ),
      );

    default:
      return TextButton(
        onPressed: () {
          GetStores.navigator.pop();
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      );
  }
}
