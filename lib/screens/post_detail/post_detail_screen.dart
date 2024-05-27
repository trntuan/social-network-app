import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/post_detail/post_detail_bloc.dart';
import '../../const/const_value.dart';
import '../../helpers/helper_action.dart';
import '../../helpers/helper_check.dart';
import '../../helpers/helper_decode.dart';
import '../../models/params/params_gallery_image.dart';
import '../../models/posts/post_detail_model.dart';
import '../../services/get_it/get_instance.dart';
import '../../theme/theme_color.dart';
import '../../widgets/custom_appbar/button_appbar.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/custom_appbar/custom_text_form.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/photo_grid.dart';
import '../../widgets/widget_post/widget_post.dart';

class PostDetailScreen extends StatefulWidget {
  final int? postId;
  const PostDetailScreen({required this.postId, super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late final PostDetailBloc bloc = GetIt.instance.get<PostDetailBloc>();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() {
    bloc.add(GetPostDetail(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Bài viết',
          iconLeft: IconAppbar.back,
        ),
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocBuilder<PostDetailBloc, PostDetailState>(
            builder: (context, state) {
              final item = state.postDetail;
              return Stack(
                children: [
                  SizedBox(
                    height: 1.sh,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          postDetail(item),
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Bình luận',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1.sw,
                            height: 1.sp,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              // controller: bloc.controller,
                              itemCount: state.comments?.length ?? 0,
                              // itemCount: 50,
                              itemBuilder: (context, index) {
                                final comment = state.comments?[index];
                                return Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          titlePost(
                                            avatar: comment?.userAvatar,
                                            name: comment?.userDisplayName,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.sp),
                                            child: Text(
                                              HelperDecode
                                                  .convertToVietnameseDateTime(
                                                      comment
                                                          ?.commentsCreatedDate
                                                          .toString()),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 120.sp, bottom: 50.sp),
                                        child: ExpandableText(
                                            "${comment?.commentsContent}"),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 1.sw,
                                        height: 1.sp,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 150.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      // height: 168.sp,
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(
                        vertical: 30.sp,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child:
                          // Input
                          Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.whiteF2,
                          borderRadius: BorderRadius.circular(46.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Actions

                            // Input message
                            SizedBox(
                              height: 120.sp,
                              width: 713.sp,
                              child: CustomTextForm(
                                formColor: ThemeColors.whiteF2,
                                borderRadius: 46.sp,
                                onTapOutside: (p0) {},
                                onChanged: (value) {
                                  //   => bloc.add(
                                  //   const UserTyping(),
                                  // )
                                },
                                buildContext: context,
                                controller: bloc.textEditingController,
                                hintText: 'Bình Luận: .... ',
                                // textInputAction: TextInputAction.newline,
                                maxLines: 2,
                                minLines: 1,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                isHideAllBorder: true,
                              ),
                            ),

                            // button send message
                            InkWell(
                              onTap: () {
                                bloc.add(SendComment(
                                  item?.postPostId,
                                ));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 35.sp),
                                child: Icon(
                                  Icons.send,
                                  color: ThemeColors.blue,
                                  size: 50.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }

  Container postDetail(PostDetailModel? item) {
    return item == null || (HelperChecker.empty(item.postCreatedDate))
        ? Container()
        : Container(
            margin: EdgeInsets.only(
              top: 20.sp,
              bottom: 20.sp,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
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
                            onTap: () {
                              // GetStores.navigator.goProfile(
                              //   ParamsProfile(
                              //     userId: item?.userId ?? '',
                              //   ),
                              // );
                            },
                            avatar: item.userAvatar,
                            name: item.userDisplayName,
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
                              item.postCreatedDate.toString()),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp),
                        child: ExpandableText("${item.postContent}"),
                      ),
                    ],
                  ),
                ),
                if (!HelperChecker.empty(item.postImageUrl))
                  Flexible(
                    child: AlbumPost(
                      images: HelperAction.getImages(item.postImageUrl ?? []),
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
                            'Số lượt thích: ${item.credibilityCount}',
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
                                  item.postPostId,
                                  value: item.likeValue == ConstValue.like
                                      ? ConstValue.unlike
                                      : ConstValue.like,
                                ),
                              );
                            },
                            icon: Icon(
                              // item?.isLike == true
                              //     ? Icons.favorite
                              //     :
                              Icons.thumb_up_alt,
                              color: item.likeValue == ConstValue.like
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
                            'Số lượt bình luận: ${item.commentCount}',
                            style: TextStyle(
                              fontSize: 40.sp,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                              bottom: 5.sp,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.comment,
                              color: Colors.black,
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
}
