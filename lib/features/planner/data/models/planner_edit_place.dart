import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_edit_place.freezed.dart';
part 'planner_edit_place.g.dart';

@freezed
class PlannerEditPlace with _$PlannerEditPlace {
  const factory PlannerEditPlace({
    required String placeId,
    required int day,
    required int orderIndex,
    required String title,
    @Default('') String? address,
  }) = _PlannerEditPlace;

  factory PlannerEditPlace.fromJson(Map<String, dynamic> json) =>
      _$PlannerEditPlaceFromJson(json);
}
