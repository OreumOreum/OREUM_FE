import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';

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
    return PageablePlaceResponse.fromJson(response.data);
  }
}

