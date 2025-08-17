import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/home/domain/entities/carousel_item.dart';
import 'package:oreum_fe/features/home/presentation/widgets/page_gradient_carousel.dart';

class PagedGradientCarouselItem extends StatelessWidget {
  final CarouselItem item;

  const PagedGradientCarouselItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String iconPath = item.isVisited ? IconPath.spotCheck : IconPath.spotUncheck;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusSM),
      child: SizedBox(
        width: 359.w,
        height: 176.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            item.background,

            // 그라디언트
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, 100.h / 176.h * 2 - 1), // 100.h 기준 Y 위치로 조절
                  colors: [
                    Color(0xFF666666).withOpacity(0.8), // 진한 회색, 불투명도 0.8
                    Color(0xFF666666).withOpacity(0.0), // 투명하게 끝냄
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),

            // 텍스트
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 14.h, horizontal: AppSizes.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '이달의 여행지',
                        style: context.textStyles.label2
                            .copyWith(color: AppColors.white),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 18.r,
                        height: 18.r,
                        child: SvgPicture.asset(
                          iconPath,
                          width: 18.r,
                          height: 18.r,
                        ),
                      ),
                      Spacer(),
                      Text(
                        item.city,
                        style: context.textStyles.label2
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.title,
                    style: context.textStyles.headLine3
                        .copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 2.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '같은 유형이', // 이 부분 색상 변경
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.white),
                        ),
                        TextSpan(
                          text: item.count, // 이 부분 색상 변경
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.white),
                        ),
                        TextSpan(
                          text: '명 방문했어요!',
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}