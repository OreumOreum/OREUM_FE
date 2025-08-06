import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/spot/data/models/spot_ranking_response.dart';

import '../../../../../core/constants/travel_type.dart';

part 'monthly_spot_ranking_state.freezed.dart';

@freezed
class MonthlySpotRankingState with _$MonthlySpotRankingState {
  const factory MonthlySpotRankingState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<SpotRankingResponse> rawRanking,
    @Default([]) List<SpotRankingResponse> fullRankingList,
    @Default(0) int myTypeVisitCount,
    TravelType? myTravelType,
  }) = _MonthlySpotRankingState;
}