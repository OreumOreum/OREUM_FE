import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_review_request.freezed.dart';
part 'course_review_request.g.dart';

@freezed
class CourseReviewRequest with _$CourseReviewRequest {
  const factory CourseReviewRequest({
    required int courseId,
    required double rate,
    required String content,
  }) = _CourseReviewRequest;

  factory CourseReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CourseReviewRequestFromJson(json);
}