
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/views/tab_screens/planner_detail_tab_screen.dart';
import 'package:oreum_fe/features/place/presentation/widgets/custom_tab_bar.dart';

class PlannerDetailScreen extends ConsumerWidget {
  final int plannerId;

  const PlannerDetailScreen({
    super.key,
    required this.plannerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(plannerDetailViewModelProvider(plannerId));
    final notifier =
    ref.read(plannerDetailViewModelProvider(plannerId).notifier);

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
        appBar: CustomAppBar.backWithButtonAndText(
            title: '제주도 2박 3일 코스',
            actionType: ActionType.dots,
            onActionPressed: () {}),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                  child: Container(
                    color: Colors.transparent,
                    child: CustomTabBar(
                      tabs: uniqueDays
                          .map(
                            (day) => SizedBox(
                              height: 54.h,
                              child: Tab(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    AppStrings.day(day),
                                  ),
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
              return PlannerDetailTabScreen(places: places, day: day);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 54.h;

  @override
  double get maxExtent => 54.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}