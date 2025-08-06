import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/place/data/models/search_place_response.dart';

class PlaceService {
  final Dio _dio;

  PlaceService(this._dio);

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
