import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/data/models/place_review_request.dart';
import 'package:oreum_fe/features/review/data/models/review_list_response.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../models/course_review_request.dart';

class ReviewService {
  final Dio _dio;

  ReviewService(this._dio);

  Future<List<ReviewResponse>> getPlaceReviews(
      String placeId, String page, String size) async {
    Response response =
        await _dio.get(ApiPath.review(placeId), queryParameters: {
      'page': page,
      'size': size,
    });
    List<dynamic> jsonList = response.data['reviews'];
    return jsonList
        .map((json) => ReviewResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<MyReviewResponse>> getMyReviews() async {
    Response response = await _dio.get(ApiPath.myReview);

    List<dynamic> jsonList = response.data;
    return jsonList
        .map((json) => MyReviewResponse.fromJson(json as Map<String, dynamic>))
        .toList();

  }

  Future<void> createPlaceReview(PlaceReviewRequest placeReview) async {
    await _dio.post(ApiPath.placeReview, data: placeReview.toJson());
  }

  Future<List<ReviewResponse>> getCourseReviews(
      String courseId, String page, String size) async {
    Response response =
    await _dio.get(ApiPath.reviewCourse(courseId), queryParameters: {
      'page': page,
      'size': size,
    });
    List<dynamic> jsonList = response.data['reviews'];
    return jsonList
        .map((json) => ReviewResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> deleteMyReview(int reviewId) async {
    await _dio.delete(ApiPath.deleteReview(reviewId));
  }

  Future<void> createCourseReview(CourseReviewRequest courseReview) async {
    await _dio.post(ApiPath.createCourseReview, data: courseReview.toJson());
  }
}