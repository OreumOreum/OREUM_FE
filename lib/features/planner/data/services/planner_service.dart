import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_name_request.dart';
import 'package:oreum_fe/features/planner/data/models/planner_recommend_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';

class PlannerService {
  final Dio _dio;

  PlannerService(this._dio);

  Future<void> createPlanner(PlannerRequest planner) async {
    await _dio.post(
      ApiPath.planner,
      data: planner.toJson(),
    );
  }

  Future<List<PlannerResponse>> getPlanners() async {
    Response response = await _dio.get(ApiPath.planner);

    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) => PlannerResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<PlannerDetailResponse>> getPlannerPlaces(String plannerId) async {
    Response response = await _dio.get(ApiPath.plannerDetail(plannerId));

    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) =>
            PlannerDetailResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> editPlannerPlaces(
      String plannerId, PlannerRequest planner) async {
    await _dio.put(ApiPath.plannerDetail(plannerId), data: planner.toJson());
  }

  Future<void> deletePlanner(String plannerId) async {
    await _dio.delete(ApiPath.plannerDetail(plannerId));
  }

  Future<void> editPlannerName(String plannerId, String name) async {
    await _dio.put(ApiPath.plannerName(plannerId),
        data: PlannerNameRequest(name: name).toJson());
  }

  Future<PlannerRecommendResponse> getRecommendPlanner() async {

    Response response = await _dio.get(ApiPath.plannerRecommend);
    // print('🔄 Mock API 호출 시작 - 2초 대기');
    // await Future.delayed(Duration(seconds: 2));
    //
    // Map<String, dynamic> mockPlanner = {
    //   'plannerName': '제주 2박 3일 여행',
    //   'placeList': [
    //     {
    //       'placeId': 1,
    //       'placeTitle': '성산일출봉',
    //       'placeAddress': '제주특별자치도 서귀포시 성산읍 성산리',
    //       'thumbnailImage': 'https://example.com/images/sunrise.jpg',
    //     },
    //     {
    //       'placeId': 2,
    //       'placeTitle': '협재 해수욕장',
    //       'placeAddress': '제주특별자치도 제주시 한림읍',
    //       'thumbnailImage': 'https://example.com/images/beach.jpg',
    //     },
    //     {
    //       'placeId': 3,
    //       'placeTitle': '한라산 국립공원',
    //       'placeAddress': '제주특별자치도 제주시',
    //       'thumbnailImage': null,
    //     },
    //     {
    //       'placeId': 4,
    //       'placeTitle': '우도',
    //       'placeAddress': '제주특별자치도 제주시 우도면',
    //       'thumbnailImage': 'https://example.com/images/udo.jpg',
    //     },
    //     {
    //       'placeId': 5,
    //       'placeTitle': '중문 관광단지',
    //       'placeAddress': '제주특별자치도 서귀포시 중문동',
    //       'thumbnailImage': 'https://example.com/images/jungmun.jpg',
    //     }
    //   ]
    // };
    //
    // print('✅ Mock 데이터 반환 완료');
    return PlannerRecommendResponse.fromJson(response.data);
  }
}
