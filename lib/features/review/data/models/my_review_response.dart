import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_review_response.freezed.dart';
part 'my_review_response.g.dart';

@freezed
class MyReviewResponse with _$MyReviewResponse {
  const factory MyReviewResponse({
    required double rate,
    required String content,
    required String createdAt,
    required String updatedAt,
    required String placeTitle,

  }) = _MyReviewResponse;

  factory MyReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$MyReviewResponseFromJson(json);
}
