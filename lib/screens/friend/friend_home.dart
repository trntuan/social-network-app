import 'package:flutter/material.dart';

import 'friend_recommend.dart';

class FriendHome extends StatefulWidget {
  const FriendHome({super.key});

  @override
  State<FriendHome> createState() => _FriendHomeState();
}

class _FriendHomeState extends State<FriendHome> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'gợi ý ',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                text: 'lời mời',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.person_add_alt,
                ),
              ),
              Tab(
                text: 'đã gửi',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.person_add,
                ),
              ),
              Tab(
                text: 'bạn bè hiện tại',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.people_alt,
                ),
              ),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          FriendRecommend(),
          FriendRecommend(),
          FriendRecommend(),
          FriendRecommend(),
        ],
      ),
    );
  }
}
