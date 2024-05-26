import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../helpers/helper_log.dart';
import '../../models/params/params_gallery_image.dart';
import '../../theme/theme_color.dart';
import '../custom_appbar/button_appbar.dart';
import '../custom_appbar/custom_appbar.dart';

class GalleryImage extends ModalRoute<void> {
  ParamsGalleryImage params;

  GalleryImage({
    required this.params,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.85);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final pageController = PageController(initialPage: params.valueIndex);

    ImageProvider<Object>? avatar;
    if (params.isMemory) {
      final Image img = Image.memory(params.urlImage.value);
      avatar = img.image;
    }

    HelperLog.logInfo(
      'popup image ::: ${params.urlImage}',
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppbar(
        backgroundColor: Colors.transparent,
        iconRight: IconAppbar.close,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 25.sp,
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRect(
                ///'``` Multiple images
                child: params.urlImage is List<String>
                    ? ScaleTransition(
                        scale: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation),
                        alignment: Alignment.center,
                        child: PhotoViewGallery.builder(
                          pageController: pageController,
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          onPageChanged: (index) {
                            params.onChangeImage?.call(
                              index: index,
                              url: params.urlImage[index],
                              context: context,
                            );
                          },
                          itemCount: params.urlImage.length,
                          builder: (context, index) {
                            return PhotoViewGalleryPageOptions(
                              imageProvider:
                                  NetworkImage(params.urlImage[index]),
                              minScale: PhotoViewComputedScale.contained,
                              initialScale: PhotoViewComputedScale.contained,
                            );
                          },
                          loadingBuilder: (context, event) => const Center(
                            child: CircularProgressIndicator(
                              color: ThemeColors.brown51,
                            ),
                          ),
                        ),
                      )

                    ///``` Single image
                    : ScaleTransition(
                        scale: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation),
                        alignment: Alignment.center,
                        child: PhotoView(
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          minScale: PhotoViewComputedScale.contained,
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes:
                              PhotoViewHeroAttributes(tag: params.tag),
                          imageProvider: params.isMemory
                              ? avatar
                              : NetworkImage(
                                  params.urlImage,
                                ),
                          loadingBuilder: (context, event) => const Center(
                            child: CircularProgressIndicator(
                              color: ThemeColors.brown51,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
