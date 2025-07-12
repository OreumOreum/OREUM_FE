import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oreum_fe/features/place/data/models/planner_place.dart';

// 상태 클래스 (그대로)
class PlannerDetailState {
  final List<PlannerPlace> places;
  final bool isLoading;
  final String? error;

  PlannerDetailState({
    required this.places,
    required this.isLoading,
    this.error,
  });

  factory PlannerDetailState.initial() =>
      PlannerDetailState(places: [], isLoading: true, error: null);
}

// FamilyNotifier를 상속받고, build에서 plannerId를 받음
class PlannerDetailViewModel extends AutoDisposeFamilyNotifier<PlannerDetailState, int> {
  late final int plannerId;

  @override
  PlannerDetailState build(int plannerId) {
    this.plannerId = plannerId;
    _fetchData();
    return PlannerDetailState.initial();
  }

  Future<void> _fetchData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final mockData = [
        PlannerPlace(
          plannerPlaceId: 1,
          day: 1,
          order: 1,
          plannerId: plannerId,
          placeId: 101,
          placeTitle: '목데이터 장소 1',
          placeAddress: '서울시 강남구',
          placeThumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        ),
        PlannerPlace(
          plannerPlaceId: 2,
          day: 2,
          order: 1,
          plannerId: plannerId,
          placeId: 102,
          placeTitle: '목데이터 장소 2',
          placeAddress: '서울시 마포구',
          placeThumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        ),
        PlannerPlace(
          plannerPlaceId: 2,
          day: 2,
          order: 2,
          plannerId: plannerId,
          placeId: 103,
          placeTitle: '목데이터 장소 3',
          placeAddress: '서울시 마포구',
          placeThumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        ),
        PlannerPlace(
          plannerPlaceId: 2,
          day: 2,
          order: 3,
          plannerId: plannerId,
          placeId: 104,
          placeTitle: '목데이터 장소 4',
          placeAddress: '서울시 마포구',
          placeThumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        ),
        PlannerPlace(
          plannerPlaceId: 2,
          day: 2,
          order: 3,
          plannerId: plannerId,
          placeId: 105,
          placeTitle: '목데이터 장소 5',
          placeAddress: '서울시 마포구',
          placeThumbnailImage: 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        ),
      ];
      state = PlannerDetailState(places: mockData, isLoading: false, error: null);
    } catch (e) {
      state = PlannerDetailState(places: [], isLoading: false, error: e.toString());
    }
  }

  List<PlannerPlace> getPlacesByDay(int day) {
    return state.places.where((p) => p.day == day).toList();
  }

  List<int> getUniqueDays() {
    return state.places.map((p) => p.day).toSet().toList()..sort();
  }
}

// FamilyProvider 선언
final plannerDetailViewModelProvider = AutoDisposeNotifierProvider.family<
    PlannerDetailViewModel, PlannerDetailState, int>(
  PlannerDetailViewModel.new,
);

