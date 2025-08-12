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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313.h,
      child: widget.image == null ? Container(
        width: double.infinity,
        color: AppColors.gray100,
        child: Image.asset(ImagePath.imageError, width: 74.w,),
      ) : CachedNetworkImage(
        imageUrl: widget.image!,
        cacheManager: CustomCacheManager(),
        fit: BoxFit.cover,
        width: double.infinity,
        errorWidget: (context, url, error) {
          return Container(
            width: double.infinity,
            color: AppColors.gray100,
            child: Image.asset(ImagePath.imageError, width: 74.w,),
          );
        },
      ),
    );
  }
}
