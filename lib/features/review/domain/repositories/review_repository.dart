import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/data/models/place_review_request.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../../data/models/course_review_request.dart';

abstract class ReviewRepository {
  Future<List<ReviewResponse>> getPlaceReviews(
      String placeId, String page, String size);
  Future<List<MyReviewResponse>> getMyReviews();
  Future<void> createPlaceReview(PlaceReviewRequest placeReview);
  Future<List<ReviewResponse>> getCourseReviews(
      String courseId, String page, String size);
  Future<void> createCourseReview(CourseReviewRequest courseReview);
  Future<void> deleteMyReview(int reviewId);
}