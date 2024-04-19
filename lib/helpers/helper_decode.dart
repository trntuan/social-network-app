import 'helper_check.dart';

class HelperDecode {
  static String paramsMapToString(Map<dynamic, dynamic> params) {
    String output = '?';

    for (String key in params.keys) {
      final value = params[key];

      if (!HelperCheck.empty(value)) {
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
}
