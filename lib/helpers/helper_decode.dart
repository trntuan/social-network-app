import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

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

  static String convertToVietnameseDateTime(String? dateTimeString) {
    // Kiểm tra null cho dateTimeString
    if (dateTimeString == null) {
      // Trả về ngày hiện tại nếu dateTimeString là null
      return DateFormat.yMd('vi').add_Hms().format(DateTime.now());
    }

    // Chuyển đổi chuỗi thành DateTime
    final DateTime dateTime = DateTime.parse(dateTimeString);

    // Định dạng lại ngày tháng năm thành tiếng Việt
    final String formattedDateTime =
        DateFormat.yMd('vi').add_Hms().format(dateTime);

    return formattedDateTime;
  }
}
