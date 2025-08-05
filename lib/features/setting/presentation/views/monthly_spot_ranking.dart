import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

import '../../../../core/constants/ui_status.dart';
import '../viewmodels/monthly_spot_ranking_view_model.dart';

class MonthlySpotRanking extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onBack;
  final SpotMonthResponse spots;

  const MonthlySpotRanking({
    super.key,
    required this.scrollController,
    required this.onBack,
    required this.spots,
  });

  @override
  ConsumerState<MonthlySpotRanking> createState() => _MonthlySpotRankingState();
}

class _MonthlySpotRankingState extends ConsumerState<MonthlySpotRanking> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(monthlySpotRankingViewModelProvider.notifier)
          .fetchRanking(spotId: widget.spots.spotId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(monthlySpotRankingViewModelProvider);

    if (state.status == UiStatus.loading || state.status == UiStatus.idle) {
      return CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          _buildStaticHeader(context),
          const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    if (state.status == UiStatus.error) {
      return CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          _buildStaticHeader(context),
          SliverFillRemaining(
            child: Center(child: Text('Error: ${state.errorMessage}')),
          ),
        ],
      );
    }
    final myTravelType = state.myTravelType;
    final myTypeVisitCount = state.myTypeVisitCount;

    TravelType getTravelTypeFromString(String value) {
      return TravelType.values.firstWhere(
        (e) => e.name == value,
        orElse: () => TravelType.ACTIVITY,
      );
    }

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        _buildStaticHeader(context),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.spotRank,
                  style: context.textStyles.label1
                      .copyWith(color: AppColors.gray500),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray200),
                    children: [
                      const TextSpan(text: '같은 유형이 '),
                      TextSpan(
                        text: '$myTypeVisitCount명',
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.primary),
                      ),
                      const TextSpan(text: ' 참여했습니다!'),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Text(AppStrings.rank,
                        style: context.textStyles.caption1
                            .copyWith(color: AppColors.gray200)),
                    SizedBox(width: 17.w),
                    Text(AppStrings.type,
                        style: context.textStyles.caption1
                            .copyWith(color: AppColors.gray200)),
                    const Spacer(),
                    Text(AppStrings.participant,
                        style: context.textStyles.caption1
                            .copyWith(color: AppColors.gray200)),
                  ],
                ),
                Divider(height: 1.h, thickness: 1.h, color: AppColors.gray100),
              ],
            ),
          ),
        ),
        SliverList.builder(
          itemCount: state.fullRankingList.length,
          itemBuilder: (context, index) {
            final rankInfo = state.fullRankingList[index];
            final travelType = getTravelTypeFromString(rankInfo.categoryType);
            Color textColor;

            if (myTravelType != null && travelType == myTravelType) {
              textColor = AppColors.primary;
            } else {
              textColor = AppColors.gray500;
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 24.r,
                    height: 24.r,
                    child: Center(
                      child: Text(
                        rankInfo.visitCount == 0 ? '-' : '${index + 1}',
                        style: context.textStyles.label3
                            .copyWith(color: textColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Text(
                    travelType.type,
                    style: context.textStyles.body1.copyWith(color: textColor),
                  ),
                  const Spacer(),
                  Text(
                    '${rankInfo.visitCount}명',
                    style:
                        context.textStyles.headLine4.copyWith(color: textColor),
                  ),
                ],
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 40.h),
        ),
      ],
    );
  }

  Widget _buildStaticHeader(BuildContext context) {
    final String iconPath = widget.spots.visited
        ? IconPath.spotCheck
        : IconPath.spotUncheck;
    return SliverMainAxisGroup(
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
                        onPressed: widget.onBack,
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
                                widget.spots.title,
                                style: context.textStyles.headLine3
                                    .copyWith(color: AppColors.gray500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 4.w),
                              SizedBox(
                                height: 24.r,
                                width: 24.r,
                                child: SvgPicture.asset(
                                  iconPath,
                                  width: 24.r,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            widget.spots.address,
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
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
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
