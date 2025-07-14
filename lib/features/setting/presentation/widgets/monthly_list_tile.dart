import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import '../../../../core/constants/destination.dart';
import '../../../../core/constants/icon_path.dart';

class MonthlyListTile extends StatelessWidget {
  final String month;
  final List<Destination> destinations;

  const MonthlyListTile({
    super.key,
    required this.month,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          Container(
            width: 14.r,
            height: 14.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.primary,
                width: 4.r,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '$month월',
            style: context.textStyles.label3.copyWith(
              color: AppColors.primary, //월 색
            ),
          ),
          SizedBox(
            width: 42.w,
          ),
          Expanded(
            child: Row(
              // MainAxisAlignment.spaceBetween를 사용하여 원들을 균등하게 배치합니다.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: destinations.map((destination) {
                // isVisited와 sigunguCode 값에 따라 텍스트와 색상을 결정하는 로직
                Widget circleContent;
                Color borderColor;
                double borderWidth;
                if (destination.isVisited) {
                  // 방문했다면 '오름오름' 텍스트와 주황색을 사용

                  borderColor = AppColors.primary;
                  borderWidth = 3.r;
                  circleContent = SvgPicture.asset(
                    IconPath.oreumStamp,

                  );
                } else {
                  String displayText;
                  switch (destination.sigunguCode) {
                    case '3':
                      displayText = '서귀포시';
                      break;
                    case '4':
                      displayText = '제주시';
                      break;
                    default:
                      displayText = ''; // 알 수 없는 코드일 경우 빈 텍스트
                  }
                  borderColor = AppColors.gray200;
                  borderWidth = 2.r;
                  circleContent = Text(
                    displayText,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.caption1.copyWith(
                      color: AppColors.gray300,
                    ),
                  );
                }

                // 각 여행지(destination)에 대해 원 위젯을 생성합니다.
                return Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: borderColor, // 테두리색
                      width: borderWidth,
                    ),
                  ),
                  child: Center(
                    child: circleContent,
                  ),
                );
              }).toList(), // map의 결과는 Iterable이므로 List로 변환합니다.
            ),
          ),
        ],
      ),
    );
  }
}
