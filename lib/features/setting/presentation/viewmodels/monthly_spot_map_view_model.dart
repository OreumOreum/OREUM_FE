import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/ui_status.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'states/monthly_spot_map_state.dart';

part 'monthly_spot_map_view_model.g.dart';

@riverpod
class MonthlySpotMapViewModel extends _$MonthlySpotMapViewModel {
  final double _proximityRadius = 50.0;
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  MonthlySpotMapState build({required List<SpotMonthResponse> spots}) {
    ref.onDispose(() {
      _positionStreamSubscription?.cancel();
    });

    _startListeningToLocation();

    final (initialMarkers, initialCircles) = _createInitialMapItems(spots);

    return MonthlySpotMapState(
      spots: spots,
      markers: initialMarkers,
      circles: initialCircles,
    );
  }

  (Set<Marker>, Set<Circle>) _createInitialMapItems(List<SpotMonthResponse> spots) {
    final initialMarkers = <Marker>{};
    final initialCircles = <Circle>{};

    for (final spot in spots) {
      final position = LatLng(spot.mapY, spot.mapX);
      initialMarkers.add(
        Marker(
          markerId: MarkerId(spot.spotId.toString()),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: InfoWindow(title: spot.title),
          onTap: () => selectSpot(spot),
        ),
      );
      initialCircles.add(
        Circle(
          circleId: CircleId(spot.spotId.toString()),
          center: position,
          radius: _proximityRadius,
          fillColor: Colors.grey.withOpacity(0.2),
          strokeColor: Colors.grey,
          strokeWidth: 1,
        ),
      );
    }
    return (initialMarkers, initialCircles);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  Future<void> _startListeningToLocation() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
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

      state = state.copyWith(status: UiStatus.success, spots: updatedSpots);

    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
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