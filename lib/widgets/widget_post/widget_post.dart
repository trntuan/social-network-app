import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/helper_action.dart';

Row titlePost({
  Function()? onTap,
  String? avatar,
  String? name,
}) {
  return Row(
    children: [
      InkWell(
        onTap: onTap,
        child: ClipOval(
          child: Image.network(
            HelperAction.avatarDefault(avatar),
            fit: BoxFit.cover,
            width: 120.sp,
            height: 120.sp,
          ),
        ),
      ),
      Text(
        name ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
