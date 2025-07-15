import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_detail.dart';
import 'package:oreum_fe/features/setting/presentation/widgets/monthly_list_tile.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/destination.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/montly_badge.dart';

class MonthlySpot extends StatefulWidget {
  const MonthlySpot({super.key});

  @override
  State<MonthlySpot> createState() => _MonthlySpotState();
}

class _MonthlySpotState extends State<MonthlySpot> {
  late List<int> yearList;
  int? _selectedYear;


  late Future<Map<int, List<Destination>?>> _monthlyDataFuture;

  @override
  void initState() {
    super.initState();
    final int currentYear = DateTime.now().year;

    yearList =
        List.generate(currentYear - 2024 + 1, (index) => currentYear - index);

    _selectedYear = currentYear;

    _monthlyDataFuture = _fetchMonthlyData(_selectedYear!);
  }

  /// API를 호출하여 특정 연도의 월별 여행지 데이터를 가져오는 함수
  Future<Map<int, List<Destination>?>> _fetchMonthlyData(int year) async {

    await Future.delayed(const Duration(milliseconds: 500));

    final Map<int, List<Destination>?> dummyData2024 = {
      1: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      2: [
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
      ],
      3: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      4: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      5: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      6: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      7: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      8: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      9: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      10: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      11: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      12: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
      ],
    };

    // 2025년 (현재 연도) 데이터
    final Map<int, List<Destination>?> dummyData2025 = {
      1: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      2: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      3: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      4: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      5: [
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      6: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
      ],
      7: [
        Destination(sigunguCode: '3', isVisited: false),
        Destination(sigunguCode: '3', isVisited: true),
        Destination(sigunguCode: '4', isVisited: false),
        Destination(sigunguCode: '4', isVisited: true),
      ],
      8: null,
      9: null,
      10: null,
      11: null,
      12: null,
    };

    if (year == 2024) {
      return dummyData2024;
    }
    return dummyData2025;
  }

  /// 연도를 탭했을 때 데이터를 다시 불러오는 함수
  void _onYearSelected(int year) {
    setState(() {
      _selectedYear = year;
      _monthlyDataFuture = _fetchMonthlyData(year);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> ownedBadgeNamesFromApi = ['lucky', 'travelhunter'];
    final List<MontlyBadge> monthlyBadge = MontlyBadge.values.toList();
    monthlyBadge.sort((a, b) {
      final bool aIsOwned = ownedBadgeNamesFromApi.contains(a.name);
      final bool bIsOwned = ownedBadgeNamesFromApi.contains(b.name);
      if (aIsOwned && !bIsOwned) return -1;
      if (!aIsOwned && bIsOwned) return 1;
      return 0;
    });

    const ColorFilter grayscaleFilter = ColorFilter.matrix(<double>[
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0, 0, 0, 1, 0,
    ]);

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SingleChildScrollView(
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
                    final category = monthlyBadge[index];
                    final bool isOwned = ownedBadgeNamesFromApi.contains(category.name);
                    return Padding(
                      padding: EdgeInsets.only(right: index == monthlyBadge.length - 1 ? 0 : 10.w),
                      child: GestureDetector(
                        onTap: () => print('${category.label} tapped'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 62.h,
                              width: 92.w,
                              child: Center(
                                child: SvgPicture.asset(IconPath.cloud, width: category.iconWidth, height: category.iconHeight, colorFilter: isOwned ? null : grayscaleFilter),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(category.label, style: context.textStyles.body1.copyWith(color: isOwned ? AppColors.primary : AppColors.gray300)),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding, vertical: 14.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(yearList.length, (index) {
                    final year = yearList[index];
                    final bool isSelected = (year == _selectedYear);
                    return Padding(
                      padding: EdgeInsets.only(right: index == yearList.length - 1 ? 0 : 10.w),
                      child: GestureDetector(
                        onTap: () => _onYearSelected(year),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.gray200,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Text('$year년', style: context.textStyles.body1.copyWith(color: Colors.white)),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Divider(height: 1.h, thickness: 1.h, color: AppColors.gray200),

            FutureBuilder<Map<int, List<Destination>?>>(
              future: _monthlyDataFuture,
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(child: Text('데이터를 불러오는 데 실패했습니다: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.values.every((v) => v == null)) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('해당 연도에 표시할 데이터가 없습니다.'),
                    ),
                  );
                }


                final monthlyData = snapshot.data!;
                final int currentMonth = DateTime.now().month;


                final List<int> availableMonths = monthlyData.keys.where((month) => monthlyData[month] != null).toList();


                availableMonths.sort((a, b) => b.compareTo(a));


                return Column(
                  children: availableMonths.map((month) {
                    final Color backgroundColor = (month % 2 == 0)
                        ? AppColors.gray100
                        : Colors.white;


                    return GestureDetector(
                      onTap: () {

                        context.push(
                          RoutePath.monthlySpotDetail,
                          extra: {
                            'year': _selectedYear!,
                            'month': month,
                          },
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        color: backgroundColor,
                        child: MonthlyListTile(
                          month: month.toString(),
                          destinations: monthlyData[month]!,
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
    );
  }
}
