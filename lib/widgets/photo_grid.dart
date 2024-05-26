import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumPost extends StatelessWidget {
  final List<String> images;
  final Function(String) onImageTap;

  const AlbumPost({required this.images, required this.onImageTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (images.length == 1)
          _buildSingleImage(images[0])
        else if (images.length == 2)
          _buildTwoImages(images)
        else if (images.length == 3)
          _buildThreeImages(images)
        else
          _buildGridImages(images)
      ],
    );
  }

  Widget _buildSingleImage(String imageUrl) {
    return SizedBox(
      height: 500.sp,
      child: InkWell(
        onTap: () => onImageTap(imageUrl),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 1.sh,
          width: 1.sw,
        ),
      ),
    );
  }

  Widget _buildTwoImages(List<String> imageUrls) {
    return SizedBox(
      height: 500.sp,
      child: Row(
        children: imageUrls
            .map((url) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () => onImageTap(url),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        height: 1.sh,
                        width: 1.sw,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildThreeImages(List<String> imageUrls) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(4.0), // Add spacing around the image
              child: InkWell(
                onTap: () => onImageTap(imageUrls[0]),
                child: Image.network(
                  imageUrls[0],
                  fit: BoxFit.cover,
                  height: 1.sh,
                  width: 1.sw,
                ),
              ),
            ),
          ),
          Row(
            children: imageUrls
                .sublist(1)
                .map((url) => Expanded(
                      child: SizedBox(
                        height: 250.sp,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              4.0), // Add spacing between images
                          child: InkWell(
                            onTap: () => onImageTap(url),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              height: 1.sh,
                              width: 1.sw,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGridImages(List<String> imageUrls) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onImageTap(imageUrls[index]),
          child: Image.network(imageUrls[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
