import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_response.freezed.dart';
part 'place_response.g.dart';

@freezed
class PlaceResponse with _$PlaceResponse {
  const factory PlaceResponse({
    required String title,
    required String smallCategory,
    required String middleCategory,
    required String largeCategory,
    required String address,
    required String originImage,
    required String contentTypeId,
    required int sigunguCode,
    String? overview,
    required double mapX,
    required double mapY,
    required double averageRate,
    required int reviewCount,
    required bool isSpot,
    required bool isSaved,
  }) = _PlaceResponse;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => _$PlaceResponseFromJson(json);
}
