import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/monthly_spot.dart';
import '../widgets/monthly_spot_list_tile.dart';
import 'monthly_spot_ranking.dart'; // 분리된 위젯 import

class MonthlySpotMap extends StatefulWidget {
  final int year;
  final int month;

  const MonthlySpotMap({
    super.key,
    required this.year,
    required this.month,
  });

  @override
  State<MonthlySpotMap> createState() => _MonthlySpotMapState();
}

class _MonthlySpotMapState extends State<MonthlySpotMap> {
  // 선택된 장소를 저장하기 위한 상태 변수
  Spot? _selectedSpot;

  // 상세 정보에서 리스트로 돌아가기 위한 함수
  void _clearSelection() {
    setState(() {
      _selectedSpot = null;
    });
  }

  // 리스트에서 항목을 선택했을 때 상태를 변경하는 함수
  void _selectSpot(Spot spot) {
    setState(() {
      _selectedSpot = spot;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Spot> dummySpots = [
      // ... 더미 데이터 생략 ...
      const Spot(
        spotId: 5,
        placeId: 4,
        title: '가메창(암메)',
        address: '제주특별자치도 서귀포시 한경면 청수로 13-3',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 3,
        isVisit: true,
      ),
      const Spot(
        spotId: 6,
        placeId: 6,
        title: '가시어멍김밥',
        address: '제주특별자치도 서귀포시 월랑로 36',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 3,
        isVisit: false,
      ),
      const Spot(
        spotId: 7,
        placeId: 7,
        title: '갈치공장',
        address: '제주특별자치도 제주시 해맞이해안로 1296',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/24/2853424_image2_1.jpg',
        sigunguCode: 4,
        isVisit: false,
      ),
      const Spot(
        spotId: 8,
        placeId: 8,
        title: '감나무집',
        address: '제주특별자치도 제주시 오남로 12',
        thumbnailImage:
        'http://tong.visitkorea.or.kr/cms/resource/75/2837175_image2_1.jpg',
        sigunguCode: 4,
        isVisit: true,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // 지도 위젯
                    Container(
                      color: Colors.blueGrey.shade100,
                      child: Center(
                        child: Text(
                          '지도 화면\n(${widget.year}년 ${widget.month}월)',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double handleHeight = 42.h;
                        final double minSheetHeight = 140.h;

                        final double minChildSize = constraints.maxHeight > 0
                            ? minSheetHeight / constraints.maxHeight
                            : 0.1;

                        return DraggableScrollableSheet(
                          initialChildSize: 0.7,
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
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(42)),
                                    ),
                                    // [수정] 상태에 따라 다른 위젯을 보여줍니다.
                                    child: _selectedSpot == null
                                        ? _buildSpotList(
                                        scrollController, dummySpots)
                                        : MonthlySpotRanking(
                                      spot: _selectedSpot!,
                                      scrollController:
                                      scrollController,
                                      onBack:
                                      _clearSelection, // 뒤로가기 함수 전달
                                    ),
                                  ),
                                ),
                                // 오른쪽 위 '내 위치' 버튼
                                Positioned(
                                  right: 14.w,
                                  child: SizedBox(
                                    width: 42.w,
                                    height: 42.h,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        shape: BoxShape.circle,
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
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 70.h,
                color: Colors.white,
              ),
            ],
          ),
          // 하단 '스탬프 찍기' 버튼
          Positioned(
            left: 14.w,
            right: 14.w,
            bottom: 42.h,
            child: SizedBox(
              height: 58.h,
              child: ElevatedButton(
                onPressed: () {
                  print('스탬프 찍기');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.h),
                  ),
                ),
                child: Text(AppStrings.stamp,
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 장소 리스트를 보여주는 위젯
  Widget _buildSpotList(ScrollController scrollController, List<Spot> spots) {
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
                                style: TextStyle(color: AppColors.gray200)),
                            TextSpan(
                                text: '${remainingDays}일',
                                style: TextStyle(color: AppColors.primary)),
                            TextSpan(
                                text: ' 남았습니다.',
                                style: TextStyle(color: AppColors.gray200)),
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final spot = spots[index];
              return GestureDetector(
                onTap: () {
                  _selectSpot(spot);
                },
                child: MonthlySpotListTile(
                  title: spot.title,
                  address: spot.address,
                  thumbnailImage: spot.thumbnailImage,
                  isVisit: spot.isVisit,
                  sigunguCode: spot.sigunguCode,
                ),
              );
            },
            childCount: spots.length,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 42.h),
        ),
      ],
    );
  }
}

/// SliverPersistentHeader를 위한 Delegate 클래스
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