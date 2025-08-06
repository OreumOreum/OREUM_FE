import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_tab_bar.dart';

import 'tab_screens/planner_edit_tab_screen.dart';

enum PlannerEditStatus {
  plannerCreate,
  plannerEdit,
}

class PlannerEditScreen extends ConsumerStatefulWidget {
  final bool isEdit;
  final int? plannerId;
  final String? plannerName;
  final List<PlannerEditPlace>? editPlaces;
  final int? initialDay;

  const PlannerEditScreen(
      {super.key,
      required this.isEdit,
      this.plannerId,
      this.plannerName,
      this.editPlaces,
      this.initialDay});

  @override
  ConsumerState<PlannerEditScreen> createState() => _PlannerEditScreenState();
}

class _PlannerEditScreenState extends ConsumerState<PlannerEditScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEdit) {
        ref
            .read(plannerEditViewModelProvider.notifier)
            .setPlannerPlaces(widget.editPlaces!);
        ref.read(plannerEditViewModelProvider.notifier).initializeForEdit();
      } else {
        ref.read(plannerEditViewModelProvider.notifier).resetForNewPlanner();
      }
    });
    final days = ref.read(plannerEditViewModelProvider).tabDays;
    _tabController = TabController(
        length: days.length,
        vsync: this,
        initialIndex: widget.initialDay != null ? widget.initialDay! : 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerEditViewModelProvider);
    final tabDays = state.tabDays;
    ref.listen(plannerEditViewModelProvider, (previous, next) {
      if (next.tabDays.length != _tabController.length) {
        _tabController.dispose();
        _tabController =
            TabController(length: next.tabDays.length, vsync: this);
        _tabController.animateTo(next.tabDays.length - 1);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar.backWithTextButtonAndText(
        title: widget.plannerName ?? '',
        onActionPressed: () async {
          final viewModel = ref.watch(plannerEditViewModelProvider.notifier);
          final hasPlaces = viewModel.hasPlannerPlaces;
          if (hasPlaces) {
            if (widget.isEdit) {
              await ref
                  .read(plannerEditViewModelProvider.notifier)
                  .editPlannerPlaces(widget.plannerName!, widget.plannerId.toString());
              context.pop();
              CustomToast.showToast(context, '일정을 수정했습니다', 56.h);
            } else {
              await ref
                  .read(plannerEditViewModelProvider.notifier)
                  .createPlanner(widget.plannerName!);
              context.pop();
              CustomToast.showToast(context, '일정을 생성했습니다', 56.h);
            }
          } else {
            CustomToast.showToast(context, '여행지가 없습니다', 56.h);
          }
        },
      ),
      body: Column(
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
                    tabController: _tabController,
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
                        ref
                            .read(plannerEditViewModelProvider.notifier)
                            .addTab();
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
              controller: _tabController,
              children:
                  tabDays.map((day) => PlannerEditTabScreen(day: day)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
