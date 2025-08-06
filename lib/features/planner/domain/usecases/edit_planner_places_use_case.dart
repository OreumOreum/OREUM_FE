import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class EditPlannerPlacesUseCase {
  final PlannerRepository _plannerRepository;
  EditPlannerPlacesUseCase(this._plannerRepository);

  Future<void> call(String plannerId, PlannerRequest planner) {
    return _plannerRepository.editPlannerPlaces(plannerId, planner);
  }
}