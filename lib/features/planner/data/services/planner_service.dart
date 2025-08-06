import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
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
}
