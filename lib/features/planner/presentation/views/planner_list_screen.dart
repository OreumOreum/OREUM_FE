import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_list_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_list_tile.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_menu_modal.dart';

class PlannerListScreen extends ConsumerStatefulWidget {
  const PlannerListScreen({super.key});

  @override
  ConsumerState<PlannerListScreen> createState() => _PlannerListScreenState();
}

class _PlannerListScreenState extends ConsumerState<PlannerListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(plannerListViewModelProvider.notifier).getPlanners();
    });
  }

  void showPlannerMenuModal(BuildContext context, String plannerId) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return PlannerMenuModal(
          plannerId: plannerId,
          isDetail: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerListViewModelProvider);

    if (state.status == UiStatus.loading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
      ); //로티
    }

    if (state.status == UiStatus.error) {
      return ErrorRetryWidget(
        onPressed: () {
          ref.read(plannerListViewModelProvider.notifier).getPlanners();
        },
      );
    }

    List<PlannerResponse> planners = state.planners;

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
              primaryText: '모험 액티비티형',

              ///내 타입 가져와야 됨
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
              itemCount: planners.length,
              itemBuilder: (BuildContext context, int index) {
                String title = planners[index].plannerName;
                String subTitle = '${planners[index].day}일간의 여행 코스';
                String plannerId = planners[index].plannerId.toString();
                return PlannerListTile.iconButton(
                  title: title,
                  subTitle: subTitle,
                  onPressed: () => context
                      .push(RoutePath.plannerDetail(plannerId), extra: title),
                  onButtonPressed: () {
                    showPlannerMenuModal(context, plannerId);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 18.h,
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
