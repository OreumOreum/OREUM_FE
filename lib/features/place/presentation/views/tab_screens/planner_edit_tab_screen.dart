import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/place/data/models/planner_place.dart';
import 'package:oreum_fe/features/place/presentation/widgets/planner_edit_list_tile.dart';

class PlannerEditTabScreen extends StatefulWidget {
  final List<PlannerPlace> places;
  final int day;

  const PlannerEditTabScreen({
    super.key,
    required this.places,
    required this.day,
  });

  @override
  State<PlannerEditTabScreen> createState() => _PlannerEditTabScreenState();
}

class _PlannerEditTabScreenState extends State<PlannerEditTabScreen> {
  late List<PlannerPlace> _places;

  @override
  void initState() {
    super.initState();
    _places = List.from(widget.places); // 복사본 생성
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ReorderableListView.builder(
              itemCount: _places.length + 1, // ✅ 버튼용 한 칸 더
              onReorder: (oldIndex, newIndex) {
                if (oldIndex >= _places.length || newIndex > _places.length) return; // ✅ 버튼 자체는 reorder 안되도록
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = _places.removeAt(oldIndex);
                  _places.insert(newIndex, item);
                });
              },
              proxyDecorator: (Widget child, int index, Animation<double> animation) {
                return Material(
                  color: Colors.transparent,
                  child: Opacity(
                    opacity: 0.5,
                    child: child,
                  ),
                );
              },
              itemBuilder: (context, index) {
                // ✅ 리스트 마지막에 버튼 추가
                if (index == _places.length) {
                  return Container(
                    key: const ValueKey('add_button'),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: TextButton(
                      onPressed: () {
                        // 장소 추가 로직
                      },
                      child: Text(
                        AppStrings.addPlan,
                        style: context.textStyles.body1.copyWith(
                          color: AppColors.gray200,
                        ),
                      ),
                    ),
                  );
                }

                final place = _places[index];
                return Container(
                  key: ValueKey(index),
                  margin: index == _places.length - 1
                      ? EdgeInsets.zero
                      : EdgeInsets.only(bottom: 20.h),
                  child: PlannerEditListTile(
                    category: '한식',
                    title: place.placeTitle,
                    address: place.placeAddress,
                    index: index,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
