import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/home/data/models/place_response.dart';

import '../../../../../core/constants/travel_type.dart';
import '../../../../../core/constants/ui_status.dart';

part 'recommend_state.freezed.dart';

enum RegionFilter { all, jeju, seogwipo }

@freezed
class RecommendState with _$RecommendState {
  const factory RecommendState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<Place> originalPlaces,
    @Default([]) List<Place> filteredPlaces,
    @Default(RegionFilter.all) RegionFilter selectedFilter,
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default(false) bool isLoadingNextPage,
    int? selectedContentTypeId,
    TravelType? myTravelType,
  }) = _RecommendState;
}