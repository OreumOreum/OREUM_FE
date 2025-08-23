import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/home/data/models/category_recommend_response.dart';
import 'package:oreum_fe/features/home/data/models/type_recommend_response.dart';

import '../models/place_response.dart';

class PlaceService {
  final Dio _dio;
  PlaceService(this._dio);

  Future<PageablePlaceResponse> getPlaces({
    int? contentTypeId,
    int? sigunguCode,
    bool? type,
    Map<String, dynamic>? pageable,
  }) async {
    final Map<String, dynamic> queryParams = {
      'sigunguCode': sigunguCode,
      'type': type,
      if (contentTypeId != 0) 'contentTypeId': contentTypeId,
    };
    if (pageable != null) {
      queryParams.addAll(pageable);
    }

    queryParams.removeWhere((key, value) => value == null);
    
    final response = await _dio.get(ApiPath.place, queryParameters: queryParams);
    
    print(response.data);
    return PageablePlaceResponse.fromJson(response.data);
  }

  Future<List<CategoryRecommendResponse>> getRecommendPlace() async {
    Response response = await _dio.get(ApiPath.categoryRecommend);
    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) => CategoryRecommendResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Place>> getTypeRecommend() async {
    Response response = await _dio.get(
      ApiPath.place,
      queryParameters: {
        'type': true,
        'page': 0,
        'size': 3,
        'sort': 'random',
      },
    );

    List<dynamic> jsonList = response.data['places'];
    return jsonList
        .map((json) => Place.fromJson(json as Map<String, dynamic>))
        .toList();
  }

}

