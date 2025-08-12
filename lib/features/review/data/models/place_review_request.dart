import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_review_request.freezed.dart';
part 'place_review_request.g.dart';

@freezed
class PlaceReviewRequest with _$PlaceReviewRequest {
  const factory PlaceReviewRequest({
    required int placeId,
    required double rate,
    required String content,
}) = _PlaceReviewRequest;

  factory PlaceReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceReviewRequestFromJson(json);
}