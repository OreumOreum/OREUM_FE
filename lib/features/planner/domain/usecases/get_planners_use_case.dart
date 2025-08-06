import 'package:oreum_fe/features/planner/data/models/planner_response.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class GetPlannersUseCase {
  final PlannerRepository _plannerRepository;
  GetPlannersUseCase(this._plannerRepository);

  Future<List<PlannerResponse>> call() async {
    List<PlannerResponse> planners = await _plannerRepository.getPlanners();
    return planners;
  }
}