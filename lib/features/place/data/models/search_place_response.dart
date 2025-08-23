import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_place_response.freezed.dart';
part 'search_place_response.g.dart';

@freezed
class SearchPlaceResponse with _$SearchPlaceResponse {
  const factory SearchPlaceResponse({
    @Default([]) List<SearchPlaceItem> content,
    required bool isLastPage,
  }) = _SearchPlaceResponse;

  factory SearchPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaceResponseFromJson(json);
}

@freezed
class SearchPlaceItem with _$SearchPlaceItem {
  const factory SearchPlaceItem({
    required int id,
    required String title,
    required String contentId,
    required String contentTypeId,
    String? address,
    String? thumbnailImage,
    required bool isSaved,
  }) = _SearchPlaceItem;

  factory SearchPlaceItem.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaceItemFromJson(json);
}
