import 'package:flutter/material.dart';

import '../../const/const_router.dart';
import '../../services/get_it/get_instance.dart';
import '../friend/friend_home.dart';
import '../home_page/home_page.dart';
import '../setting/setting_screen.dart';
import 'custom_appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarHome(
        onTapAction: () {
          GetStores.navigator.pushNamed(ConstRouter.messages);
        },
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.home_filled,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.group_outlined,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.groups,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications_none_outlined,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomePage(),
          FriendHome(),
          Center(
            child: Text("nhóm"),
          ),
          Center(
            child: Text("thông báo"),
          ),
          SettingScreen(),
        ],
      ),
    );
  }
}
