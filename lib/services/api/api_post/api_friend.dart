import '../../../helpers/helper_log.dart';
import '../../../models/response/response_message.dart';
import '../api_service.dart';

Future<ResponseMessage> apiAcctionFriend(
  int? friendId,
  String path,
) async {
  final params = {
    "friend_id": "$friendId",
  };
  final ResponseMessage responseMessage = ResponseMessage();

  try {
    final response = await ApiService.singleton.post(
      path,
      params,
    );
    HelperLog.showLTest('response?.statusCode ${response?.statusCode}');
    if (response?.statusCode == 201 || response?.statusCode == 200) {
      responseMessage.isSuccess = true;
    }

    return responseMessage;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return responseMessage;
}
