import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';


class ImageSlider extends StatefulWidget {
  final String images;
  final double? height;

  const ImageSlider({
    super.key,
    required this.images,
    this.height,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),

          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 5.w),
                  width: 6.r,
                  height: 6.r,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}