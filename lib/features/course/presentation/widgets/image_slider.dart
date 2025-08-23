import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';

class ImageSlider extends StatefulWidget {
  final String? image;
  final double? height;

  const ImageSlider({
    super.key,
    required this.image,
    this.height,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  void _showFullscreenImage() {
    if (widget.image == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullscreenImageViewer(imageUrl: widget.image!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313.h,
      child: widget.image == null
          ? Container(
        width: double.infinity,
        color: AppColors.gray100,
        child: Image.asset(ImagePath.imageError, width: 74.w),
      )
          : GestureDetector(
        onTap: _showFullscreenImage,
        child: CachedNetworkImage(
          imageUrl: widget.image!,
          cacheManager: CustomCacheManager(),
          fit: BoxFit.cover,
          width: double.infinity,
          errorWidget: (context, url, error) {
            return Container(
              width: double.infinity,
              color: AppColors.gray100,
              child: Image.asset(ImagePath.imageError, width: 74.w),
            );
          },
        ),
      ),
    );
  }
}

class FullscreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const FullscreenImageViewer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 전체화면 이미지 뷰어
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 5.0,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  cacheManager: CustomCacheManager(),
                  fit: BoxFit.contain, // contain으로 변경해서 이미지 비율 유지하면서 화면에 맞춤
                  errorWidget: (context, url, error) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.gray100,
                      child: Center(
                        child: Image.asset(ImagePath.imageError, width: 74.w),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // 닫기 버튼
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}