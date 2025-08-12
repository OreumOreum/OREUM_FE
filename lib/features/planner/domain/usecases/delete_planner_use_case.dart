import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class DeletePlannerUseCase {
  final PlannerRepository _plannerRepository;
  DeletePlannerUseCase(this._plannerRepository);

  Future<void> call(String plannerId) {
    return _plannerRepository.deletePlanner(plannerId);
  }
}