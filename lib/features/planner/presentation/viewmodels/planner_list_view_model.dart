import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/planner/data/models/planner_response.dart';
import 'package:oreum_fe/features/planner/di/planner_providers.dart';
import 'package:oreum_fe/features/planner/domain/usecases/delete_planner_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/edit_planner_name_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/get_planners_use_case.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planner_list_view_model.g.dart';

@riverpod
class PlannerListViewModel extends _$PlannerListViewModel {
  @override
  PlannerListState build() {
    return PlannerListState(status: UiStatus.loading);
  }

  Future<void> getPlanners() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetPlannersUseCase getPlannersUseCase =
          ref.read(getPlannersUseCaseProvider);
      List<PlannerResponse> planners = await getPlannersUseCase.call();
      state = state.copyWith(status: UiStatus.success, planners: planners);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
      logger.e(e.toString());
    }
  }

  Future<void> refreshPlannersInBackground() async {
    try {
      GetPlannersUseCase getPlannersUseCase =
          ref.read(getPlannersUseCaseProvider);
      List<PlannerResponse> planners = await getPlannersUseCase.call();
      state = state.copyWith(planners: planners);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error);
    }
  }

  Future<void> deletePlanner(String plannerId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      DeletePlannerUseCase deletePlannerUseCase =
          ref.read(deletePlannerUseCaseProvider);
      await deletePlannerUseCase.call(plannerId);
      await refreshPlannersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error, errorMessage: e.toString());
      logger.e(e.toString());
    }
  }

  Future<void> editPlannerName(String plannerId, String name) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      EditPlannerNameUseCase editPlannerNameUseCase =
          ref.read(editPlannerNameUseCaseProvider);
      await editPlannerNameUseCase.call(plannerId, name);
      await refreshPlannersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error, errorMessage: e.toString());
      logger.e(e.toString());
    }
  }
}
