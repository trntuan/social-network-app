import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/friend/friend_bloc.dart';
import '../../const/const_router.dart';
import '../../services/get_it/get_instance.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/widget_post/widget_post.dart';

class YouSent extends StatefulWidget {
  const YouSent({super.key});

  @override
  State<YouSent> createState() => _YouSentState();
}

class _YouSentState extends State<YouSent> {
  // late final FriendBloc friendbloc = GetIt.instance.get<FriendBloc>();
  late final FriendBloc bloc = GetIt.instance.get<FriendBloc>();

  @override
  void initState() {
    bloc.add(const ListFriendYouSent());
    // friendbloc.add(const YouSent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<FriendBloc, FriendState>(builder: (context, state) {
        return Scaffold(
            body: refreshList(
          emptyContent: '',
          // onRefresh: getData,
          // onLoad: () => bloc.add(const GetMorePost()),
          child: ListView.builder(
            itemCount: state.friend.length,
            itemBuilder: (context, index) {
              final item = state.friend[index];
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
                  title: titleUser(
                    onTap: () async {
                      await GetStores.navigator.pushNamed(
                        ConstRouter.userDetail,
                        extra: '${item?.userId}',
                      );
                    },
                    avatar: item?.avatar,
                    name: item?.displayMame,
                  ),
                  subtitle: item?.commonFriends != null
                      ? Text(
                          'có ${item?.commonFriends} bạn chung',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  trailing: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 100.sp,
                      width: 200.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Center(
                        child: Text(
                          'Hủy lời mời',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      bloc.add(DeleteFriend(item?.userId));
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
