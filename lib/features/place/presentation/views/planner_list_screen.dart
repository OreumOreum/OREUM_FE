import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/place/presentation/widgets/planner_list_tile.dart';

class PlannerListScreen extends StatelessWidget {
  PlannerListScreen({super.key});

  List<Map<String, dynamic>> mockCourse = [
    {'title': '제주도 2박 3일 여행 코스', 'subTitle': '3일간의 여행 코스', 'plannerId': 1},
    {'title': '제주도 2박 3일 여행 코스', 'subTitle': '3일간의 여행 코스', 'plannerId': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            HomeTitleText(
              title: AppStrings.userCreatedCourseTitle,
              primaryText: '모험 액티비티형 ',
              subtitle: AppStrings.userCreatedCourseSubTitle,
            ),
            SizedBox(
              height: 21.h,
            ),
            PlannerListTile.create(),
            SizedBox(
              height: 18.h,
            ),
            PlannerListTile.recommendation(),
            SizedBox(
              height: 18.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: mockCourse.length,
              itemBuilder: (BuildContext context, int index) {
                String title = mockCourse[index]['title']!;
                String subTitle = mockCourse[index]['subTitle']!;
                int plannerId = mockCourse[index]['plannerId']!;
                return PlannerListTile.iconButton(
                  title: title,
                  subTitle: subTitle,
                  onPressed: () =>
                      context.push(RoutePath.plannerDetail(plannerId)),
                  onButtonPressed: () {},
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 18.h,
                );
              },
            ),
            SizedBox(
              height: 72.h,
            ),
          ],
        ),
      ),
    );
  }
}
