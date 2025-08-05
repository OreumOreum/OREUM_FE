import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

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
}
