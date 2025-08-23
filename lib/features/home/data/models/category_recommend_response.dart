import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_recommend_response.freezed.dart';
part 'category_recommend_response.g.dart';

@freezed
class CategoryRecommendResponse with _$CategoryRecommendResponse {
  const factory CategoryRecommendResponse({
    required int placeId,
    required String contentId,
    required String contentTypeId,
    required String orignImage,
  }) = _CategoryRecommendResponse;

  factory CategoryRecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryRecommendResponseFromJson(json);
}
