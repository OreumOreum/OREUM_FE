import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';

part 'monthly_spot_detail_state.freezed.dart';


@freezed
class MonthlySpotDetailState with _$MonthlySpotDetailState{
  const factory MonthlySpotDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<SpotMonthResponse> spotsByMonth,
  }) = _MonthlySpotDetailState;
}