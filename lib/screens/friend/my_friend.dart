import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/friend/friend_bloc.dart';
import '../../theme/theme_color.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/widget_post/widget_post.dart';

class MyFriend extends StatefulWidget {
  const MyFriend({super.key});

  @override
  State<MyFriend> createState() => _MyFriendState();
}

class _MyFriendState extends State<MyFriend> {
  // late final FriendBloc friendbloc = GetIt.instance.get<FriendBloc>();
  late final FriendBloc bloc = GetIt.instance.get<FriendBloc>();

  @override
  void initState() {
    bloc.add(const ListFriendCurent());
    // friendbloc.add(const MyFriend());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<FriendBloc, FriendState>(builder: (context, state) {
        return Scaffold(
            body: refreshList(
          emptyContent: 'bạn chưa có bạn bè',
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
                  title: titlePost(
                    onTap: () {},
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
                      width: 270.sp,
                      decoration: BoxDecoration(
                        color: ThemeColors.blue,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: Icon(
                                Icons.chat_bubble_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Flexible(
                              child: Text(
                                'nhắn tin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      // bloc.add(FriendCurent());
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
