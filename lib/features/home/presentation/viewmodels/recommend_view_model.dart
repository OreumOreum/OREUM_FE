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
  Future<void> fetchPlaces(int contentTypeId) async {
    state = state.copyWith(
      status: UiStatus.loading,
      currentPage: 0,
      filteredPlaces: [],
      selectedContentTypeId: contentTypeId,
    );

    int? sigunguCode;
    if (state.selectedFilter == RegionFilter.jeju) {
      sigunguCode = 4;
    } else if (state.selectedFilter == RegionFilter.seogwipo) {
      sigunguCode = 3;
    }

    try {
      final myTravelType = await ref.read(myTravelTypeProvider.future);
      final usecase = ref.read(getPlacesUseCaseProvider);
      final response = await usecase.call(
        contentTypeId: contentTypeId,
        sigunguCode: sigunguCode,
        type: true,
        pageable: {'page': 0, 'size': 20, 'sort': 'review'},
      );
      state = state.copyWith(
        status: UiStatus.success,
        originalPlaces: response.content,
        filteredPlaces: response.content,
        isLastPage: response.last,
        myTravelType: myTravelType,
      );
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> fetchNextPage(int contentTypeId) async {
    if (state.isLastPage || state.isLoadingNextPage) return;

    state = state.copyWith(isLoadingNextPage: true);
    final nextPage = state.currentPage + 1;

    int? sigunguCode;
    if (state.selectedFilter == RegionFilter.jeju) sigunguCode = 4;
    else if (state.selectedFilter == RegionFilter.seogwipo) sigunguCode = 3;

    try {
      final usecase = ref.read(getPlacesUseCaseProvider);
      final response = await usecase.call(
        contentTypeId: contentTypeId,
        sigunguCode: sigunguCode,
        type: true,
        pageable: {'page': nextPage, 'size': 20, 'sort': 'review'},
      );

      state = state.copyWith(
        filteredPlaces: [...state.filteredPlaces, ...response.content],
        currentPage: nextPage,
        isLastPage: response.last,
        isLoadingNextPage: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingNextPage: false);
      print('다음 페이지 로딩 실패: $e');
    }
  }
  void setFilter(RegionFilter filter, int contentTypeId) {
    if (state.selectedFilter == filter) return;
    state = state.copyWith(selectedFilter: filter);
    fetchPlaces(contentTypeId);
  }
  void setContentTypeId(int contentTypeId) {
    if (state.selectedContentTypeId == contentTypeId) return;
    // state.selectedContentTypeId는 fetchPlaces 내부에서 업데이트됩니다.
    fetchPlaces(contentTypeId);
  }
}