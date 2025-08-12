import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';

part 'monthly_spot_state.freezed.dart';

enum MonthlySpotStatus{
  idle,
  loading,
  success,
  error
}

@freezed
class MonthlySpotState with _$MonthlySpotState{
  const factory MonthlySpotState({
    @Default(MonthlySpotStatus.idle) MonthlySpotStatus status,
    @Default('') String errorMessage,
    @Default({}) Map<String, List<SpotResponse>> spotsByMonth,
}) = _MonthlySpotState;
}