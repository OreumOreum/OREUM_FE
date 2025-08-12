import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_name_request.freezed.dart';
part 'planner_name_request.g.dart';

@freezed
class PlannerNameRequest with _$PlannerNameRequest {
  const factory PlannerNameRequest({
    required String name,
  }) = _PlannerNameRequest;

  factory PlannerNameRequest.fromJson(Map<String, dynamic> json) =>
      _$PlannerNameRequestFromJson(json);
}
