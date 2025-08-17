import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/data/models/planner_recommend_response.dart';
import 'package:oreum_fe/features/planner/data/models/planner_request.dart';
import 'package:oreum_fe/features/planner/di/planner_providers.dart';
import 'package:oreum_fe/features/planner/domain/usecases/create_planner_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/edit_planner_places_use_case.dart';
import 'package:oreum_fe/features/planner/domain/usecases/get_recommend_planner_use_case.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_list_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_edit_state.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/custom_logger.dart';

part 'planner_edit_view_model.g.dart';

@Riverpod(keepAlive: false)
class PlannerEditViewModel extends _$PlannerEditViewModel  {
  @override
  PlannerEditState build() {
    return PlannerEditState();
  }

  bool get hasPlannerPlaces => state.plannerPlaces.isNotEmpty;

  void initializeForEdit() {
    // 이미 데이터가 있다면 초기화하지 않음
    if (state.plannerPlaces.isNotEmpty) {
      // 기존 데이터를 기반으로 탭 데이터 업데이트
      final uniqueDays = state.plannerPlaces.map((p) => p.day).toSet().toList()
        ..sort();
      if (uniqueDays.isNotEmpty && !_listsEqual(state.tabDays, uniqueDays)) {
        state = state.copyWith(tabDays: uniqueDays);
      }
    }
  }

  bool _listsEqual(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void resetForNewPlanner() {
    // 새 플래너 생성 시에만 완전 초기화
    state = PlannerEditState();
  }

  void setPlannerPlaces(List<PlannerEditPlace> places) {
    state = state.copyWith(plannerPlaces: places);
  }

  void addTab() {
    if (state.tabDays.length >= 14) return;
    final nextDay = state.tabDays.length + 1;
    state = state.copyWith(tabDays: [...state.tabDays, nextDay]);
  }

  void removeTab(int index) {
    if (state.tabDays.length <= 1) return; // 최소 1개 유지

    final removedDay = state.tabDays[index];

    // 해당 day 삭제
    final updatedTabDays = [...state.tabDays]..removeAt(index);

    // day를 기준으로 재정렬된 새로운 tabDays (1부터 순서대로)
    final newTabDays = List.generate(updatedTabDays.length, (i) => i + 1);

    // 기존 tabDays -> 새로운 tabDays 매핑
    final dayMapping = <int, int>{};
    for (int i = 0; i < updatedTabDays.length; i++) {
      dayMapping[updatedTabDays[i]] = newTabDays[i];
    }

    // plannerPlaces: 제거된 day는 제외하고, 나머지는 day 리매핑
    final newPlaces = state.plannerPlaces
        .where((p) => p.day != removedDay)
        .map((p) => p.copyWith(day: dayMapping[p.day]!))
        .toList();

    state = state.copyWith(
      tabDays: newTabDays,
      plannerPlaces: newPlaces,
    );
  }

  void reorderTabs(int oldIndex, int newIndex) {
    final updatedList = [...state.tabDays];
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    state = state.copyWith(tabDays: updatedList);
  }

  void addPlace(int day, String placeId, String title, String? address) {
    final orderIndex = state.plannerPlaces.where((p) => p.day == day).length;
    final newPlace = PlannerEditPlace(
        day: day,
        orderIndex: orderIndex,
        placeId: placeId,
        title: title,
        address: address);
    state = state.copyWith(plannerPlaces: [...state.plannerPlaces, newPlace]);
    print('리스트: ${state.plannerPlaces}');
  }

  void reorderPlaces(int day, int oldIndex, int newIndex) {
    final dayPlaces = state.plannerPlaces.where((p) => p.day == day).toList();

    if (oldIndex < 0 || oldIndex >= dayPlaces.length) return;
    if (newIndex < 0 || newIndex > dayPlaces.length) return;

    final movingPlace = dayPlaces.removeAt(oldIndex);
    dayPlaces.insert(newIndex, movingPlace);

    final updatedDayPlaces = <PlannerEditPlace>[];
    for (int i = 0; i < dayPlaces.length; i++) {
      final place = dayPlaces[i];
      updatedDayPlaces.add(place.copyWith(orderIndex: i));
    }

    final otherPlaces = state.plannerPlaces.where((p) => p.day != day).toList();

    state =
        state.copyWith(plannerPlaces: [...otherPlaces, ...updatedDayPlaces]);
    print('섞음: ${state.plannerPlaces.toString()}');
  }

  void removePlace(int day, int orderIndex) {
    final dayPlaces = state.plannerPlaces.where((p) => p.day == day).toList();

    final target = dayPlaces.firstWhere(
      (p) => p.orderIndex == orderIndex,
      orElse: () => throw Exception('해당 orderIndex를 찾을 수 없음'),
    );

    dayPlaces.remove(target);

    final reorderedDayPlaces = <PlannerEditPlace>[];
    for (int i = 0; i < dayPlaces.length; i++) {
      reorderedDayPlaces.add(dayPlaces[i].copyWith(orderIndex: i));
    }

    final otherPlaces = state.plannerPlaces.where((p) => p.day != day).toList();

    state = state.copyWith(
      plannerPlaces: [...otherPlaces, ...reorderedDayPlaces],
    );

    print('삭제 후: ${state.plannerPlaces}');
  }

  Future<void> createPlanner(String name) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      CreatePlannerUseCase createPlannerUseCase =
          ref.watch(createPlannerUseCaseProvider);

      PlannerRequest planner = _mapEditPlacesToPlannerRequest(
          name: name, editPlaces: state.plannerPlaces);
      await createPlannerUseCase.call(planner);
      await ref
          .read(plannerListViewModelProvider.notifier)
          .refreshPlannersInBackground();
      state = state.copyWith(status: UiStatus.success, plannerPlaces: []);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
      logger.e(e.toString());
    }
  }

  Future<void> editPlannerPlaces(String name, String plannerId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      EditPlannerPlacesUseCase editPlannerPlacesUseCase =
          ref.watch(editPlannerPlacesUseCaseProvider);

      PlannerRequest planner = _mapEditPlacesToPlannerRequest(
          name: name, editPlaces: state.plannerPlaces);
      await editPlannerPlacesUseCase.call(plannerId, planner);
      //await ref.read(plannerListViewModelProvider.notifier).refreshPlannersInBackground();
      await ref
          .read(plannerDetailViewModelProvider.notifier)
          .refreshPlannerDetailInBackground(plannerId);
      state = state.copyWith(status: UiStatus.success, plannerPlaces: []);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
      logger.e(e.toString());
    }
  }

  PlannerRequest _mapEditPlacesToPlannerRequest({
    required String name,
    required List<PlannerEditPlace> editPlaces,
  }) {
    final places = editPlaces
        .map((e) => Place(
              placeId: int.parse(e.placeId),
              day: e.day,
              order: e.orderIndex,
            ))
        .toList();

    PlannerRequest planner = PlannerRequest(name: name, places: places);
    return planner;
  }

  Future<void> getRecommendPlanner() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      print('📡 추천 플래너 API 호출 시작');
      GetRecommendPlannerUseCase getRecommendPlannerUseCase =
      ref.read(getRecommendPlannerUseCaseProvider);
      PlannerRecommendResponse plannerRecommend =
      await getRecommendPlannerUseCase.call();

      print('✅ API 응답 받음:');
      print('  - 플래너 이름: ${plannerRecommend.plannerName}');
      print('  - 받은 장소 수: ${plannerRecommend.placeList.length}');

      List<PlannerEditPlace> editPlaces =
          toPlannerEditPlaces(plannerRecommend.placeList);
      state = state.copyWith(
          status: UiStatus.success,
          recommendPlannerName: plannerRecommend.plannerName,
          plannerPlaces: editPlaces);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  List<PlannerEditPlace> toPlannerEditPlaces(
      List<PlannerRecommendItem> recommendPlaces) {
    return recommendPlaces.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return PlannerEditPlace(
        placeId: item.placeId.toString(),
        title: item.placeTitle,
        address: item.placeAddress,
        day: 1,
        orderIndex: index,
      );
    }).toList();
  }
}

final plannerPlacesByDayProvider =
    Provider.family<List<PlannerEditPlace>, int>((ref, day) {
  final state = ref.watch(plannerEditViewModelProvider);
  return state.plannerPlaces.where((place) => place.day == day).toList();
});
