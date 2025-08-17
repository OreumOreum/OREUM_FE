import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/monthly_spot_detail_view_model.dart';
import 'package:oreum_fe/features/setting/presentation/widgets/monthly_spot_list_tile.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/widgets/error_widget.dart';

class MonthlySpotDetail extends ConsumerStatefulWidget {
  final int year;
  final int month;

  const MonthlySpotDetail({
    super.key,
    required this.year,
    required this.month,
  });

  @override
  ConsumerState<MonthlySpotDetail> createState() => _MonthlySpotDetailState();
}

class _MonthlySpotDetailState extends ConsumerState<MonthlySpotDetail> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(monthlySpotDetailViewModelProvider.notifier).initiallizeMonthlySpot(
        widget.year.toString(),
        widget.month.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(monthlySpotDetailViewModelProvider);

    if (state.status == UiStatus.loading) {
      return Scaffold(body: Center(child: Lottie.asset(AnimationPath.loading, repeat: true, width: 150.w)));
    }
    if (state.status == UiStatus.error) {
      return Center(child: ErrorRetryWidget(
        onPressed: () {
          ref.read(monthlySpotDetailViewModelProvider.notifier).initiallizeMonthlySpot(
            widget.year.toString(),
            widget.month.toString(),
          );
        },
      ));
    }

    final List<SpotMonthResponse> spotsByMonth = state.spotsByMonth;
    const fixedDisplayTexts = ['서귀포시', '서귀포시', '제주시', '제주시'];

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultPadding, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.year}년 ${widget.month.toString().padLeft(2, '0')}월',
                      style: context.textStyles.headLine4
                          .copyWith(color: AppColors.gray500)),
                  SizedBox(height: 4.h),
                  Text(AppStrings.monthlySpotCheck(widget.month.toString()),
                      style: context.textStyles.label4
                          .copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            Container(
              color: AppColors.gray100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 14.r,
                      height: 14.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 4.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '${widget.month}월',
                      style: context.textStyles.label3.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      width: 42.w,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: spotsByMonth.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final SpotMonthResponse spot = entry.value;

                          Widget circleContent;
                          Color borderColor;
                          double borderWidth;

                          if (spot.visited) {
                            borderColor = AppColors.primary;
                            borderWidth = 3.r;
                            circleContent = SvgPicture.asset(
                              IconPath.oreumStamp,
                            );
                          } else {
                            final String displayText = fixedDisplayTexts[index];
                            borderColor = AppColors.gray200;
                            borderWidth = 2.r;
                            circleContent = Text(
                              displayText,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.caption1.copyWith(
                                color: AppColors.gray300,
                              ),
                            );
                          }

                          return Container(
                            width: 60.r,
                            height: 60.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                color: borderColor,
                                width: borderWidth,
                              ),
                            ),
                            child: Center(
                              child: circleContent,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Divider(height: 1.h, thickness: 1.h, color: AppColors.gray200),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: spotsByMonth.length,
                itemBuilder: (context, index) {
                  final spot = spotsByMonth[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        RoutePath.monthlySpotMap,
                        extra: {
                          'year': widget.year,
                          'month': widget.month,
                          'placeId' : spot.placeId,
                          'spots' : spotsByMonth,
                        },
                      );
                    },
                    child: MonthlySpotListTile(
                      title: spot.title,
                      address: spot.address,
                      isVisit: spot.visited,
                      sigungu: fixedDisplayTexts[index],
                      thumbnailImage: spot.thumbnailImage,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}