import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/home_page/home_page_bloc.dart';
import '../../const/const_router.dart';
import '../../const/const_value.dart';
import '../../helpers/helper_action.dart';
import '../../helpers/helper_check.dart';
import '../../helpers/helper_decode.dart';
import '../../models/params/params_gallery_image.dart';
import '../../models/posts/all_posts_model.dart';
import '../../services/get_it/get_instance.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/load_screen.dart';
import '../../widgets/photo_grid.dart';
import '../../widgets/widget_post/widget_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageBloc bloc = GetIt.instance.get<HomePageBloc>();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() {
    bloc.add(const GetPost());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return showLoadScreen(
            isload: state.isLoading,
            child: Scaffold(
                body: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // GetInstance.navigator.pop();
                      await GetStores.navigator
                          .pushNamed(
                        ConstRouter.postNewletter,
                      )
                          ?.then((value) {
                        getData();
                      });
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8.sw,
                            height: 120.sp,
                            margin: EdgeInsets.only(
                              left: 50.sp,
                              right: 20.sp,
                              top: 20.sp,
                              bottom: 20.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Bạn có muốn đăng gì ?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.post_add,
                            size: 80.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: refreshList(
                      emptyContent: 'bạn đã xem hết bài viết',
                      onRefresh: getData,
                      onLoad: () => bloc.add(const GetMorePost()),
                      child: ListView.builder(
                        // reverse: true,
                        controller: bloc.controller,
                        itemCount: state.myPosts.length,
                        itemBuilder: (context, index) {
                          final item = state.myPosts[index];
                          return InkWell(
                            onTap: () async {
                              await GetStores.navigator
                                  .pushNamed<int>(
                                ConstRouter.postDetail,
                                extra: item?.postPostId,
                              )
                                  ?.then((value) {
                                getData();
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
                              child: postDetail(item),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  Column postDetail(PostListModel? item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titlePost(
                    onTap: () async {
                      await GetStores.navigator.pushNamed(
                        ConstRouter.userDetail,
                        extra: '${item?.postUserPost}',
                      );
                    },
                    avatar: item?.userAvatar,
                    name: item?.userDisplayName,
                  ),
                  const Icon(
                    Icons.info,
                    size: 30,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Text(
                  HelperDecode.convertToVietnameseDateTime(
                      item?.postCreatedDate.toString()),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: ExpandableText("${item?.postContent}"),
              ),
            ],
          ),
        ),
        if (!HelperChecker.empty(item?.postImageUrl))
          Flexible(
            child: AlbumPost(
              images: HelperAction.getImages(item?.postImageUrl ?? []),
              onImageTap: (imageUrl) {
                GetStores.navigator.goGalleryImage(
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
                      bloc.add(
                        LikePost(
                          item?.postPostId,
                          value: item?.likeValue == ConstValue.like
                              ? ConstValue.unlike
                              : ConstValue.like,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.thumb_up_alt,
                      color: item?.likeValue == ConstValue.like
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
    );
  }
}
