import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';

part 'planner_list_state.freezed.dart';

@freezed
class PlannerListState with _$PlannerListState {
  const factory PlannerListState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default('') String errorMessage,
    @Default([]) List<PlannerResponse> planners,
  }) = _PlannerListState;
}