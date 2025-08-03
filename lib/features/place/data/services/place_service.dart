import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';

class PlaceService {
  final Dio _dio;
  PlaceService(this._dio);

  Future<PlaceResponse> getPlace(String placeId) async {
    Response response = await _dio.get(ApiPath.place(placeId));
    print(response.data);
    return PlaceResponse.fromJson(response.data);
  }

}