import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/tour/data/models/tour_response.dart';

import '../../../../core/utils/custom_logger.dart';

class TourService {
  final Dio _dio;
  TourService(this._dio);

  Future<TourResponse> getTourApi(String contentId, String contentTypeId) async {
    final queryParams = {
      'serviceKey': dotenv.env['TOUR_API_SERVICE_KEY']!,
      'contentId': contentId,
      'contentTypeId': contentTypeId,
      'MobileOS': 'IOS',
      'MobileApp': 'OREUMOREUM',
      '_type': 'JSON',
    };

    Response response = await _dio.get(
      ApiPath.tourApi(contentId, contentTypeId),
      queryParameters: queryParams,
    );
    logger.i('CheckData:${response.data}');
    final responseData = response.data as Map<String, dynamic>;
    final firstItem = responseData['response']['body']['items']['item'][0];
    return TourResponse.fromJson(firstItem);
  }
}