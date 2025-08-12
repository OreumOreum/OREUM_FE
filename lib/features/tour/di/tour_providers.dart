import 'package:oreum_fe/features/place/data/repositories/place_repository_impl.dart';
import 'package:oreum_fe/features/place/data/services/place_service.dart';
import 'package:oreum_fe/features/place/domain/usecases/get_place_use_case.dart';
import 'package:oreum_fe/features/tour/data/repositories/tour_repository_impl.dart';
import 'package:oreum_fe/features/tour/data/services/tour_service.dart';
import 'package:oreum_fe/features/tour/domain/usecases/get_tour_api_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';

part 'tour_providers.g.dart';

@riverpod
TourService tourService(TourServiceRef ref) {
  final dio = ref.watch(tourDioProvider);
  return TourService(dio);
}

@riverpod
TourRepositoryImpl tourRepositoryImpl(TourRepositoryImplRef ref) {
  final tourService = ref.watch(tourServiceProvider);
  return TourRepositoryImpl(tourService);
}

@riverpod
GetTourApiUseCase getTourApiUseCase(GetTourApiUseCaseRef ref) {
  final TourRepositoryImpl = ref.watch(tourRepositoryImplProvider);
  return GetTourApiUseCase(TourRepositoryImpl);
}