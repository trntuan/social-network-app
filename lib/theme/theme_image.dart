import 'package:flutter/material.dart';

class LocalPath {
  static const imageApp = 'assets/image_app';
  static const imageIcon = 'assets/image_icon';
}

class LocalAssets {
  static AssetImage imageApp(String assetName) =>
      AssetImage('${LocalPath.imageApp}/$assetName');

  static AssetImage imageIcon(String assetName) =>
      AssetImage('${LocalPath.imageIcon}/$assetName');
}

class ImageAssets {
  // icon tab
  static final iconApp = LocalAssets.imageApp('icon_app.png');
  static final logoApp = LocalAssets.imageApp('logo_app.png');
}
