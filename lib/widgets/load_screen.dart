import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showLoadScreen({
  required Widget child,
  bool isload = false,
  bool loadIos = false,
  bool isTransparent = false,
}) {
  return Stack(
    children: [
      child,
      Visibility(
        visible: isload,
        child: const ViewLoading(),
      )
    ],
  );
}

class ViewLoading extends StatelessWidget {
  final bool loadIos;
  const ViewLoading({
    super.key,
    this.loadIos = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: Center(
        child: loadIos
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(
                color: Colors.blue,
              ),
      ),
    );
  }
}
