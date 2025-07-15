import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/home/presentation/widgets/search_list_tile.dart';

import '../../../../core/constants/app_colors.dart';

class AfterSearchWidget extends StatelessWidget {
  final String searchQuery;
  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 461km', // 용인시에서 성산일출봉까지의 직선거리
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 서귀포시 한림읍 협재리 2497-1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 464km', // 용인시에서 협재해수욕장까지의 직선거리
    },
    {
      'title': '한라산국립공원',
      'address': '제주특별자치도 제주시 1100로 2070-61',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 454km', // 용인시에서 한라산국립공원까지의 직선거리
    },
    {
      'title': '천지연폭포',
      'address': '제주특별자치도 서귀포시 천지동 667-7',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 460km', // 용인시에서 천지연폭포까지의 직선거리
    },
    {
      'title': '카카오박물관',
      'address': '제주특별자치도 제주시 첨단로 242',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 450km', // 용인시에서 카카오 본사까지의 직선거리
    },
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 461km',
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 464km',
    },
    {
      'title': '한라산국립공원',
      'address': '제주특별자치도 제주시 1100로 2070-61',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'distance': '약 454km',
    }
  ];

  AfterSearchWidget({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredPlaces = mockPlace2.where((place) {
      final title = place['title']!.toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query);
    }).toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 18.h, horizontal: AppSizes.defaultPadding),
          child: Row(
            children: [
              SizedBox(
                width: AppSizes.iconSM,
                height: AppSizes.iconSM,
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.search,
                    width: 18.r,
                    height: 18.r,
                  ),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                child: Text(
                  '"$searchQuery" 검색결과',
                  style:
                      context.textStyles.body1.copyWith(color: AppColors.gray400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: filteredPlaces.length,
          itemBuilder: (BuildContext context, int index) {
            String title = filteredPlaces[index]['title']!;
            String address = filteredPlaces[index]['address']!;
            String thumbnailImage = filteredPlaces[index]['thumbnailImage']!;
            String distance = filteredPlaces[index]['distance']!;
            return SearchListTile(
                thumbnailImage: thumbnailImage,
                title: title,
                address: address,
                distance: distance);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
