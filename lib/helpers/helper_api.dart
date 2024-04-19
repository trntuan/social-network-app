import '../const/const_app.dart';

class HelperApi {
  static Uri buildUri(
    String path, [
    Map<String, dynamic>? params,
  ]) {
    const authority = ConstApp.apiAuthority;
    final apiPath = '${ConstApp.apiPath}$path';

    Uri uri;
    // if (HelperChecker.equal(ConstConfig.appType, Environment.stgvLive)) {
    //   uri = Uri.https(authority, apiPath, params);
    // } else {
    uri = Uri.http(authority, apiPath, params);
    // }

    return uri;
  }
}
