import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_tab_bar.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_tab_modal.dart';

import 'tab_screens/planner_edit_tab_screen.dart';

enum PlannerEditStatus {
  plannerCreate,
  plannerEdit,
  plannerRecommend,
}

class PlannerEditScreen extends ConsumerStatefulWidget {
  final bool isEdit;
  final bool? isRecommend;
  final int? plannerId;
  final String? plannerName;
  final List<PlannerEditPlace>? editPlaces;
  final int? initialDay;

  const PlannerEditScreen({
    super.key,
    required this.isEdit,
    this.isRecommend,
    this.plannerId,
    this.plannerName,
    this.editPlaces,
    this.initialDay,
  });

  @override
  ConsumerState<PlannerEditScreen> createState() => _PlannerEditScreenState();
}

class _PlannerEditScreenState extends ConsumerState<PlannerEditScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final _scrollController = ScrollController();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeViewModel();
    });
  }

  void _initializeViewModel() async {
    if (widget.isEdit) {
      ref
          .read(plannerEditViewModelProvider.notifier)
          .setPlannerPlaces(widget.editPlaces!);
      ref.read(plannerEditViewModelProvider.notifier).initializeForEdit();
    } else {
      ref.read(plannerEditViewModelProvider.notifier).resetForNewPlanner();
      if (widget.isRecommend! && widget.isRecommend != null) {
        print('추천 플래너 가져오기 시작');
        await ref
            .read(plannerEditViewModelProvider.notifier)
            .getRecommendPlanner();

        // 추천 플래너 데이터 확인
        final state = ref.read(plannerEditViewModelProvider);
        print('추천 플래너 가져오기 완료 - 장소 수: ${state.plannerPlaces.length}');
        print('탭 일수: ${state.tabDays}');
        ref.read(plannerEditViewModelProvider.notifier).initializeForEdit();
      }
    }

    // ViewModel 초기화 완료 후 TabController 생성
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _createTabController();
      }
    });
  }

  void _createTabController() {
    final state = ref.read(plannerEditViewModelProvider);
    final tabDays = state.tabDays;

    _tabController?.dispose();
    _tabController = TabController(
      length: tabDays.length,
      vsync: this,
      initialIndex:
          widget.initialDay != null && widget.initialDay! < tabDays.length
              ? widget.initialDay!
              : 0,
    );

    _isInitialized = true;
    setState(() {});
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerEditViewModelProvider);
    final tabDays = state.tabDays;

    // TabController가 준비되지 않았으면 로딩
    if (!_isInitialized || _tabController == null) {
      return Scaffold(
        appBar: CustomAppBar.backWithText(
          title: widget.plannerName!,
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 56.h),
          child: Center(
            child: Lottie.asset(AnimationPath.loading, repeat: true),
          ),
        ),
      );
    }

    ref.listen(plannerEditViewModelProvider, (previous, next) {
      print('previous: ${previous?.tabDays.length}');
      print('next: ${next.tabDays.length}');

      if (next.tabDays.length != _tabController!.length) {
        final wasTabAdded =
            next.tabDays.length > (previous?.tabDays.length ?? 0);

        _tabController!.dispose();
        _tabController =
            TabController(length: next.tabDays.length, vsync: this);

        // 탭이 추가된 경우에만 마지막으로 이동
        if (wasTabAdded) {
          _tabController!.animateTo(next.tabDays.length - 1);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: state.tabDays.length == 1
          ? CustomAppBar.backWithText(
              title: state.recommendPlannerName != ''
                  ? state.recommendPlannerName
                  : widget.plannerName!)
          : CustomAppBar.backWithButtonAndText(
              title: widget.plannerName!,
              onActionPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PlannerTabModal(tabLength: tabDays.length);
                    });
              },
              actionType: ActionType.dots,
            ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 51.h,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTabBar(
                      tabController: _tabController!,
                      tabs: tabDays
                          .map((day) => Tab(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Text(AppStrings.day(day)),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      width: 32.r,
                      height: 32.r,
                      margin: EdgeInsets.only(bottom: 4.h),
                      child: IconButton(
                        onPressed: () {
                          final lastDay = state.tabDays.last;
                          final isLastDayEmpty =
                              !state.plannerPlaces.any((p) => p.day == lastDay);
                          if (isLastDayEmpty) {
                            CustomToast.showToast(
                                context, '${tabDays.last}일 차 일정을 추가해주세요', 56.h);
                          } else {
                            ref
                                .read(plannerEditViewModelProvider.notifier)
                                .addTab();
                          }
                          if (tabDays.length >= 14) {
                            CustomToast.showToast(
                                context, '최대 14일차까지 추가 할 수 있습니다', 16.h);
                          }
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
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController!,
                children: tabDays
                    .map((day) => PlannerEditTabScreen(
                          day: day,
                          plannerId: widget.plannerId,
                          plannerName: state.recommendPlannerName != ''
                              ? state.recommendPlannerName
                              : widget.plannerName!,
                          isEdit: widget.isEdit,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
