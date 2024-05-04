import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../const/const_router.dart';
import '../../models/params/param_setting.dart';
import '../../services/get_it/get_instance.dart';
import '../../services/storage/security_storage.dart';
import '../../theme/theme_text.dart';
import '../../widgets/dialog_popup.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final listItemSetting = <ParamSetting>[
    ParamSetting(
      name: 'Trang Cá nhân',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'quyền riêng tư',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'bảo mật',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'hỗ trợ',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'thông tin về chúng tôi',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'đăng xuất',
      onTap: () async {
        await dialogPopup(
          title: 'cảnh báo',
          msg: 'bạn có chắc chắn muốn đăng xuất ?',
          actionAccept: () {
            StorageService.deleteData();
            GetInstance.navigator.pushReplacementNamed(ConstRouter.login);
          },
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Text(
                    'Setting',
                    style: ThemeText.size80BlackBold,
                  ),
                ),
              ],
            ),
            ...listItemSetting.map((item) => GFListTile(
                  selected: true,
                  autofocus: true,
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  shadow: BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                  color: Colors.white,
                  title: Text('${item.name}', style: ThemeText.size40Black),
                  onTap: item.onTap,
                )),
          ],
        ),
      ),
    );
  }
}
