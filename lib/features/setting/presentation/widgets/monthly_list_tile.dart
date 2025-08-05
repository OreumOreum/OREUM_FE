import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';

import '../../../../core/constants/icon_path.dart';

class MonthlyListTile extends StatelessWidget {
  final String month;
  // 1. 파라미터가 List<Destination>에서 List<SpotResponse>로 변경됨
  final List<SpotResponse> spots;

  const MonthlyListTile({
    super.key,
    required this.month,
    required this.spots, // 생성자도 함께 변경
  });

  @override
  Widget build(BuildContext context) {
    // 2. 방문한 order들만 Set으로 만들어 빠른 조회를 가능하게 함
    final visitedOrders = spots.map((spot) => spot.order).toSet();

    // 3. 항상 표시될 4개의 고정된 위치 텍스트
    const fixedCircles = ['서귀포시', '서귀포시', '제주시', '제주시'];

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
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: 42.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                final bool isVisited = visitedOrders.contains(index);

                Widget circleContent;
                Color borderColor;
                double borderWidth;

                if (isVisited) {
                  borderColor = AppColors.primary;
                  borderWidth = 3.r;
                  circleContent = SvgPicture.asset(IconPath.oreumStamp);
                } else {
                  // 방문하지 않았다면 고정된 텍스트 표시
                  final String displayText = fixedCircles[index];
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

                return Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: borderColor,
                      width: borderWidth,
                    ),
                  ),
                  child: Center(
                    child: circleContent,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}