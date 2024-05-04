import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../const/const_keys.dart';
import '../../const/const_tag.dart';
import '../../helpers/helper_log.dart';
import 'my_data_storage.dart';

class StorageService {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  static Future<bool> writeData() async {
    try {
      /// save device id

      /// save token
      // await storage.write(
      //   key: KeyLogin.token,
      //   value: GetStores.loginModel.token,
      // );

      /// save user code
      await storage.write(
        key: ConstUserKeys.email,
        value: MyDataStorage.singleton.email,
      );

      /// save password
      await storage.write(
        key: ConstUserKeys.password,
        value: MyDataStorage.singleton.password,
      );

      final allData = await storage.readAll();

      HelperLog.logInfo(
        tag: ConstTag.flutterSecureStorage,
        'write all Data :: ${allData}',
      );

      return true;
    } catch (errors) {
      HelperLog.logCatchErrors(
        tag: ConstTag.flutterSecureStorage,
        message: 'writeData',
        errors: errors,
      );
    }
    // default return
    return false;
  }

  static Future<bool> deleteData() async {
    try {
      /// save device id

      /// save user code
      await storage.write(
        key: ConstUserKeys.email,
        value: '',
      );

      /// save password
      await storage.write(
        key: ConstUserKeys.password,
        value: '',
      );

      final allData = await storage.readAll();

      HelperLog.logInfo(
        tag: ConstTag.flutterSecureStorage,
        'write all Data :: ${allData}',
      );

      return true;
    } catch (errors) {
      HelperLog.logCatchErrors(
        tag: ConstTag.flutterSecureStorage,
        message: 'writeData',
        errors: errors,
      );
    }
    // default return
    return false;
  }

  static Future<MyDataStorage?> readData() async {
    try {
      final allData = await storage.readAll();
      if (allData.values.isNotEmpty) {
        // get password
        MyDataStorage.singleton.password = allData[ConstUserKeys.password];

        // get email
        MyDataStorage.singleton.email = allData[ConstUserKeys.email];
      }

      HelperLog.logInfo(
        tag: ConstTag.flutterSecureStorage,
        'read all Data :: $allData',
      );

      return MyDataStorage.singleton;
    } catch (errors) {
      HelperLog.logCatchErrors(
        tag: ConstTag.flutterSecureStorage,
        message: 'readData',
        errors: errors,
      );
    }
    return null;
  }
}
