import '../../../const/const_path.dart';
import '../../../helpers/helper_log.dart';
import '../../../models/params/param_register.dart';
import '../api_service.dart';

Future<bool> apiPostRegister(ParamRegister registerParam) async {
  final params = registerParam.toJson();

  try {
    final response = await ApiService.singleton.post(
      ConstPathPost.register,
      params,
    );

    return response != null && response.statusCode == 200;
  } catch (errors, stackTrace) {
    HelperLog.logCatchErrors(
      errors: errors,
      stackTrace: stackTrace,
    );
  }

  return false;
}
