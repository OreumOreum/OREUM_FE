import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import '../presentation/viewmodels/home_view_model.dart';
import '../data/repositories/place_repository_impl.dart';
import '../data/services/place_service.dart';
import '../domain/usecases/get_places_use_case.dart';

part 'home_providers.g.dart';

@riverpod
HomeViewModel homeViewModel(HomeViewModelRef ref) {
  return HomeViewModel();
}
@riverpod
PlaceService placeService(PlaceServiceRef ref) {
  return PlaceService(ref.watch(dioProvider));
}

@riverpod
PlaceRepositoryImpl placeRepository(PlaceRepositoryRef ref) {
  return PlaceRepositoryImpl(ref.watch(placeServiceProvider));
}

@riverpod
GetPlacesUseCase getPlacesUseCase(GetPlacesUseCaseRef ref) {
  return GetPlacesUseCase(ref.watch(placeRepositoryProvider));
}