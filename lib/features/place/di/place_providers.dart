import 'package:oreum_fe/features/place/data/repositories/place_repository_impl.dart';
import 'package:oreum_fe/features/place/data/services/place_service.dart';
import 'package:oreum_fe/features/place/domain/usecases/search_places_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';

part 'place_providers.g.dart';

@riverpod
PlaceService placeService(PlaceServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return PlaceService(dio);
}

@riverpod
PlaceRepositoryImpl placeRepositoryImpl(PlaceRepositoryImplRef ref) {
  final placeService = ref.watch(placeServiceProvider);
  return PlaceRepositoryImpl(placeService);
}

@riverpod
SearchPlacesUseCase searchPlacesUseCase(SearchPlacesUseCaseRef ref) {
  final PlaceRepositoryImpl placeRepositoryImpl = ref.watch(placeRepositoryImplProvider);
  return SearchPlacesUseCase(placeRepositoryImpl);
}