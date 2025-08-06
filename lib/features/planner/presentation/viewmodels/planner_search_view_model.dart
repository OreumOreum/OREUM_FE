import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/place/data/models/search_place_response.dart';
import 'package:oreum_fe/features/place/di/place_providers.dart';
import 'package:oreum_fe/features/place/domain/usecases/search_places_use_case.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/custom_logger.dart';

part 'planner_search_view_model.g.dart';

@riverpod
class PlannerSearchViewModel extends _$PlannerSearchViewModel {
  @override
  PlannerSearchState build() {
    return PlannerSearchState();
  }

  Future<void> searchPlaces(String keyword, {int? sigunguCode}) async {
    if (keyword.isEmpty) {
      state = state.copyWith(isSearching: false, searchPlace: null);
    } else {
      state = state.copyWith(status: UiStatus.loading, isSearching: true);
      try {
        const int initialPage = 0;

        state = state.copyWith(
          status: UiStatus.loading,
          isSearching: true,
          searchPlace: null,
        );

        SearchPlacesUseCase searchPlacesUseCase =
            ref.read(searchPlacesUseCaseProvider);
        SearchPlaceResponse searchPlace = await searchPlacesUseCase
            .call(keyword, state.currentPage, sigunguCode: sigunguCode);
        state = state.copyWith(
          status: UiStatus.success,
          searchPlace: searchPlace,
          isLastPage: searchPlace.isLastPage,
          keyword: keyword,
        );
      } catch (e) {
        state = state.copyWith(
          status: UiStatus.error,
          errorMessage: e.toString(),
        );
      }
    }
  }

  Future<void> loadNextPage({int? sigunguCode}) async {
    if (state.paginationStatus == UiStatus.loading || state.isLastPage) return;
    final int nextPage = state.currentPage + 1;
    state = state.copyWith(paginationStatus: UiStatus.loading);
    try {
      SearchPlacesUseCase searchPlacesUseCase =
          ref.read(searchPlacesUseCaseProvider);
      SearchPlaceResponse searchPlace = await searchPlacesUseCase
          .call(state.keyword, nextPage, sigunguCode: sigunguCode);
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
