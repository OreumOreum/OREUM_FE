import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_tab_bar.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_menu_modal.dart';

import 'tab_screens/planner_detail_tab_screen.dart';

class PlannerDetailScreen extends ConsumerStatefulWidget {
  final String plannerId;
  final String plannerName;

  const PlannerDetailScreen({
    super.key,
    required this.plannerId,
    required this.plannerName,
  });

  @override
  ConsumerState<PlannerDetailScreen> createState() =>
      _PlannerDetailScreenState();
}

class _PlannerDetailScreenState extends ConsumerState<PlannerDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(plannerDetailViewModelProvider.notifier)
          .getPlannerPlace(widget.plannerId);
    });
  }

  void showPlannerMenuModal(BuildContext context, String plannerId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return PlannerMenuModal(
          plannerId: plannerId,
          isDetail: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerDetailViewModelProvider);
    final notifier = ref.read(plannerDetailViewModelProvider.notifier);

    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: CustomAppBar.backWithButtonAndText(
            title: widget.plannerName, onActionPressed: () {
              showPlannerMenuModal(context, widget.plannerId);
        }, actionType: ActionType.dots,),
        body: Padding(
          padding: EdgeInsets.only(bottom: 56.h),
          child:
              Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
        ),
      );
    }

    if (state.status == UiStatus.error) {
      return Scaffold(
        appBar: CustomAppBar.backWithText(title: widget.plannerName),
        body: Text('error: ${state.errorMessage}'),
      );
    }

    List<int> uniqueDays = notifier.getUniqueDays();

    return DefaultTabController(
      length: uniqueDays.length,
      child: Scaffold(
        appBar: CustomAppBar.backWithButtonAndText(
            title: widget.plannerName,
            actionType: ActionType.dots,
            onActionPressed: () {
              showPlannerMenuModal(context, widget.plannerId);
            }),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // 스크롤 시 사라질 공간
                SliverToBoxAdapter(
                  child: Container(
                    color: AppColors.gray200,
                    height: 200.h, // 원하는 높이로 조정
                    // 여기에 사라질 콘텐츠를 추가할 수 있습니다
                    // 예: 검색바, 필터, 광고 등
                  ),
                ),
                // 고정될 탭바
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    height: 51.h,
                    child: Container(
                      height: 51.h,
                      color: Colors.transparent,
                      child: CustomTabBar(
                        tabs: uniqueDays
                            .map(
                              (day) => Tab(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    AppStrings.day(day),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: uniqueDays.map((day) {
                final places = notifier.getPlacesByDay(day);
                return PlannerDetailTabScreen(
                  places: places,
                  day: day,
                  plannerId: widget.plannerId,
                  plannerName: widget.plannerName,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverAppBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
