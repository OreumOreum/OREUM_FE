import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/home/presentation/widgets/recent_search_list_tile.dart';

class BeforeSearchWidget extends StatelessWidget {
  BeforeSearchWidget({super.key});

  final List<Map<String, String>> recentTravelSearches = [
    {'title': '제주도 동쪽 숙소 추천'},
    {'title': '부산 해운대 근처 맛집'},
    {'title': '강릉 1박 2일 여행 코스'},
    {'title': '일본 오사카 항공권 최저가'},
    {'title': '경주 황리단길 가볼 만한 곳'},
    {'title': '베트남 다낭 리조트 순위'},
    {'title': '서울 근교 당일치기 계곡'},
    {'title': '스위스 인터라켄 패러글라이딩'},
    {'title': '여수 밤바다 야경 명소'},
    {'title': '속초 중앙시장 먹거리 리스트'},
    {'title': '제주도 동쪽 숙소 추천'},
    {'title': '부산 해운대 근처 맛집'},
    {'title': '강릉 1박 2일 여행 코스'},
    {'title': '일본 오사카 항공권 최저가'},
    {'title': '경주 황리단길 가볼 만한 곳'},
    {'title': '베트남 다낭 리조트 순위'},
    {'title': '서울 근교 당일치기 계곡'},
    {'title': '스위스 인터라켄 패러글라이딩'},
    {'title': '여수 밤바다 야경 명소'},
    {'title': '속초 중앙시장 먹거리 리스트'},
    {'title': '제주도 동쪽 숙소 추천'},
    {'title': '부산 해운대 근처 맛집'},
    {'title': '강릉 1박 2일 여행 코스'},
    {'title': '일본 오사카 항공권 최저가'},
    {'title': '경주 황리단길 가볼 만한 곳'},
    {'title': '베트남 다낭 리조트 순위'},
    {'title': '서울 근교 당일치기 계곡'},
    {'title': '스위스 인터라켄 패러글라이딩'},
    {'title': '여수 밤바다 야경 명소'},
    {'title': '속초 중앙시장 먹거리 리스트'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Row(
            children: [
              Text(AppStrings.recentSearch,
                  style: context.textStyles.label4
                      .copyWith(color: AppColors.gray500)),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.deleteAll,
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.gray300),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          itemCount: recentTravelSearches.length,
          itemBuilder: (BuildContext context, int index) {
            String title = recentTravelSearches[index]['title']!;
            return RecentSearchListTile(
              title: title,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 16.h,
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
