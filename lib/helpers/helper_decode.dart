import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'helper_check.dart';

class HelperDecode {
  static String paramsMapToString(Map<dynamic, dynamic> params) {
    String output = '?';

    for (String key in params.keys) {
      final value = params[key];

      if (!HelperChecker.empty(value)) {
        final String paramData = '$key=$value';

        if (output != '?') {
          output += '&$paramData';
        } else {
          output += paramData;
        }
      }
    }

    return output;
  }

  static String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
