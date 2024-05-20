import '../../../const/const_keys.dart';
import '../../../const/const_path.dart';
import '../../../helpers/helper_api.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/params/param_login.dart';
import '../../../models/params/param_register.dart';
import '../../../models/response/response_message.dart';
import '../../storage/my_data_storage.dart';
import '../../storage/security_storage.dart';
import '../api_service.dart';

Future<ResponseMessage> apiPostRegister(ParamRegister registerParam) async {
  final params = registerParam.toJson();

  ResponseMessage responseMessage = ResponseMessage();

  try {
    final response = await ApiService.singleton.post(
      ConstPathPost.register,
      params,
    );

    responseMessage = HelperApi.handlePostResponse(response);

    if (responseMessage.isSuccess) {
      final data = HelperApi.returnBody(response, true);

      MyDataStorage.singleton.fromMap(data?[ConstKeys.user]);

      await StorageService.writeData();
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

Future<ResponseMessage> apiPostLogin(ParamLogin loginParam) async {
  final params = loginParam.toJson();

  ResponseMessage responseMessage = ResponseMessage();

  try {
    final response = await ApiService.singleton.post(
      ConstPathPost.login,
      params,
    );

    responseMessage = HelperApi.handlePostResponse(response);

    if (responseMessage.isSuccess) {
      final data = HelperApi.returnBody(response, true);

      MyDataStorage.singleton.fromMap(data);

      await StorageService.writeData();
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

// Future<ResponseMessage> apiGetAllMyPost() async {
//   ResponseMessage responseMessage = ResponseMessage();

//   try {
//     final response = await ApiService.singleton.post(
//       ConstPathPost.login,
//       // params,
//     );

//     responseMessage = HelperApi.handlePostResponse(response);

//     if (responseMessage.isSuccess) {
//       final data = HelperApi.returnBody(response, true);

//       MyDataStorage.singleton.fromMap(data);

//       await StorageService.writeData();
//     }

//     return responseMessage;
//   } catch (errors, stackTrace) {
//     HelperLog.logCatchErrors(
//       errors: errors,
//       stackTrace: stackTrace,
//     );
//   }

//   return responseMessage;
// }
