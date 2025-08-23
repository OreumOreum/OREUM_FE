import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_place.freezed.dart';

@freezed
class PlannerPlace with _$PlannerPlace {
  const factory PlannerPlace({
    required int plannerPlaceId,
    required int day,
    required int order,
    required int plannerId,
    required int placeId,
    required String placeTitle,
    required String placeAddress,
    required String placeThumbnailImage,
    required String contentTypeId,
  }) = _PlannerPlace;

}