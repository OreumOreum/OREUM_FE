import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_recommend_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';

abstract class PlannerRepository {
  Future<void> createPlanner(PlannerRequest planner);
  Future<List<PlannerResponse>> getPlanners();
  Future<List<PlannerDetailResponse>> getPlannerPlaces(String plannerId);
  Future<void> editPlannerPlaces(String plannerId, PlannerRequest planner);
  Future<void> deletePlanner(String plannerId);
  Future<void> editPlannerName(String plannerId, String name);
  Future<PlannerRecommendResponse> getRecommendPlanner();
}