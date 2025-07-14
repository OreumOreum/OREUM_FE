import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/setting/presentation/widgets/monthly_spot_list_tile.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/monthly_spot.dart';
import '../../../../core/constants/route_path.dart';

class MonthlySpotDetail extends StatelessWidget {
  final int year;
  final int month;

  const MonthlySpotDetail({
    super.key,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final List<Spot> dummySpots = [
      const Spot(
        spotId: 5,
        placeId: 4,
        title: '가메창(암메)',
        address: '제주특별자치도 서귀포시 한경면 청수로 13-3',
        thumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 3,
        isVisit: true,
      ),
      const Spot(
        spotId: 6,
        placeId: 6,
        title: '가시어멍김밥',
        address: '제주특별자치도 서귀포시 월랑로 36',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 3,
        isVisit: false,
      ),
      const Spot(
        spotId: 7,
        placeId: 7,
        title: '갈치공장',
        address: '제주특별자치도 제주시 해맞이해안로 1296',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/24/2853424_image2_1.jpg',
        sigunguCode: 4,
        isVisit: false,
      ),
      const Spot(
        spotId: 8,
        placeId: 8,
        title: '감나무집',
        address: '제주특별자치도 제주시 오남로 12',
        thumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 4,
        isVisit: true,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultPadding, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$year년 ${month.toString().padLeft(2, '0')}월',
                    style: context.textStyles.headLine4
                        .copyWith(color: AppColors.gray500)),
                SizedBox(height: 4.h),
                Text(AppStrings.monthlySpotCheck(month.toString()),
                    style: context.textStyles.label4
                        .copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          Container(
            color: AppColors.gray100,
            child: Padding(
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
                      children: dummySpots.map((spot) {
                        // isVisited와 sigunguCode 값에 따라 텍스트와 색상을 결정하는 로직
                        Widget circleContent;
                        Color borderColor;
                        double borderWidth;
                        if (spot.isVisit) {
                          borderColor = AppColors.primary;
                          borderWidth = 3.r;
                          circleContent = SvgPicture.asset(
                            IconPath.oreumStamp,

                          );
                        } else {
                          String displayText;
                          switch (spot.sigunguCode) {
                            case 3:
                              displayText = '서귀포시';
                              break;
                            case 4:
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
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Divider(height: 1.h, thickness: 1.h, color: AppColors.gray200),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: dummySpots.length,
              itemBuilder: (context, index) {
                final spot = dummySpots[index];
                return GestureDetector(
                  onTap: () {

                    context.push(
                      RoutePath.monthlySpotMap,
                      extra: {
                        'year': year,
                        'month': month,
                      },
                    );
                  },
                  child: MonthlySpotListTile(
                    thumbnailImage: spot.thumbnailImage,
                    title: spot.title,
                    address: spot.address,
                    isVisit: spot.isVisit,
                    sigunguCode: spot.sigunguCode,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
