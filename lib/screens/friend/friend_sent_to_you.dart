import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/friend/friend_bloc.dart';
import '../../const/const_router.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_color.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/widget_post/widget_post.dart';

class FriendSentToYou extends StatefulWidget {
  const FriendSentToYou({super.key});

  @override
  State<FriendSentToYou> createState() => _FriendSentToYouState();
}

class _FriendSentToYouState extends State<FriendSentToYou> {
  // late final FriendBloc friendbloc = GetIt.instance.get<FriendBloc>();
  late final FriendBloc bloc = GetIt.instance.get<FriendBloc>();

  @override
  void initState() {
    bloc.add(const ListFriendSendToYou());
    // friendbloc.add(const FriendRecommend());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<FriendBloc, FriendState>(builder: (context, state) {
        return Scaffold(
            body: refreshList(
          emptyContent: 'không có lời mời nào đến',
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
                  trailing: SizedBox(
                    width: 300.sp,
                    child: Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.all(5.sp),
                              height: 100.sp,
                              width: 150.sp,
                              decoration: BoxDecoration(
                                color: ThemeColors.skyBlue,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'đồng ý',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              bloc.add(AcceptFriend(item?.userId));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Flexible(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.all(5.sp),
                              height: 100.sp,
                              width: 150.sp,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'từ chối',
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
                      ],
                    ),
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
