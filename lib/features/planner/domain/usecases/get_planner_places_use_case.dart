import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/domain/repositories/planner_repository.dart';

class GetPlannerPlacesUseCase {
  final PlannerRepository _plannerRepository;
  GetPlannerPlacesUseCase(this._plannerRepository);

  Future<List<PlannerDetailResponse>> call(String plannerId) async {
    List<PlannerDetailResponse> plannerPlaces = await _plannerRepository.getPlannerPlaces(plannerId);
    return plannerPlaces;
  }
}