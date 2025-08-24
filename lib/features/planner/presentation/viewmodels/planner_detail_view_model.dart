import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/planner/data/models/planner_detail_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/di/planner_providers.dart';
import 'package:oreum_fe/features/planner/domain/usecases/get_planner_places_use_case.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planner_detail_view_model.g.dart';

@riverpod
class PlannerDetailViewModel extends _$PlannerDetailViewModel {

  @override
  PlannerDetailState build() {
    return PlannerDetailState();
  }

  Future<void> getPlannerPlace(String plannerId) async {
    state = PlannerDetailState(status: UiStatus.loading);
    try {
      GetPlannerPlacesUseCase getPlannerPlacesUseCase = ref.read(getPlannerPlacesUseCaseProvider);
      List<PlannerDetailResponse> plannerPlaces = await getPlannerPlacesUseCase.call(plannerId);
      state = PlannerDetailState(plannerPlaces: plannerPlaces, status: UiStatus.success);
    } catch (e) {
      state = PlannerDetailState(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  List<PlannerDetailResponse> getPlacesByDay(int day) {
    return state.plannerPlaces.where((p) => p.day == day).toList();
  }

  List<int> getUniqueDays() {
    return state.plannerPlaces.map((p) => p.day).toSet().toList()..sort();
  }

  List<PlannerEditPlace> mapPlannerPlaceToEditPlace() {
    final editPlaces = state.plannerPlaces.map((e) => e.toEditPlace()).toList();

    return editPlaces;
  }

  Future<void> refreshPlannerDetailInBackground(String plannerId) async {
    try {
      GetPlannerPlacesUseCase getPlannerPlacesUseCase = ref.read(getPlannerPlacesUseCaseProvider);
      List<PlannerDetailResponse> plannerPlaces = await getPlannerPlacesUseCase.call(plannerId);
      state = state.copyWith(plannerPlaces: plannerPlaces);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error);
    }
  }

  void setPlannerName(String name) {
    state = state.copyWith(plannerName: name);
  }
}

final currentSelectedDayProvider = StateProvider<int>((ref) => 1);

