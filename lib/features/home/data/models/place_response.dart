import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_response.freezed.dart';
part 'place_response.g.dart';
@freezed
class PageablePlaceResponse with _$PageablePlaceResponse {
  const factory PageablePlaceResponse({
    @JsonKey(name: 'places') required List<Place> content,

    @JsonKey(name: 'isLastPage') required bool last,


  }) = _PageablePlaceResponse;

  factory PageablePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PageablePlaceResponseFromJson(json);
}


@freezed
class Place with _$Place {
  const factory Place({
    @JsonKey(name: 'id') required int placeId,
    required String title,
    String? originImage,
    String? thumbnailImage,
    required int sigunguCode,
    required bool isSaved,
    String? contentId,
    String? contentTypeId,


  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}