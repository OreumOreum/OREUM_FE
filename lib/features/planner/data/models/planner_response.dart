import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_response.freezed.dart';
part 'planner_response.g.dart';

@freezed
class PlannerResponse with _$PlannerResponse {
  const factory PlannerResponse({
    required int plannerId,
    required String plannerName,
  }) = _PlannerResponse;

  factory PlannerResponse.fromJson(Map<String, dynamic> json) =>
      _$PlannerResponseFromJson(json);
}
