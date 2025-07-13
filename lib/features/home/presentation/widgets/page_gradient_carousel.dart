// lib/widgets/paged_gradient_carousel/paged_gradient_carousel.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/home/domain/entities/carousel_item.dart';
import 'package:oreum_fe/features/home/presentation/widgets/paged_gradient_carousel_item.dart';

class PagedGradientCarousel extends StatefulWidget {
  final List<CarouselItem> items;

  const PagedGradientCarousel({required this.items, super.key});

  @override
  State<PagedGradientCarousel> createState() => _PagedGradientCarouselState();
}

class _PagedGradientCarouselState extends State<PagedGradientCarousel>
    with SingleTickerProviderStateMixin {
  late final List<CarouselItem> _loopedItems;
  PageController? _pageController;
  int _currentPage = 1;
  Timer? _autoPlayTimer;
  bool isPlay = true;

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _loopedItems = [
      widget.items.last,
      ...widget.items,
      widget.items.first,
    ];

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);

    _startAutoPlay();
  }

  PageController _createPageController(double screenWidth) {
    final viewportFraction = (359.w + 8.w) / screenWidth;
    return PageController(
        initialPage: _currentPage, viewportFraction: viewportFraction);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _autoPlayTimer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    isPlay = true;
    _autoPlayTimer?.cancel();
    _autoPlayTimer =
        Timer.periodic(const Duration(seconds: 8), (_) => _nextPage());
    setState(() {

    });
  }

  void _stopAutoPlay() {
    isPlay = false;
    setState(() {

    });
    _autoPlayTimer?.cancel();
  }

  void _nextPage() {
    _pageController?.nextPage(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _jumpToFirstPageWithFade() async {
    await _fadeController.forward(); // 흰색 덮기 (페이드 인)
    _pageController?.jumpToPage(1); // 실제 첫 페이지로 이동
    setState(() => _currentPage = 1);
    await _fadeController.reverse(); // 흰색 걷기 (페이드 아웃)
  }

  Future<void> _jumpToLastPageWithFade() async {
    await _fadeController.forward();
    _pageController?.jumpToPage(widget.items.length);
    setState(() => _currentPage = widget.items.length);
    await _fadeController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    _pageController ??= _createPageController(screenWidth);

    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTapDown: (_) => _stopAutoPlay(),
              onTapUp: (_) => _startAutoPlay(),
              child: SizedBox(
                height: 176.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _loopedItems.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);

                    if (index == 0) {
                      _jumpToLastPageWithFade();
                    } else if (index == widget.items.length + 1) {
                      _jumpToFirstPageWithFade();
                    }
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child:
                          PagedGradientCarouselItem(item: _loopedItems[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // 화이트 페이드 오버레이
        IgnorePointer(
          ignoring: true,
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Container(color: Colors.white),
              );
            },
          ),
        ),
        // 인디케이터
        Positioned(
          left: screenWidth > 600 ? 490.w : 303.w,
          bottom: 10.h,
          child: InkWell(
            onTap: () {
              if (isPlay) {
                _stopAutoPlay();
              } else {
                _startAutoPlay();
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 4.h, bottom: 4.h, left: 12.w, right: 14.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  isPlay
                      ? SvgPicture.asset(
                          IconPath.pause,
                          width: 7.w,
                        )
                      : SvgPicture.asset(
                          IconPath.play,
                          width: 7.w,
                        ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${((_currentPage - 1) % widget.items.length) + 1}',
                          // 이 부분 색상 변경
                          style: context.textStyles.caption1
                              .copyWith(color: AppColors.white),
                        ),
                        TextSpan(
                          text: '/${widget.items.length}',
                          style: context.textStyles.caption1
                              .copyWith(color: AppColors.gray300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
