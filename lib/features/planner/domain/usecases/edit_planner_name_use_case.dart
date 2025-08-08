import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class EditPlannerNameUseCase {
  final PlannerRepository _plannerRepository;
  EditPlannerNameUseCase(this._plannerRepository);

  Future<void> call(String plannerId, String name) {
    return _plannerRepository.editPlannerName(plannerId, name);
  }
}