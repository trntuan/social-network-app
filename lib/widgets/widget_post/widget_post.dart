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

Row titleUser({
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
      Flexible(
        child: Text(
          name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Row titleTeam({
  Function()? onTap,
  String? avatar,
  String? name,
}) {
  return Row(
    children: [
      InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.sp),
          child: Image.network(
            HelperAction.defaultTeam(avatar),
            fit: BoxFit.cover,
            width: 120.sp,
            height: 120.sp,
          ),
        ),
      ),
      SizedBox(
        width: 20.sp,
      ),
      Flexible(
        child: Text(
          name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
