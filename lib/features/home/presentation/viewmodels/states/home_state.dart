import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';

import '../../../../spot/data/models/spot_month_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus weatherStatus,
    @Default('') String errorMessage,
    @Default([]) List<SpotMonthResponse> monthlySpots,
    @Default({}) Map<int, int> myTypeVisitCounts,
    int? year,
    int? month,
    WeatherInfo? weatherInfo,
}) = _HomeState;
}