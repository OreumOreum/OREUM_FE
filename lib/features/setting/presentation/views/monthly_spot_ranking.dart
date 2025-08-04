import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/monthly_spot.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/travel_type.dart';

class MonthlySpotRanking extends StatelessWidget {
  final Spot spot;
  final ScrollController scrollController;
  final VoidCallback onBack;

  const MonthlySpotRanking({
    super.key,
    required this.spot,
    required this.scrollController,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    const TravelType myTravelType = TravelType.ACTIVITY;
    final List<SpotRankInfo> dummyRanking = [
      const SpotRankInfo(rank: 1, categoryType: 'ACTIVITY', visitCount: 15),
      const SpotRankInfo(rank: 2, categoryType: 'NATURE', visitCount: 10),
      const SpotRankInfo(rank: 3, categoryType: 'MOOD', visitCount: 7),
      const SpotRankInfo(rank: 4, categoryType: 'FOOD', visitCount: 3),
    ];
    final apiDataMap = {
      for (var item in dummyRanking) item.categoryType.toLowerCase(): item
    };

    final List<SpotRankInfo> fullRankingList =
        TravelType.values.map((travelType) {
      final typeName = travelType.name.toLowerCase();

      if (apiDataMap.containsKey(typeName)) {
        return apiDataMap[typeName]!;
      } else {
        return SpotRankInfo(
          rank: 0,
          categoryType: typeName.toUpperCase(),
          visitCount: 0,
        );
      }
    }).toList();

    fullRankingList.sort((a, b) => b.visitCount.compareTo(a.visitCount));
    TravelType getTravelTypeFromString(String value) {
      final lowerValue = value.toLowerCase();
      return TravelType.values.firstWhere(
        (e) => e.name == lowerValue,
        orElse: () => TravelType.ACTIVITY,
      );
    }

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverHandleDelegate(
            height: 42.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                child: Row(
                  children: [
                    SizedBox(
                      height: AppSizes.iconSM,
                      width: AppSizes.iconSM,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          onBack();
                        },
                        icon: SvgPicture.asset(
                          IconPath.backAppBar,
                          width: 11.r,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                spot.title,
                                style: context.textStyles.headLine3
                                    .copyWith(color: AppColors.gray500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 4.w),
                              SizedBox(
                                height: 24.r,
                                width: 24.r,
                                child: SvgPicture.asset(
                                  IconPath.spotCheck,
                                  width: 24.r,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            spot.address,
                            textAlign: TextAlign.center,
                            style: context.textStyles.body1
                                .copyWith(color: AppColors.gray200),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.iconSM,
                    ),
                  ],
                ),
              ),
              Divider(height: 1.h, thickness: 1.h, color: AppColors.gray100),
              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.spotRank,
                      style: context.textStyles.label1
                          .copyWith(color: AppColors.gray500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // 제목과 아이콘 사이의 간격
                    SizedBox(height: 4.h),
                    Text(
                      AppStrings.spotRank,
                      style: context.textStyles.label1
                          .copyWith(color: AppColors.gray200),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Text(
                          AppStrings.rank,
                          style: context.textStyles.caption1
                              .copyWith(color: AppColors.gray200),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 17.w),
                        Text(
                          AppStrings.type,
                          style: context.textStyles.caption1
                              .copyWith(color: AppColors.gray200),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          AppStrings.participant,
                          style: context.textStyles.caption1
                              .copyWith(color: AppColors.gray200),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Divider(
                        height: 1.h, thickness: 1.h, color: AppColors.gray100),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: fullRankingList.length,
                itemBuilder: (context, index) {
                  final rankInfo = fullRankingList[index];
                  final travelType =
                  getTravelTypeFromString(rankInfo.categoryType);
                  Color textColor;
                  if (travelType == myTravelType) {
                    textColor = AppColors.primary;
                  }else {
                    textColor = AppColors.gray500;
                  }


                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                            child: Text(
                              rankInfo.rank == 0 ? '-' : '${rankInfo.rank}',
                              style: context.textStyles.label3
                                  .copyWith(color: textColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Text(
                          travelType.type,
                          style: context.textStyles.body1
                              .copyWith(color: textColor),
                        ),
                        const Spacer(),
                        Text(
                          '${rankInfo.visitCount}명',
                          style: context.textStyles.headLine4
                              .copyWith(color: textColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverHandleDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  _SliverHandleDelegate({required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Container(
            height: 4.0,
            width: 42.0,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(_SliverHandleDelegate oldDelegate) {
    return height != oldDelegate.height;
  }
}
