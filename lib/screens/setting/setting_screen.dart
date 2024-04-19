import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../const/const_router.dart';
import '../../models/params/param_setting.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final listItemSetting = <ParamSetting>[
    ParamSetting(
      name: 'Account',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'Privacy',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'Security',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'Help',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'About',
      onTap: () {
        // ConfigNavigator().pushNamed('account');
      },
    ),
    ParamSetting(
      name: 'Log out',
      onTap: () {
        GetInstance.navigator.pushNamed(ConstRouter.login);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'menu',
          style: ThemeText.size80BlackBold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 55),
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
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
    );
  }
}
