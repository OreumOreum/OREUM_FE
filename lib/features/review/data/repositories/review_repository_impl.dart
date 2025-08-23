import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/data/models/place_review_request.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/data/services/review_service.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

import '../models/course_review_request.dart';

class ReviewRepositoryImpl implements ReviewRepository{
  final ReviewService _reviewService;
  ReviewRepositoryImpl(this._reviewService);
  @override
  Future<List<ReviewResponse>> getPlaceReviews(String placeId, String page, String size) {
    return _reviewService.getPlaceReviews(placeId, page, size);
  }

  @override
  Future<List<MyReviewResponse>> getMyReviews() {
    return _reviewService.getMyReviews();
  }

  @override
  Future<void> createPlaceReview(PlaceReviewRequest placeReview) {
    return _reviewService.createPlaceReview(placeReview);
  }

  @override
  Future<List<ReviewResponse>> getCourseReviews(String courseId, String page, String size) {
    return _reviewService.getCourseReviews(courseId, page, size);
  }

  @override
  Future<void> createCourseReview(CourseReviewRequest courseReview) {
    return _reviewService.createCourseReview(courseReview);
  }

  @override
  Future<void> deleteMyReview(int reviewId) {
    return _reviewService.deleteMyReview(reviewId);
  }

}