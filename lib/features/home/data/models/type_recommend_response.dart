import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_recommend_response.freezed.dart';
part 'type_recommend_response.g.dart';

@freezed
class TypeRecommendResponse with _$TypeRecommendResponse {
  const factory TypeRecommendResponse({
    required List<PlaceItem> places,
    required bool isLastPage,
  }) = _TypeRecommendResponse;

  factory TypeRecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeRecommendResponseFromJson(json);
}

@freezed
class PlaceItem with _$PlaceItem {
  const factory PlaceItem({
    required int id,
    required String title,
    required String contentId,
    required String contentTypeId,
    required String originImage,
    required String thumbnailImage,
    required int sigunguCode,
    required String address,
    required String detailAddress,
    required bool isSaved,
  }) = _PlaceItem;

  factory PlaceItem.fromJson(Map<String, dynamic> json) =>
      _$PlaceItemFromJson(json);
}