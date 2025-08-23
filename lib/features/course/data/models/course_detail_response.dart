import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_detail_response.freezed.dart';
part 'course_detail_response.g.dart';

@freezed
class CourseDetailResponse with _$CourseDetailResponse {
  const factory CourseDetailResponse({
    required String title,
    required String middleCategory,
    int? sigunguCode,
    String? overview,
    String? originImage,
    required double averageRate,
    required int reviewCount,
    @Default([]) List<Place> places,
  }) = _CourseDetailResponse;

  factory CourseDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailResponseFromJson(json);
}

@freezed
class Place with _$Place {
  const factory Place({
    required int id,
    required String title,
    required String address,
    required double mapX,
    required double mapY,
    required String? originImage,
    required String? thumbnailImage,
    required String? contentTypeId,
    required String? contentId

  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
