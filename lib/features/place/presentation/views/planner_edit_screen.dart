import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/place/presentation/views/tab_screens/planner_edit_tab_screen.dart';
import 'package:oreum_fe/features/place/presentation/widgets/custom_tab_bar.dart';

import '../viewmodels/planner_detail_view_model.dart';
import 'tab_screens/planner_detail_tab_screen.dart';

class PlannerEditScreen extends ConsumerWidget {
  final bool isEdit;
  final int? plannerId;

  const PlannerEditScreen({super.key, required this.isEdit, this.plannerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(plannerDetailViewModelProvider(plannerId!));
    final notifier =
        ref.read(plannerDetailViewModelProvider(plannerId!).notifier);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      );
    }

    final uniqueDays = notifier.getUniqueDays();

    return DefaultTabController(
      length: uniqueDays.length,
      child: Scaffold(
        appBar: CustomAppBar.backWithTextButtonAndText(
          title: '제주도 2박 3일 코스',
          onActionPressed: () {},
        ),
        body: Column(
          children: [
            SizedBox(
              height: 54.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end, // Row에서 아래 정렬
                children: [
                  // 탭바
                  CustomTabBar(
                    tabs: uniqueDays
                        .map(
                          (day) => Tab(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(AppStrings.day(day)),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                  SizedBox(width: 2.w),

                  // 아이콘 버튼: 아래 정렬
                  Container(
                    width: 32.r,
                    height: 32.r,
                    margin: EdgeInsets.only(bottom: 4.h),
                    child: IconButton(
                      onPressed: () {
                        print('IconButton Tabbed');
                      },
                      icon: SvgPicture.asset(
                        IconPath.addCircle,
                        width: 16.r,
                        height: 16.r,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: uniqueDays.map((day) {
                  final places = notifier.getPlacesByDay(day);
                  return PlannerEditTabScreen(places: places, day: day);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
