import 'package:oreum_fe/features/home/di/home_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../place/data/models/search_place_response.dart';
import '../../../place/di/place_providers.dart';
import '../../../place/domain/usecases/search_places_use_case.dart';
import '../../../planner/presentation/viewmodels/states/planner_search_state.dart';
import 'states/search_state.dart';

part 'search_view_model.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  PlannerSearchState build() {
    return PlannerSearchState();
  }

  Future<void> searchPlaces(String keyword) async {
    if (keyword.isEmpty) {
      state = state.copyWith(isSearching: false, searchPlace: null);
      return;
    }

    state = state.copyWith(status: UiStatus.loading, isSearching: true);

    try {
      SearchPlacesUseCase searchPlacesUseCase =
      ref.read(searchPlacesUseCaseProvider);
      SearchPlaceResponse searchPlace = await searchPlacesUseCase
          .call(keyword, state.currentPage);
      state = state.copyWith(
        status: UiStatus.success,
        searchPlace: searchPlace,
        isLastPage: searchPlace.isLastPage,
        keyword: keyword,
      );
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loadNextPage() async {
    if (state.paginationStatus == UiStatus.loading || state.isLastPage) return;
    final int nextPage = state.currentPage + 1;
    state = state.copyWith(paginationStatus: UiStatus.loading);
    try {
      SearchPlacesUseCase searchPlacesUseCase =
      ref.read(searchPlacesUseCaseProvider);
      SearchPlaceResponse searchPlace = await searchPlacesUseCase
          .call(state.keyword, nextPage);
      state = state.copyWith(
        paginationStatus: UiStatus.success,
        currentPage: nextPage,
        searchPlace: searchPlace.copyWith(
            content: [...?state.searchPlace?.content, ...searchPlace.content]),
        isLastPage: searchPlace.isLastPage,
      );
    } catch (e) {
      state = state.copyWith(
        paginationStatus: UiStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}