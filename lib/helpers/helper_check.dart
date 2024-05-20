import '../extension/iterable_extension.dart';
import 'helper_decode.dart';
import 'helper_log.dart';

class HelperChecker {
  static bool equal(item1, item2) {
    try {
      if (item1 is Map && item2 is Map) {
        return HelperDecode.paramsMapToString(item1) ==
            HelperDecode.paramsMapToString(item2);
      }
    } catch (errors, stackTrace) {
      HelperLog.logCatchErrors(
        message: 'getUserListApi',
        errors: errors,
        stackTrace: stackTrace,
      );
    }
    return '$item1' == '$item2';
  }

  static bool empty(dynamic item) {
    return item == null ||
        item == {} ||
        ((item is String || item is Iterable || item is Map) && item.isEmpty) ||
        ((item is Iterable) && item.isListNull) ||
        equal(item, 'null') ||
        equal(item, '');
  }
}
