import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';

part 'planner_edit_state.freezed.dart';

@freezed
class PlannerEditState with _$PlannerEditState {
  const factory PlannerEditState({
    @Default([]) List<PlannerEditPlace> plannerPlaces,
    @Default([1]) List<int> tabDays,
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default('') String plannerName,
    @Default('') String recommendPlannerName,
  }) = _PlannerEditState;
}
