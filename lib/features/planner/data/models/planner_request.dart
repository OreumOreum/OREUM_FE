import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_request.freezed.dart';
part 'planner_request.g.dart';

@freezed
class PlannerRequest with _$PlannerRequest {
  const factory PlannerRequest({
    required String name,
    required List<Place> places,
  }) = _PlannerRequest;

  factory PlannerRequest.fromJson(Map<String, dynamic> json) =>
      _$PlannerRequestFromJson(json);
}

@freezed
class Place with _$Place {
  const factory Place({
    required int placeId,
    required int day,
    required int order,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
