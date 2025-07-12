import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';

class RecommendScreen extends StatelessWidget {
  RecommendScreen({super.key});

  final List<LargeCategory> largeCategories = LargeCategory.values;
  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '한라산국립공원',
      'address': '제주특별자치도 제주시 1100로 2070-61',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '천지연폭포',
      'address': '제주특별자치도 서귀포시 천지동 667-7',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '카카오박물관',
      'address': '제주특별자치도 제주시 첨단로 242',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: HomeTitleText(
                  title: AppStrings.typeRecommend('모험 액티비티형'),
                  primaryText: '모험 액티비티형',
                  subtitle: AppStrings.typePlaceRecommendation),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultPadding, vertical: 16.h),
              child: SearchBarButton(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w), // 양쪽 14 고정
                  child: Row(
                    children:
                    List.generate(largeCategories.length * 2 - 1, (index) {
                      if (index.isOdd) {
                        return SizedBox(width: 14.w); // 아이템 사이 간격
                      } else {
                        final category = largeCategories[index ~/ 2];
                        return GestureDetector(
                          onTap: () {
                            print('${category.label} tapped');
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 52.r,
                                width: 52.r,
                                child: Center(
                                  child: SvgPicture.asset(
                                    category.iconPath,
                                    width: category.iconWidth,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                category.label,
                                style: context.textStyles.body2
                                    .copyWith(color: AppColors.gray400),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Row(
                children: [
                  Text(
                    AppStrings.viewAll,
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.gray500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      AppStrings.nearest,
                      style: context.textStyles.body1
                          .copyWith(color: AppColors.gray300),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.gray100,
            ),
            SizedBox(
              height: 32.h,
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: mockPlace2.length,
              itemBuilder: (BuildContext context, int index) {
                String title = mockPlace2[index]['title']!;
                String address = mockPlace2[index]['address']!;
                String thumbnailImage = mockPlace2[index]['thumbnailImage']!;
                return PlaceListTile(
                    thumbnailImage: thumbnailImage,
                    title: title,
                    address: address);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: AppColors.gray100,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
