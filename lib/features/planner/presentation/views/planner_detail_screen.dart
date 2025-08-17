import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/features/place/data/models/planner_place.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_planner_marker.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_tab_bar.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_menu_modal.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'tab_screens/planner_detail_tab_screen.dart';

class PlannerDetailScreen extends ConsumerStatefulWidget {
  final String plannerId;
  final String plannerName;

  const PlannerDetailScreen({
    super.key,
    required this.plannerId,
    required this.plannerName,
  });

  @override
  ConsumerState<PlannerDetailScreen> createState() =>
      _PlannerDetailScreenState();
}

class _PlannerDetailScreenState extends ConsumerState<PlannerDetailScreen> {
  GoogleMapController? _mapController;
  late TabController _tabController;
  Set<Marker> _markers = {};

  final String _mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      { "color": "#f5f2e7" }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#4b4b4b" }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      { "color": "#ffffff" },
      { "weight": 2 }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#8edce6" }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#007d8f" }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      { "color": "#b5e3b2" }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#3f7d3a" }
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      { "color": "#ffffff" }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffd28d" }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#f5b45b" }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffeecd" }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffffff" }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      { "color": "#d8f0f0" }
    ]
  }
]
  ''';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(plannerDetailViewModelProvider.notifier)
          .getPlannerPlace(widget.plannerId);
    });
  }

  void showPlannerMenuModal(BuildContext context, String plannerId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return PlannerMenuModal(
          plannerId: plannerId,
          isDetail: true,
        );
      },
    );
  }

  Future<void> fitAllMarkers(List<LatLng> positions, GoogleMapController controller) async {
    if (positions.isEmpty) return;

    // 위치가 1개인 경우 단일 마커로 줌
    if (positions.length == 1) {
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(positions.first, 16), // 15 -> 16으로 더 가깝게
      );
      return;
    }

    double south = positions.first.latitude;
    double north = positions.first.latitude;
    double west = positions.first.longitude;
    double east = positions.first.longitude;

    for (LatLng pos in positions) {
      if (pos.latitude < south) south = pos.latitude;
      if (pos.latitude > north) north = pos.latitude;
      if (pos.longitude < west) west = pos.longitude;
      if (pos.longitude > east) east = pos.longitude;
    }

    // 범위가 너무 작으면 최소 크기 보장
    double latDiff = north - south;
    double lngDiff = east - west;

    // 최소 범위 설정 (약 1km 정도)
    const double minRange = 0.01; // 약 1km

    if (latDiff < minRange) {
      double center = (north + south) / 2;
      north = center + minRange / 2;
      south = center - minRange / 2;
    }

    if (lngDiff < minRange) {
      double center = (east + west) / 2;
      east = center + minRange / 2;
      west = center - minRange / 2;
    }

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(south, west),
      northeast: LatLng(north, east),
    );

    await controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50)); // padding 100 -> 50으로 줄임
  }

  // 마커 생성 함수
  Future<void> _createMarkers(List<PlannerDetailResponse> places) async {
    final Set<Marker> newMarkers = {};

    for (int index = 0; index < places.length; index++) {
      final place = places[index];
      if (place.mapX != null && place.mapY != null) {
        final marker = Marker(
          icon: await CustomPlannerMarker(index: index + 1).toBitmapDescriptor(),
          markerId: MarkerId(
            '$index-${place.plannerId}-${place.mapX}-${place.mapY}',
          ),
          position: LatLng(place.mapY!, place.mapX!),
        );
        newMarkers.add(marker);
      }
    }

    if (mounted) {
      setState(() {
        _markers = newMarkers;
      });
    }
  }

  // 데이터 변경 감지 및 카메라 업데이트
  void _refreshMapIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentDay = ref.read(currentSelectedDayProvider);
      _moveCameraToDay(currentDay);
    });
  }

  // 특정 날짜의 장소들로 카메라 이동
  Future<void> _moveCameraToDay(int day) async {
    if (_mapController == null) return;

    final notifier = ref.read(plannerDetailViewModelProvider.notifier);
    final places = notifier.getPlacesByDay(day);

    // 마커 업데이트
    await _createMarkers(places);

    final positions = places
        .where((place) => place.mapX != null && place.mapY != null)
        .map((place) => LatLng(place.mapY!, place.mapX!))
        .toList();

    if (positions.isNotEmpty) {
      await fitAllMarkers(positions, _mapController!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerDetailViewModelProvider);
    final notifier = ref.read(plannerDetailViewModelProvider.notifier);

    // 데이터 변경 감지를 위한 리스너 (장소 데이터가 변경되면 지도 새로고침)
    ref.listen(plannerDetailViewModelProvider, (previous, next) {
      if (previous?.plannerPlaces != next.plannerPlaces) {
        _refreshMapIfNeeded();
      }
    });

    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: CustomAppBar.backWithButtonAndText(
          title: state.plannerName ?? widget.plannerName,
          onActionPressed: () {
            showPlannerMenuModal(context, widget.plannerId);
          },
          actionType: ActionType.dots,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 56.h),
            child:
            Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
          ),
        ),
      );
    }

    if (state.status == UiStatus.error) {
      return Scaffold(
        appBar: CustomAppBar.backWithText(
            title: state.plannerName ?? widget.plannerName),
        body: ErrorRetryWidget(onPressed: () {
          ref
              .read(plannerDetailViewModelProvider.notifier)
              .getPlannerPlace(widget.plannerId);
        },),
      );
    }

    List<int> uniqueDays = notifier.getUniqueDays();

    return DefaultTabController(
      length: uniqueDays.length,
      child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context)!;

            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                final newDay = uniqueDays[tabController.index];
                ref.read(currentSelectedDayProvider.notifier).state = newDay;

                // 탭이 변경될 때 카메라도 해당 날짜 위치들로 이동
                _moveCameraToDay(newDay);
              }
            });

            return Scaffold(
              appBar: CustomAppBar.backWithButtonAndText(
                  title: state.plannerName ?? widget.plannerName,
                  actionType: ActionType.dots,
                  onActionPressed: () {
                    showPlannerMenuModal(context, widget.plannerId);
                  }),
              body: SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      // 스크롤 시 사라질 공간
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 200.h, // 원하는 높이로 조정
                          child: Consumer(
                            builder: (context, ref, _) {
                              final currentDay =
                              ref.watch(currentSelectedDayProvider);
                              final places = ref
                                  .read(plannerDetailViewModelProvider.notifier)
                                  .getPlacesByDay(currentDay);

                              // 초기 마커 생성
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _createMarkers(places);
                              });

                              return GoogleMap(
                                style: _mapStyle,
                                scrollGesturesEnabled: true,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: false,
                                myLocationButtonEnabled: false,
                                mapToolbarEnabled: false,
                                compassEnabled: false,
                                indoorViewEnabled: false,
                                trafficEnabled: false,
                                buildingsEnabled: false,

                                onMapCreated: (controller) async {
                                  _mapController = controller;

                                  final positions = places
                                      .where((place) => place.mapX != null && place.mapY != null)
                                      .map((place) => LatLng(place.mapY!, place.mapX!))
                                      .toList();

                                  if (positions.isNotEmpty) {
                                    await fitAllMarkers(positions, controller);
                                  }
                                },
                                initialCameraPosition: CameraPosition(
                                  target: places.isNotEmpty && places.first.mapY != null && places.first.mapX != null
                                      ? LatLng(places.first.mapY!, places.first.mapX!)
                                      : LatLng(33.5563, 126.7958), // 제주도 중심 좌표
                                  zoom: 16, // 14 -> 16으로 더 가깝게
                                ),
                                markers: _markers, // 상태로 관리되는 마커 사용
                              );
                            },
                          ),
                        ),
                      ),
                      // 고정될 탭바
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          height: 51.h,
                          child: Container(
                            height: 51.h,
                            color: Colors.transparent,
                            child: CustomTabBar(
                              tabs: uniqueDays
                                  .map(
                                    (day) => Tab(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      AppStrings.day(day),
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: uniqueDays.map((day) {
                      final places = notifier.getPlacesByDay(day);
                      return PlannerDetailTabScreen(
                        places: places,
                        day: day,
                        plannerId: widget.plannerId,
                        plannerName: widget.plannerName,
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverAppBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}