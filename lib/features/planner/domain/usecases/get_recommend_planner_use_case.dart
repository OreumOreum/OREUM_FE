import 'package:oreum_fe/features/planner/data/models/planner_recommend_response.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class GetRecommendPlannerUseCase {
  final PlannerRepository _plannerRepository;
  GetRecommendPlannerUseCase(this._plannerRepository);

  Future<PlannerRecommendResponse> call() async {
    PlannerRecommendResponse plannerRecommendResponse = await _plannerRepository.getRecommendPlanner();
    return plannerRecommendResponse;
  }
}