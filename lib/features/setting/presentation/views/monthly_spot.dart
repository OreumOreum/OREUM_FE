import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/monthly_spot_view_model.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/states/monthly_spot_state.dart';
import 'package:oreum_fe/features/setting/presentation/widgets/monthly_list_tile.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/montly_badge.dart';
import '../viewmodels/setting_view_model.dart';

class MonthlySpot extends ConsumerStatefulWidget {
  const MonthlySpot({super.key});

  @override
  ConsumerState<MonthlySpot> createState() => _MonthlySpotState();
}

class _MonthlySpotState extends ConsumerState<MonthlySpot> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(monthlySpotViewModelProvider.notifier).initiallizeMonthlySpot();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(monthlySpotViewModelProvider);
    final settingState = ref.watch(settingViewModelProvider);
    final int currentYear = DateTime.now().year;

    if (state.status == MonthlySpotStatus.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (state.status == MonthlySpotStatus.error) {
      return Scaffold(body: Center(child: Text('error: ${state.errorMessage}')));
    }

    final Map<String, List<SpotResponse>> spotsByMonth = state.spotsByMonth;


    final List<MontlyBadge> monthlyBadge = settingState.earnedBadges;

    const ColorFilter grayscaleFilter = ColorFilter.matrix(<double>[
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0, 0, 0, 1, 0,
    ]);

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultPadding, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.monthlySpot, style: context.textStyles.headLine4.copyWith(color: AppColors.gray500)),
                    SizedBox(height: 4.h),
                    Text(AppStrings.collectStamp, style: context.textStyles.label4.copyWith(color: AppColors.primary)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding, vertical: 14.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(monthlyBadge.length, (index) {
                      final badge = monthlyBadge[index];
                      return Padding(
                        padding: EdgeInsets.only(right: index == monthlyBadge.length - 1 ? 0 : 10.w),
                        child: GestureDetector(
                          onTap: () => print('${badge.label} tapped'),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 62.h,
                                width: 92.w,
                                child: Center(
                                  child: SvgPicture.asset(badge.iconPath, width: badge.iconWidth, height: badge.iconHeight),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(badge.label, style: context.textStyles.label4.copyWith(color: AppColors.primary)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 14.h),

              // 1. 연도 선택 UI를 고정된 텍스트로 변경
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultPadding, vertical: 14.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text('$currentYear년',
                      style: context.textStyles.body1.copyWith(color: Colors.white)),
                ),
              ),

              Divider(height: 1.h, thickness: 1.h, color: AppColors.gray200),

              Builder(
                builder: (context) {
                  final int currentMonth = DateTime.now().month;
                  final List<int> allMonthsToShow =
                  List.generate(currentMonth, (index) => index + 1);
                  allMonthsToShow.sort((a, b) => b.compareTo(a));

                  if (allMonthsToShow.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text('올해의 데이터가 없습니다.'),
                      ),
                    );
                  }

                  return Column(
                    children: allMonthsToShow.map((month) {
                      final Color backgroundColor = (month % 2 == 0)
                          ? AppColors.gray100
                          : Colors.white;

                      final List<SpotResponse> monthSpots =
                          spotsByMonth[month.toString()] ?? [];

                      return GestureDetector(
                        onTap: () {
                          context.push(
                            RoutePath.monthlySpotDetail,
                            extra: {
                              'year': currentYear,
                              'month': month,
                            },
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          color: backgroundColor,
                          child: MonthlyListTile(
                            month: month.toString(),
                            spots: monthSpots,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}