import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

import '../../../../../core/constants/ui_status.dart';

part 'monthly_spot_map_state.freezed.dart';

@freezed
class MonthlySpotMapState with _$MonthlySpotMapState {
  const factory MonthlySpotMapState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Circle> circles,
    @Default([]) List<SpotMonthResponse> spots,
    @Default(false) bool isProximity,
    SpotMonthResponse? selectedSpot,
    SpotMonthResponse? proximateSpot,
    GoogleMapController? mapController,
    Position? currentPosition,
  }) = _MonthlySpotMapState;
}