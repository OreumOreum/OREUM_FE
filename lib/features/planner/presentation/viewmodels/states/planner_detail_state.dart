import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/place/data/models/planner_place.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';

part 'planner_detail_state.freezed.dart';

@freezed
class PlannerDetailState with _$PlannerDetailState{
  const factory PlannerDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<PlannerDetailResponse> plannerPlaces,
    String? plannerName,
}) = _PlannerDetailState;
}