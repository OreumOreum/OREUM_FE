import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

import '../viewmodels/monthly_spot_map_view_model.dart';
import '../viewmodels/states/monthly_spot_map_state.dart';
import '../widgets/monthly_spot_list_tile.dart';
import 'monthly_spot_ranking.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class ProximityBanner extends StatelessWidget {
  final MonthlySpotMapState spotState;

  const ProximityBanner({super.key, required this.spotState});

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Color textColor;
    String message;
    if (spotState.isProximity && spotState.proximateSpot != null) {
      iconPath = IconPath.spotCheck;
      message = '${spotState.proximateSpot!.title}에 도착하였습니다!';
      textColor = AppColors.tag1;
    } else {
      iconPath = IconPath.spotWarning;
      message = '원 안으로 이동한 후 이용해주세요';
      textColor = AppColors.primary;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(41.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 18.r,
            height: 18.r,
            child: SvgPicture.asset(
              iconPath,
              width: 18.r,
              height: 18.r,
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              message,
              style: context.textStyles.label4.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
class MonthlySpotMap extends ConsumerStatefulWidget {
  final int year;
  final int month;
  final List<SpotMonthResponse> spots;
  final int? initialSelectedPlaceId;

  const MonthlySpotMap({
    super.key,
    required this.year,
    required this.month,
    required this.spots,
    this.initialSelectedPlaceId,
  });

  @override
  ConsumerState<MonthlySpotMap> createState() => _MonthlySpotMapState();
}

class _MonthlySpotMapState extends ConsumerState<MonthlySpotMap> {
  late final CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    print('--- 지도 화면 initState 디버깅 ---');
    print('전달받은 ID (initialSelectedPlaceId): ${widget.initialSelectedPlaceId}');
    print('전체 스팟 ID 목록: ${widget.spots.map((s) => s.placeId).toList()}');
    SpotMonthResponse? initialSpot;

    if (widget.initialSelectedPlaceId != null) {
      try {
        initialSpot = widget.spots.firstWhere(
              (spot) => spot.placeId == widget.initialSelectedPlaceId,
        );
      } catch (e) {
        initialSpot = null;
      }
    }
    initialSpot ??= widget.spots.isNotEmpty ? widget.spots.first : null;
    if (initialSpot != null) {
      _initialCameraPosition = CameraPosition(
        target: LatLng(initialSpot.mapY, initialSpot.mapX),
        zoom: 15.0,
      );
    } else {
      _initialCameraPosition = const CameraPosition(
        target: LatLng(33.361665, 126.529165),
        zoom: 9.5,
      );
    }

    if (initialSpot != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref
              .read(monthlySpotMapViewModelProvider(spots: widget.spots).notifier)
              .selectSpot(initialSpot!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final spotState =
    ref.watch(monthlySpotMapViewModelProvider(spots: widget.spots));
    final spotViewModel =
    ref.read(monthlySpotMapViewModelProvider(spots: widget.spots).notifier);

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: spotViewModel.setMapController,
                      markers: spotState.markers,
                      circles: spotState.circles,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      onTap: (_) => spotViewModel.clearSelection(),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double minSheetHeight = 140.h;
                        final double minChildSize = constraints.maxHeight > 0
                            ? minSheetHeight / constraints.maxHeight
                            : 0.1;

                        return DraggableScrollableSheet(
                          initialChildSize: minChildSize,
                          minChildSize: minChildSize,
                          maxChildSize: 0.7,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned.fill(
                                  top: 56.h,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(42.r)),
                                    ),
                                    child: spotState.selectedSpot == null
                                        ? _buildSpotList(
                                      scrollController,
                                      spotState.spots,
                                      spotViewModel,
                                    )
                                        : MonthlySpotRanking(
                                      scrollController: scrollController,
                                      onBack:
                                      spotViewModel.clearSelection,
                                      spots: spotState.selectedSpot!,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 14.w,
                                  child: GestureDetector(
                                    onTap:
                                    spotViewModel.centerOnCurrentLocation,
                                    child: Center(
                                      child: SizedBox(
                                        width: 42.w,
                                        height: 42.h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 5.r,
                                              )
                                            ],
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              IconPath.myLocation,
                                              width: 22.r,
                                              height: 22.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              // 하단 여백
              Container(
                height: 70.h,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            left: 14.w,
            right: 14.w,
            bottom: 42.h,
            child: SizedBox(
              height: 58.h,
              child: ElevatedButton(
                onPressed: spotViewModel.onStampButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (spotState.isProximity &&
                      spotState.proximateSpot != null &&
                      !spotState.proximateSpot!.visited)
                      ? AppColors.primary
                      : Colors.grey,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.h),
                  ),
                ),
                child: Text(
                  (spotState.proximateSpot?.visited ?? false)
                      ? '이미 방문한 여행지'
                      : AppStrings.stamp,
                  style: context.textStyles.label3
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: ProximityBanner(spotState: spotState),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpotList(
      ScrollController scrollController,
      List<SpotMonthResponse> spots,
      MonthlySpotMapViewModel viewModel,
      ) {
    const fixedDisplayTexts = ['서귀포시', '서귀포시', '제주시', '제주시'];
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14.h,
                ),
                Text(AppStrings.monthlySpot,
                    style: context.textStyles.headLine4
                        .copyWith(color: AppColors.gray500)),
                SizedBox(height: 4.h),
                Builder(
                  builder: (context) {
                    final now = DateTime.now();
                    if (widget.year == now.year && widget.month == now.month) {
                      final lastDayOfMonth =
                      DateTime(now.year, now.month + 1, 0);
                      final remainingDays = lastDayOfMonth.day - now.day;
                      return RichText(
                        text: TextSpan(
                          style: context.textStyles.label4,
                          children: <TextSpan>[
                            TextSpan(
                                text: '이달의 여행지 마감까지 ',
                                style: const TextStyle(color: AppColors.gray200)),
                            TextSpan(
                                text: '$remainingDays일',
                                style: const TextStyle(color: AppColors.primary)),
                            TextSpan(
                                text: ' 남았습니다.',
                                style: const TextStyle(color: AppColors.gray200)),
                          ],
                        ),
                      );
                    } else {
                      return Text(
                          AppStrings.monthlySpotCheck(widget.month.toString()),
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.primary));
                    }
                  },
                ),
                SizedBox(
                  height: 14.h,
                ),
              ],
            ),
          ),
        ),
        SliverList.builder(
          itemCount: spots.length,
          itemBuilder: (context, index) {
            final spot = spots[index];
            return GestureDetector(
              onTap: () {
                viewModel.selectSpot(spot);
              },
              child: MonthlySpotListTile(
                title: spot.title,
                address: spot.address,
                isVisit: spot.visited,
                thumbnailImage:
                'http://tong.visitkorea.or.kr/cms/resource/05/2850905_image2_1.jpg',
                sigungu: fixedDisplayTexts[index],
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 42.h),
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