import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class CreatePlannerUseCase {
  final PlannerRepository _plannerRepository;
  CreatePlannerUseCase(this._plannerRepository);

  Future<void> call(PlannerRequest planner) {
    return _plannerRepository.createPlanner(planner);
  }
}
