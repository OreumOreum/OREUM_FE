import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';

part 'planner_detail_response.freezed.dart';
part 'planner_detail_response.g.dart';

@freezed
class PlannerDetailResponse with _$PlannerDetailResponse {
  const factory PlannerDetailResponse({
    required int plannerPlaceId,
    required int day,
    required int order,
    required int plannerId,
    required int placeId,
    required String placeTitle,
    required String placeAddress,
    String? placeThumbnailImage,
    required String contentTypeId,
    required String contentId,
    double? mapX,
    double? mapY,
  }) = _PlannerDetailResponse;

  factory PlannerDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PlannerDetailResponseFromJson(json);
}

extension PlannerDetailResponseMapper on PlannerDetailResponse {
  PlannerEditPlace toEditPlace() {
    return PlannerEditPlace(
      placeId: placeId.toString(),
      day: day,
      orderIndex: order,
      title: placeTitle,
      address: placeAddress,
      contentTypeId: contentTypeId,
    );
  }
}
