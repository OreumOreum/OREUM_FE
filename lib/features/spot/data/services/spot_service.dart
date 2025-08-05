import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';

import '../models/spot_ranking_response.dart';

class SpotService{
  final Dio _dio ;
  SpotService(this._dio);
  Future<List<SpotResponse>> getYearSpot(String year) async{
    Response response = await _dio.get(ApiPath.spotStampYear(year));
    List<dynamic> spotResponse = response.data;
    List<SpotResponse> spots = spotResponse.map((json) => SpotResponse.fromJson(json)).toList();
    return spots;
  }

  Future<List<SpotMonthResponse>> getMonthSpot(String year, String month) async{
    Response response = await _dio.get(ApiPath.spotStampYearMonth(year, month));
    List<dynamic> spotMonthResponse = response.data;
    List<SpotMonthResponse> spots = spotMonthResponse.map((json) => SpotMonthResponse.fromJson(json)).toList();
    return spots;
  }

  Future<void> postVisitSpot(String spotId) async {
    try {
      await _dio.post(ApiPath.spotVisit(spotId));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SpotRankingResponse>> getSpotRanking(String spotId) async {
    final response = await _dio.get(ApiPath.spotRanking(spotId));
    final List<dynamic> data = response.data;
    return data.map((json) => SpotRankingResponse.fromJson(json)).toList();
  }

}