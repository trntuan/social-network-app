import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/helper_check.dart';
import '../services/navigator/config_navigator.dart';
import '../theme/theme_text.dart';

Future<T?> dialogPopup<T>({
  BuildContext? buildContext,
  String? msg,
  String? title,
  String? titleAccept,
  String? titleDeny,
  bool barrierDismissible = true,
  bool useBackScreen = false,
  bool useDeny = true,
  bool msgSize40 = false,
  bool hasCallAction = false,
  bool isCloseAfterAccept = true,
  bool isCloseAfterDeny = true,
  T? valueAccept,
  T? valueDeny,
  Function()? actionAccept,
  Function()? actionDeny,
  Function(T?)? onClosed,
}) async {
  buildContext ??= ConfigNavigator.navigatorKey.currentContext;
  if (buildContext == null) {
    return null;
  }

  /// ======== Title popup =========
  final _title = HelperChecker.empty(title)
      ? null
      : Text(
          '$title',
          style: ThemeText.size50Black,
        );

  /// ======== content popup =========
  final _content = Text(
    '$msg',
    style: ThemeText.size40Dark31,
  );

  /// ====== acction accept popup  =========
  final _actionAccept = CupertinoDialogAction(
    child: Text(titleAccept ?? 'Đồng ý', style: ThemeText.size44Blue),
    onPressed: () {
      if (!hasCallAction) {
        actionAccept?.call();
      }
      if (isCloseAfterAccept) {
        Navigator.pop(buildContext!, valueAccept); // turn off pop
      }
    },
  );

  /// ====== acction  Cancel popup  =========
  final _actionDeny = CupertinoDialogAction(
    child: Text(
      titleDeny ?? 'hủy',
      style: ThemeText.size44Blue,
    ),
    onPressed: () {
      actionDeny?.call();

      if (isCloseAfterDeny) {
        Navigator.pop(buildContext!, valueDeny);
      }
    },
  );

  /// ======== Actions =========
  final _actions = [
    /// ====== acction accept popup  =========
    _actionAccept,

    /// ====== acction  Cancel popup  =========
    if (useDeny) _actionDeny,
  ];

  /// ======== Show Dialog Popup =========
  return await showDialog<T>(
    context: buildContext,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return CupertinoAlertDialog(
        /// ======== Title popup =========
        title: _title,

        /// ======== Content popup =========
        content: _content,

        /// ======== Actions =========
        actions: _actions,
      );
    },
  ).then(
    (value) {
      if (hasCallAction) {
        actionAccept?.call();
      }
      onClosed?.call(value);

      return value;
    },
  );
}
