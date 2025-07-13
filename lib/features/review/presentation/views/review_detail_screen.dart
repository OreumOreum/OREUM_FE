import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';
import 'package:oreum_fe/main.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/review/presentation/widgets/review_list_tile.dart';

class ReviewDetailScreen extends StatelessWidget {
  ReviewDetailScreen({super.key});

  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'rating': '3',
      'reviewNumber': '97'
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'rating': '3',
      'reviewNumber': '97'
    },
  ];

  final List<Map<String, String>> mockReview = [
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        mockPlace2[1]['thumbnailImage']!, // 첫 번째 이미지
                        height: 84.r,
                        width: 84.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      mockPlace2[1]['title']!,
                      style: context.textStyles.headLine4
                          .copyWith(color: AppColors.gray500),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      mockPlace2[1]['address']!,
                      style: context.textStyles.body1
                          .copyWith(color: AppColors.gray400),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: double.parse(mockPlace2[1]['rating']!),
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 27.w,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                          itemBuilder: (context, _) => SvgPicture.asset(
                            IconPath.star,
                          ),
                          unratedColor: AppColors.gray200,
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(width: 14.w),
                        Text(
                          mockPlace2[1]['rating']!,
                          style: context.textStyles.headLine1
                              .copyWith(color: AppColors.gray500),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.ratingNumber(int.parse(mockPlace2[1]['reviewNumber']!)),
                      style: context.textStyles.body1
                          .copyWith(color: AppColors.gray400),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Divider(height: 2.h, color: AppColors.gray100),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.travelerReview,
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.gray500),
                  ),
                  Text(
                    AppStrings.doReview,
                    style: context.textStyles.label4
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 1.h, color: AppColors.gray100),
            SizedBox(height: 6.h),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                String type = mockReview[index]['type']!;
                String date = mockReview[index]['date']!;
                String content =
                mockReview[index]['content']!;
                double rating = double.parse(mockReview[index]['rating']!);
                return ReviewListTile(
                    type: type,
                date: date,
                content: content,
                rating: rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
