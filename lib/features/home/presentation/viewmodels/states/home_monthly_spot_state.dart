import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

import '../../../../../core/constants/ui_status.dart';

part 'home_monthly_spot_state.freezed.dart';

@freezed
class HomeMonthlySpotState with _$HomeMonthlySpotState {
  const factory HomeMonthlySpotState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<SpotMonthResponse> monthlySpots,
    @Default({}) Map<int, int> myTypeVisitCounts,
    int? year,
    int? month,

  }) = _HomeMonthlySpotState;
}