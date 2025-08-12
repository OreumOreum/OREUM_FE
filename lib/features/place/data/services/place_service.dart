import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/data/models/search_place_response.dart';

class PlaceService {
  final Dio _dio;

  PlaceService(this._dio);

  Future<PlaceResponse> getPlace(String placeId) async {
    Response response = await _dio.get(ApiPath.placeDetail(placeId));
    print(response.data);
    return PlaceResponse.fromJson(response.data);
  }
  Future<SearchPlaceResponse> searchPlaces(String keyword, int page,
      int size,
      {int? sigunguCode}) async {
    Response response = await _dio.get(ApiPath.searchPlaces, queryParameters: {
      'keyword': keyword,
      'sigunguCode': sigunguCode,
      'page': page,
      'size': size,
    });

    SearchPlaceResponse searchPlaceResponse = SearchPlaceResponse.fromJson(response.data);

    return searchPlaceResponse;
  }
}
