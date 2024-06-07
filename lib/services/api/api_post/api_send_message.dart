import '../../../const/const_path.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/response/response_message.dart';
import '../../storage/my_data_storage.dart';
import '../api_service.dart';

Future<ResponseMessage> apiSendMesssage({
  String? chatId,
  String? messsage,
}) async {
  final params = {
    "chatId": chatId,
    "senderId": '${MyDataStorage.singleton.userId}',
    "messageText": messsage
  };
  final ResponseMessage responseMessage = ResponseMessage();

  try {
    final response =
        await ApiService.singleton.post(ConstPathPost.sendMessage, params);
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
