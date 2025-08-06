import 'package:dio/dio.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/planner/data/repositories/planner_repository_impl.dart';
import 'package:oreum_fe/features/planner/data/services/planner_service.dart';
import 'package:oreum_fe/features/planner/domain/usecases/create_planner_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/delete_planner_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/edit_planner_places_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/get_planner_places_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/get_planners_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'planner_providers.g.dart';

@riverpod
PlannerService plannerService(PlannerServiceRef ref) {
  final Dio dio = ref.watch(dioProvider);
  return PlannerService(dio);
}

@riverpod
PlannerRepositoryImpl plannerRepositoryImpl(PlannerRepositoryImplRef ref) {
  final PlannerService plannerService = ref.watch(plannerServiceProvider);
  return PlannerRepositoryImpl(plannerService);
}

@riverpod
CreatePlannerUseCase createPlannerUseCase(CreatePlannerUseCaseRef ref) {
  final PlannerRepositoryImpl plannerRepositoryImpl = ref.watch(plannerRepositoryImplProvider);
  return CreatePlannerUseCase(plannerRepositoryImpl);
}

@riverpod
GetPlannersUseCase getPlannersUseCase(GetPlannersUseCaseRef ref) {
  final PlannerRepositoryImpl plannerRepositoryImpl = ref.watch(plannerRepositoryImplProvider);
  return GetPlannersUseCase(plannerRepositoryImpl);
}

@riverpod
GetPlannerPlacesUseCase getPlannerPlacesUseCase(GetPlannerPlacesUseCaseRef ref) {
  final PlannerRepositoryImpl plannerRepositoryImpl = ref.watch(plannerRepositoryImplProvider);
  return GetPlannerPlacesUseCase(plannerRepositoryImpl);
}

@riverpod
EditPlannerPlacesUseCase editPlannerPlacesUseCase (EditPlannerPlacesUseCaseRef ref) {
  final PlannerRepositoryImpl plannerRepositoryImpl = ref.watch(plannerRepositoryImplProvider);
  return EditPlannerPlacesUseCase(plannerRepositoryImpl);
}

@riverpod
DeletePlannerUseCase deletePlannerUseCase (DeletePlannerUseCaseRef ref) {
  final PlannerRepositoryImpl plannerRepositoryImpl = ref.watch(plannerRepositoryImplProvider);
  return DeletePlannerUseCase(plannerRepositoryImpl);
}