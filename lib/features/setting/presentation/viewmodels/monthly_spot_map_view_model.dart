import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../../core/constants/ui_status.dart';
import 'states/monthly_spot_map_state.dart';

part 'monthly_spot_map_view_model.g.dart';

/// 마커로 변환할 위젯
class CustomTextMarker extends StatelessWidget {
  final String text;
  final bool isVisited;

  const CustomTextMarker({
    super.key,
    required this.text,
    required this.isVisited,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isVisited? AppColors.tag1 : AppColors.gray200,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text,
                  style: context.textStyles.label4
                      .copyWith(color: AppColors.white)),
              SizedBox(
                width: 4.w,
              ),
              SizedBox(
                width: 20.r,
                height: 20.r,
                child: Center(
                  child: SvgPicture.asset(
                    isVisited? IconPath.spotCheckReverse : IconPath.spotUnCheckReverse,
                  ),
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          isVisited? IconPath.spotTriangle : IconPath.spotUnCheckTriangle,
          width: 29.w,),
      ],
    );
  }
}
class SimpleMapMarker extends StatelessWidget {
  final bool isVisited;
  const SimpleMapMarker({super.key, required this.isVisited});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isVisited? IconPath.spotZoomCheck : IconPath.spotZoomUnCheck,
      width: 36.w,);
  }
}
@riverpod
class MonthlySpotMapViewModel extends _$MonthlySpotMapViewModel {
  final double _proximityRadius = 50.0;
  StreamSubscription<Position>? _positionStreamSubscription;
  final double _zoomThreshold = 10.0;

  @override
  MonthlySpotMapState build({
    required List<SpotMonthResponse> spots,
    int? initialSelectedPlaceId,
  }) {
    ref.onDispose(() {
      _positionStreamSubscription?.cancel();
    });

    Future.microtask(() => retryLoadingMarkers());

    _startListeningToLocation();

    SpotMonthResponse? initialSpot;
    if (initialSelectedPlaceId != null) {
      try {
        initialSpot =
            spots.firstWhere((s) => s.placeId == initialSelectedPlaceId);
      } catch (e) {
        // ID not found
      }
    }

    return MonthlySpotMapState(
      status: UiStatus.loading,
      spots: spots,
      markers: {}, // 초기에는 빈 마커 Set
      circles: _createInitialCircles(spots),
      selectedSpot: initialSpot,
    );
  }

  Future<void> retryLoadingMarkers() async {
    //state = state.copyWith(status: UiStatus.loading);

    try {
      final zoom = state.currentZoom;

      final markerFutures = state.spots.map((spot) async {
        final Widget markerWidget = zoom > _zoomThreshold
            ? CustomTextMarker(text: spot.title, isVisited: spot.visited)
            : SimpleMapMarker(isVisited: spot.visited);

        return Marker(
          markerId: MarkerId(spot.spotId.toString()),
          position: LatLng(spot.mapY, spot.mapX),
          icon: await markerWidget.toBitmapDescriptor(),
          onTap: () => selectSpot(spot),
        );
      }).toList();

      final Set<Marker> newMarkers = (await Future.wait(markerFutures)).toSet();

      state = state.copyWith(status: UiStatus.success, markers: newMarkers);

    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }
  Future<void> onCameraIdle() async {
    // 컨트롤러가 없으면 아무것도 하지 않음
    if (state.mapController == null) return;

    // 현재 카메라 위치에서 새로운 줌 레벨을 가져옴
    final newZoom = await state.mapController!.getZoomLevel();
    final oldZoom = state.currentZoom;

    // 줌 레벨이 기준점을 넘나들 때만 마커를 다시 그림 (성능 최적화)
    bool shouldUpdate = (oldZoom > _zoomThreshold && newZoom <= _zoomThreshold) ||
        (oldZoom <= _zoomThreshold && newZoom > _zoomThreshold);

    if (shouldUpdate) {
      // 새로운 줌 레벨로 상태를 업데이트하고, 마커를 다시 생성
      state = state.copyWith(currentZoom: newZoom);
      await retryLoadingMarkers();
    }
  }
  /// 원(Circle)만 생성하는 함수
  Set<Circle> _createInitialCircles(List<SpotMonthResponse> spots) {
    final initialCircles = <Circle>{};
    for (final spot in spots) {
      initialCircles.add(
        Circle(
          circleId: CircleId(spot.spotId.toString()),
          center: LatLng(spot.mapY, spot.mapX),
          radius: _proximityRadius,
          fillColor: Colors.grey.withOpacity(0.2),
          strokeColor: Colors.grey,
          strokeWidth: 1,
        ),
      );
    }
    return initialCircles;
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
    if (state.selectedSpot != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(state.selectedSpot!.mapY, state.selectedSpot!.mapX),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  Future<void> _startListeningToLocation() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    state = state.copyWith(permissionStatus: permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      state = state.copyWith(permissionStatus: permission);
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    const locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      _checkProximityAndUpdateUI(position);
    });
  }
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
  void _checkProximityAndUpdateUI(Position currentPosition) {
    bool isNowInProximity = false;
    final updatedCircles = <Circle>{};
    SpotMonthResponse? currentProximateSpot;

    for (final spot in state.spots) {
      final position = LatLng(spot.mapY, spot.mapX);
      final double distance = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        spot.mapY,
        spot.mapX,
      );

      Color fillColor = Colors.grey.withOpacity(0.2);
      Color strokeColor = Colors.grey;

      if (distance <= _proximityRadius) {
        isNowInProximity = true;
        currentProximateSpot = spot;
        fillColor = Colors.blue.withOpacity(0.3);
        strokeColor = Colors.blue;
      }
      updatedCircles.add(
        Circle(
          circleId: CircleId(spot.spotId.toString()),
          center: position,
          radius: _proximityRadius,
          fillColor: fillColor,
          strokeColor: strokeColor,
          strokeWidth: 1,
        ),
      );
    }
    state = state.copyWith(
      isProximity: isNowInProximity,
      proximateSpot: currentProximateSpot,
      circles: updatedCircles,
      currentPosition: currentPosition,
    );
  }

  Future<void> onStampButtonPressed() async {
    if (state.proximateSpot == null) return;

    state = state.copyWith(status: UiStatus.loading);
    try {
      final spotId = state.proximateSpot!.spotId.toString();
      final visitSpotUseCase = ref.read(postVisitSpotUseCaseProvider);
      await visitSpotUseCase.call(spotId);

      final updatedSpots = state.spots.map((spot) {
        if (spot.spotId.toString() == spotId) {
          return spot.copyWith(visited: true);
        }
        return spot;
      }).toList();

      final updatedProximateSpot = state.proximateSpot?.copyWith(visited: true);
      state = state.copyWith(status: UiStatus.success, spots: updatedSpots, proximateSpot: updatedProximateSpot);

      // 스탬프 성공 후 마커 모양을 다시 그리도록 호출
      await retryLoadingMarkers();
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  void centerOnCurrentLocation() {
    if (state.currentPosition != null) {
      state.mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(state.currentPosition!.latitude,
                state.currentPosition!.longitude),
            zoom: 18.0,
          ),
        ),
      );
    } else {
      _startListeningToLocation();
    }
  }

  void selectSpot(SpotMonthResponse spot) {
    state = state.copyWith(selectedSpot: spot);
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(spot.mapY, spot.mapX),
          zoom: 15.0,
        ),
      ),
    );
  }

  void clearSelection() {
    state = state.copyWith(selectedSpot: null);
  }
}
