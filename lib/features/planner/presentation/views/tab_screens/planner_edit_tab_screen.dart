import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/place/data/models/planner_place.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_edit_list_tile.dart';

class PlannerEditTabScreen extends ConsumerStatefulWidget {
  final List<PlannerPlace>? places;
  final int day;

  const PlannerEditTabScreen({
    super.key,
    this.places,
    required this.day,
  });

  @override
  ConsumerState<PlannerEditTabScreen> createState() => _PlannerEditTabScreenState();
}

class _PlannerEditTabScreenState extends ConsumerState<PlannerEditTabScreen> {
  late List<PlannerPlace> _places;

  @override
  void initState() {
    super.initState();
    //_places = List.from(widget.places); // 복사본 생성
  }

  @override
  Widget build(BuildContext context) {
    //final places = widget.places ?? [];
    final places = ref.watch(plannerPlacesByDayProvider(widget.day));
    print(places);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                AppStrings.dayCourseInfo(widget.day),
                style: context.textStyles.headLine4
                    .copyWith(color: AppColors.gray500),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.sortByNearest,
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.gray400),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          /// ✅ 리스트가 비어있지 않을 때만 보여주기
          if (places.isNotEmpty)
            Flexible(
              child: ReorderableListView.builder(
                shrinkWrap: true,
                itemCount: places.length,
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex >= places.length || newIndex > places.length) return;

                  if (oldIndex < newIndex) newIndex -= 1;

                  ref.read(plannerEditViewModelProvider.notifier).reorderPlaces(widget.day, oldIndex, newIndex);
                },
                proxyDecorator:
                    (Widget child, int index, Animation<double> animation) {
                  return Material(
                    color: Colors.transparent,
                    child: Opacity(opacity: 0.5, child: child),
                  );
                },
                itemBuilder: (context, index) {
                  final place = places[index];
                  return Container(
                    key: ValueKey(index),
                    margin: index == places.length - 1
                        ? EdgeInsets.zero
                        : EdgeInsets.only(bottom: 20.h),
                    child: PlannerEditListTile(
                      day: widget.day,
                      category: '한식',
                      title: place.title,
                      address: place.address,
                      index: index,
                    ),
                  );
                },
              ),
            ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: TextButton(
              onPressed: () {
                context.push(RoutePath.plannerSearch, extra: widget.day);
              },
              child: Text(
                AppStrings.addPlan,
                style: context.textStyles.body1.copyWith(
                  color: AppColors.gray200,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
