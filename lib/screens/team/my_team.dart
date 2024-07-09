import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/team_list/team_list_bloc.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/widget_post/widget_post.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  late final TeamListBloc bloc = GetIt.instance.get<TeamListBloc>();
  @override
  void initState() {
    bloc.add(const GetMyTeamList());
    // friendbloc.add(const FriendRecommend());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child:
          BlocBuilder<TeamListBloc, TeamListState>(builder: (context, state) {
        return Scaffold(
            body: refreshList(
          emptyContent: '',
          // onRefresh: getData,
          // onLoad: () => bloc.add(const GetMorePost()),
          child: ListView.builder(
            itemCount: state.team?.length,
            itemBuilder: (context, index) {
              final item = state.team?[index];
              return Container(
                height: 200.sp,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: ListTile(
                  // leading: titlePost(
                  //   onTap: () {},
                  //   avatar: item?.avatar,
                  //   name: item?.displayMame,
                  // ),
                  title: titleTeam(
                    onTap: () async {
                      // await GetStores.navigator.pushNamed(
                      //   ConstRouter.userDetail,
                      //   extra: '${item?.userId}',
                      // );
                    },
                    // avatar: item?.teamLogo,
                    name: item?.teamTeamName,
                  ),
                  subtitle: item?.memberCount != null
                      ? Text(
                          'có ${item?.memberCount} thành viên',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  trailing: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 100.sp,
                      width: 150.sp,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: const Center(
                        child: Text(
                          'rời nhóm',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      bloc.add(OutTeam("${item?.teamTeamId}"));
                    },
                  ),
                ),
              );
            },
          ),
        ));
      }),
    );
  }
}
