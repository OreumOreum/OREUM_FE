import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_recommend_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';
import 'package:oreum_fe/features/planner/data/services/planner_service.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class PlannerRepositoryImpl implements PlannerRepository {
  final PlannerService _plannerService;
  PlannerRepositoryImpl(this._plannerService);

  @override
  Future<void> createPlanner(PlannerRequest planner) {
    return _plannerService.createPlanner(planner);
  }

  @override
  Future<List<PlannerResponse>> getPlanners() {
    return _plannerService.getPlanners();
  }

  @override
  Future<List<PlannerDetailResponse>> getPlannerPlaces(String plannerId) {
    return _plannerService.getPlannerPlaces(plannerId);
  }

  @override
  Future<void> editPlannerPlaces(String plannerId, PlannerRequest planner) {
    return _plannerService.editPlannerPlaces(plannerId, planner);
  }

  @override
  Future<void> deletePlanner(String plannerId) {
    return _plannerService.deletePlanner(plannerId);
  }

  @override
  Future<void> editPlannerName(String plannerId, String name) {
    return _plannerService.editPlannerName(plannerId, name);
  }

  @override
  Future<PlannerRecommendResponse> getRecommendPlanner() {
    return _plannerService.getRecommendPlanner();
  }
}