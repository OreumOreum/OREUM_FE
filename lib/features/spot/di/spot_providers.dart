import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/spot/data/repositories/spot_repository_impl.dart';
import 'package:oreum_fe/features/spot/data/services/spot_service.dart';
import 'package:oreum_fe/features/spot/domain/usecases/get_year_month_spot_use_case.dart';
import 'package:oreum_fe/features/spot/domain/usecases/get_year_spot_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/usecases/get_spot_ranking_use_case.dart';
import '../domain/usecases/post_visit_spot_use_case.dart';

part 'spot_providers.g.dart';

@riverpod
SpotService spotService(SpotServiceRef ref){
  final dio = ref.watch(dioProvider);
  return SpotService(dio);
}
@riverpod
SpotRepositoryImpl spotRepositoryImpl(SpotRepositoryImplRef ref){
  final spotService = ref.watch(spotServiceProvider);
  return SpotRepositoryImpl(spotService);
}
@riverpod
GetYearSpotUseCase getYearSpotUseCase(GetYearSpotUseCaseRef ref){
  final spotRepo = ref.watch(spotRepositoryImplProvider);
  return GetYearSpotUseCase(spotRepo);
}
@riverpod
GetYearMonthSpotUseCase getYearMonthSpotUseCase(GetYearMonthSpotUseCaseRef ref){
  final monthSpotRepo = ref.watch(spotRepositoryImplProvider);
  return GetYearMonthSpotUseCase(monthSpotRepo);
}
@riverpod
PostVisitSpotUseCase postVisitSpotUseCase(PostVisitSpotUseCaseRef ref) {
  final spotRepo = ref.watch(spotRepositoryImplProvider);
  return PostVisitSpotUseCase(spotRepo);
}
@riverpod
GetSpotRankingUseCase getSpotRankingUseCase(GetSpotRankingUseCaseRef ref) {
  final repo = ref.watch(spotRepositoryImplProvider);
  return GetSpotRankingUseCase(repo);
}
