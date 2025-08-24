import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_recommend_response.freezed.dart';
part 'planner_recommend_response.g.dart';

@freezed
class PlannerRecommendResponse with _$PlannerRecommendResponse {
  const factory PlannerRecommendResponse({
    required String plannerName,
    required List<PlannerRecommendItem> placeList,
  }) = _PlannerRecommendResponse;

  factory PlannerRecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$PlannerRecommendResponseFromJson(json);
}

@freezed
class PlannerRecommendItem with _$PlannerRecommendItem {
  const factory PlannerRecommendItem({
    required int placeId,
    required String placeTitle,
    String? placeAddress,
    String? thumbnailImage,
    @Default('관광지') String contentTypeId,
  }) = _PlannerRecommendItem;

  factory PlannerRecommendItem.fromJson(Map<String, dynamic> json) =>
      _$PlannerRecommendItemFromJson(json);
}
