import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/user_detail/user_detail_bloc.dart';
import '../../const/const_router.dart';
import '../../const/const_value.dart';
import '../../helpers/helper_action.dart';
import '../../helpers/helper_check.dart';
import '../../helpers/helper_decode.dart';
import '../../models/params/param_open_chat.dart';
import '../../models/params/params_gallery_image.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_color.dart';
import '../../theme/theme_image.dart';
import '../../widgets/custom_appbar/button_appbar.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/photo_grid.dart';
import '../../widgets/widget_post/widget_post.dart';

class UserPageScreen extends StatefulWidget {
  final String userId;
  const UserPageScreen({required this.userId, super.key});

  @override
  State<UserPageScreen> createState() => _UserPageScreenState();
}

class _UserPageScreenState extends State<UserPageScreen> {
  late final UserDetailBloc bloc = GetIt.instance.get<UserDetailBloc>();

  @override
  void initState() {
    bloc.add(InfoUserDetail(widget.userId));
    bloc.add(PostListUserDetail(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              // title: 'trang cá nhân',
              iconLeft: IconAppbar.back,
            ),
            body: state.userInfo == null
                ? const SizedBox()
                : SizedBox(
                    height: 1.sh,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          avatar(state),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.userInfo?.userDisplayName ?? '',
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Text(
                                    '${state.userInfo?.friendCount ?? 0} bạn bè',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1.sw,
                            height: 20.sp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          userInfo(state),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {
                                await GetStores.navigator
                                    .pushNamed<ParamOpenChat>(
                                  ConstRouter.chat,
                                  extra: ParamOpenChat(
                                    "${state.userInfo?.userUserId}",
                                    state.userInfo?.userDisplayName,
                                  ),
                                );
                                // bloc.add(const EditInfo());
                              },
                              child: Container(
                                width: 0.8.sw,
                                decoration: BoxDecoration(
                                  color: ThemeColors.blue,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                height: 100.sp,
                                child: const Center(
                                  child: Text(
                                    "nhắn tin",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1.sw,
                            height: 20.sp,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              // controller: bloc.controller,
                              itemCount: state.userPosts?.length ?? 0,
                              // itemCount: 50,
                              itemBuilder: (context, index) {
                                final item = state.userPosts?[index];
                                return InkWell(
                                  onTap: () async {
                                    await GetStores.navigator
                                        .pushNamed<int>(
                                      ConstRouter.postDetail,
                                      extra: item?.postId,
                                    )
                                        ?.then((value) {
                                      // getData();
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 20.sp,
                                      bottom: 20.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  titlePost(
                                                    onTap: () {},
                                                    avatar: item?.avatar,
                                                    name: item?.displayName,
                                                  ),
                                                  const Icon(
                                                    Icons.info,
                                                    size: 30,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.sp),
                                                child: Text(
                                                  HelperDecode
                                                      .convertToVietnameseDateTime(
                                                          item?.createdDate
                                                              .toString()),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.sp),
                                                child: ExpandableText(
                                                    "${item?.content}"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!HelperChecker.empty(
                                            item?.imageUrls))
                                          Flexible(
                                            child: AlbumPost(
                                              images: HelperAction.getImages(
                                                  item?.imageUrls ?? []),
                                              onImageTap: (imageUrl) {
                                                GetStores.navigator
                                                    .goGalleryImage(
                                                  ParamsGalleryImage(
                                                    tag: 'image ',
                                                    urlImage: imageUrl,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Số lượt thích: ${item?.credibilityCount}',
                                                    style: TextStyle(
                                                      fontSize: 40.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    padding: EdgeInsets.only(
                                                      bottom: 10.sp,
                                                    ),
                                                    onPressed: () {
                                                      // bloc.add(
                                                      //   LikePost(
                                                      //     item?.postId,
                                                      //     value: item?.likeValue == ConstValue.like
                                                      //         ? ConstValue.unlike
                                                      //         : ConstValue.like,
                                                      //   ),
                                                      // );
                                                    },
                                                    icon: Icon(
                                                      Icons.thumb_up_alt,
                                                      color: item?.likeValue ==
                                                              ConstValue.like
                                                          ? Colors.blue
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30.sp,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Số lượt bình luận: ${item?.commentCount}',
                                                    style: TextStyle(
                                                      fontSize: 40.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    padding: EdgeInsets.only(
                                                      bottom: 5.sp,
                                                    ),
                                                    onPressed: () {
                                                      // bloc.add(
                                                      //   LikePost(
                                                      //     postId: item?.id ?? '',
                                                      //   ),
                                                      // );
                                                    },
                                                    icon: const Icon(
                                                      // item?.isLike == true
                                                      //     ? Icons.favorite
                                                      //     :
                                                      Icons.comment,
                                                      color:
                                                          //  item?.isLike == true
                                                          //     ? Colors.red
                                                          //     :
                                                          Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Padding userInfo(UserDetailState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "THÔNG TIN CÁ NHÂN",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      "Giới tính: ${state.userInfo?.userGender == 0 ? 'nam' : "nữ"}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                if (!HelperChecker.empty(state.userInfo?.userLocation))
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Flexible(
                        child: Text(
                          "Địa chỉ: ${state.userInfo?.userLocation} ",
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20.sp,
                ),
                if (!HelperChecker.empty(state.userInfo?.userEmail))
                  Row(
                    children: [
                      const Icon(Icons.email),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Flexible(
                        child: Text(
                          maxLines: 2,
                          ' Thông tin liên hệ: ${state.userInfo?.userEmail}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  children: [
                    const Icon(Icons.cake),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        "ngày sinh: ${state.userInfo?.userDateOfBirth} ",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                if (!HelperChecker.empty(state.userInfo?.userInterests))
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Sở thích: ${state.userInfo?.userInterests}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container avatar(UserDetailState state) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ImageAssets.logoApp,
        ),

        // shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 180.sp),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipOval(
            child: Image.network(
              HelperAction.avatarDefault(state.userInfo?.userAvatar),
              fit: BoxFit.cover,
              width: 300.sp,
              height: 300.sp,
            ),
          ),
        ),
      ),
    );
  }
}
