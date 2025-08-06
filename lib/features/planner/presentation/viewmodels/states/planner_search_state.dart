import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/place/data/models/search_place_response.dart';

part 'planner_search_state.freezed.dart';

@freezed
class PlannerSearchState with _$PlannerSearchState {
  const factory PlannerSearchState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus paginationStatus,
    @Default('') String errorMessage,
    SearchPlaceResponse? searchPlace,
    @Default(false) bool isSearching,
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default('') String keyword,
}) = _PlannerSearchState;
}