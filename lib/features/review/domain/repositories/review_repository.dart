import 'package:oreum_fe/features/review/data/models/review_response.dart';

abstract class ReviewRepository {
  Future<List<ReviewResponse>> getPlaceReviews(
      String placeId, String page, String size);
}