import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_response.freezed.dart';
part 'course_response.g.dart';

@freezed
class CourseResponse with _$CourseResponse {
  const factory CourseResponse({
    required int id,
    required String title,
    required String originImage,
    required String thumbnailImage,
    required String category2,
    int? sigunguCode,
  }) = _CourseResponse;

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);
}
