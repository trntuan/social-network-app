import 'package:flutter/material.dart';

import 'my_team.dart';
import 'team_recommend.dart';

class TeamHome extends StatefulWidget {
  const TeamHome({super.key});

  @override
  State<TeamHome> createState() => _TeamHomeState();
}

class _TeamHomeState extends State<TeamHome> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
                text: 'nhóm gợi ý ',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.groups_2_outlined,
                ),
              ),
              Tab(
                text: 'nhóm hiện tại',
                iconMargin: EdgeInsets.only(bottom: 0.0),
                icon: Icon(
                  Icons.groups,
                ),
              ),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          TeamRecommend(),
          MyTeam(),
        ],
      ),
    );
  }
}
