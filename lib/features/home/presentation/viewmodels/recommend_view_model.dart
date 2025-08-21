import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/features/home/di/home_providers.dart';
import 'package:oreum_fe/features/home/data/models/place_response.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import 'states/recommend_state.dart';

part 'recommend_view_model.g.dart';

@riverpod
class RecommendViewModel extends _$RecommendViewModel {
  @override
  RecommendState build() {
    return const RecommendState();
  }

  Future<void> fetchPlaces(
      int contentTypeId, bool type, RegionFilter regionFilter) async {
    final String sortString =
        state.selectedSortOption == SortOption.review ? 'review' : 'DESC';
    state = state.copyWith(
      status: UiStatus.loading,
      currentPage: 0,
      filteredPlaces: [],
      selectedContentTypeId: contentTypeId,
      selectedFilter: regionFilter,
    );

    int? sigunguCode;
    if (regionFilter == RegionFilter.jeju) {
      sigunguCode = 4;
    } else if (regionFilter == RegionFilter.seogwipo) {
      sigunguCode = 3;
    }

    try {
      final myTypeState = ref.read(myTravelTypeProvider);
      final myTravelType = myTypeState.myTravelType;
      final usecase = ref.read(getPlacesUseCaseProvider);
      final pageable = {'page': 0, 'size': 20, 'sort': sortString};
      print('--- 🕵️ API 요청: fetchPlaces ---');
      print('contentTypeId: $contentTypeId');
      print('sigunguCode: $sigunguCode');
      print('type: $type');
      print('pageable: $pageable');
      print('-----------------------------');
      final response = await usecase.call(
        contentTypeId: contentTypeId,
        sigunguCode: sigunguCode,
        type: type,
        pageable: {'page': 0, 'size': 20, 'sort': sortString},
      );
      final Map<int, bool> bookmarkMap = {
        for (var place in response.content) place.placeId: place.isSaved
      };
      state = state.copyWith(
        status: UiStatus.success,
        originalPlaces: response.content,
        filteredPlaces: response.content,
        isLastPage: response.last,
        myTravelType: myTravelType,
        bookmarkStatusMap: bookmarkMap,
      );
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> fetchNextPage(
      int contentTypeId, bool type, RegionFilter regionFilter) async {
    final String sortString =
        state.selectedSortOption == SortOption.review ? 'review' : 'DESC';
    if (state.isLastPage || state.isLoadingNextPage) return;

    state = state.copyWith(isLoadingNextPage: true);
    final nextPage = state.currentPage + 1;

    int? sigunguCode;
    if (state.selectedFilter == RegionFilter.jeju)
      sigunguCode = 4;
    else if (state.selectedFilter == RegionFilter.seogwipo) sigunguCode = 3;

    try {
      final usecase = ref.read(getPlacesUseCaseProvider);
      final pageable = {'page': nextPage, 'size': 20, 'sort': sortString};
      print('--- 🕵️ API 요청: fetchNextPage  ---');
      print('contentTypeId: $contentTypeId');
      print('sigunguCode: $sigunguCode');
      print('type: $type');
      print('pageable: $pageable');
      print('-----------------------------');
      final response = await usecase.call(
        contentTypeId: contentTypeId,
        sigunguCode: sigunguCode,
        type: type,
        pageable: {'page': nextPage, 'size': 20, 'sort': sortString},
      );
      final Map<int, bool> bookmarkMap = {
        for (var place in response.content) place.placeId: place.isSaved
      };
      state = state.copyWith(
          filteredPlaces: [...state.filteredPlaces, ...response.content],
          currentPage: nextPage,
          isLastPage: response.last,
          isLoadingNextPage: false,
          bookmarkStatusMap: bookmarkMap);
    } catch (e) {
      state = state.copyWith(isLoadingNextPage: false);
      print('다음 페이지 로딩 실패: $e');
    }
  }
  void updateBookmarkStatus(int placeId, bool isSaved) {
    final newMap = Map<int, bool>.from(state.bookmarkStatusMap);
    newMap[placeId] = isSaved;
    state = state.copyWith(bookmarkStatusMap: newMap);
  }
  void setFilter(RegionFilter filter, int contentTypeId, bool type) {
    if (state.selectedFilter == filter) return;
    state = state.copyWith(selectedFilter: filter);
    fetchPlaces(contentTypeId, type, filter);
  }

  void setContentTypeId(RegionFilter filter, int contentTypeId, bool type) {
    if (state.selectedContentTypeId == contentTypeId) return;
    fetchPlaces(contentTypeId, type, filter);
  }

  void setSortOption(
      SortOption option, RegionFilter filter, int contentTypeId, bool type) {
    if (state.selectedSortOption == option) return;
    state = state.copyWith(selectedSortOption: option);
    fetchPlaces(contentTypeId, type, filter);
  }
}
