// PlaceDetailViewModel 상단 import 부분을 다음과 같이 수정:

import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/course/di/course_providers.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:oreum_fe/features/folder/data/models/folder_place_request.dart';
import 'package:oreum_fe/features/folder/di/folder_providers.dart';
import 'package:oreum_fe/features/folder/domain/usecases/add_default_folder_use_case.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/states/place_detail_state.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:oreum_fe/features/tour/data/models/tour_response.dart';
import 'package:oreum_fe/features/tour/di/tour_providers.dart';
import 'package:oreum_fe/features/tour/domain/usecases/get_tour_api_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// course Place를 숨기고 alias 사용
import '../../../course/data/models/course_detail_response.dart' hide Place;
import '../../../folder/domain/usecases/delete_default_folder_use_case.dart';
import '../../../home/di/home_providers.dart';
import '../../../home/domain/usecases/get_type_recommend_use_case.dart';
// home의 Place를 명시적으로 import
import 'package:oreum_fe/features/home/data/models/place_response.dart';
import '../../di/place_providers.dart';
import '../../domain/usecases/get_place_use_case.dart';

part 'place_detail_view_model.g.dart';

@riverpod
class PlaceDetailViewModel extends _$PlaceDetailViewModel {
  @override
  PlaceDetailState build(String placeId) { // 🔥 placeId 파라미터 추가
    return PlaceDetailState();
  }

  Future<void> initializePlaceDetail(String placeId, String contentId,
      String contentTypeId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final GetPlaceUseCase getPlaceUseCase = ref.read(getPlaceUseCaseProvider);
      final GetPlaceReviewsUseCase getPlaceReviewsUseCase = ref.read(
          getPlaceReviewsUseCaseProvider);
      final GetTourApiUseCase getTourApiUseCase = ref.read(
          getTourApiUseCaseProvider);
      final GetTypeRecommendUseCase getTypeRecommendUseCase = ref.read(
          getTypeRecommendUseCaseProvider);
      TourResponse tour = await getTourApiUseCase.call(
          contentId, contentTypeId);
      PlaceResponse place = await getPlaceUseCase.call(placeId);
      List<ReviewResponse> reviews = await getPlaceReviewsUseCase.call(
          placeId, '0', '4');
      List<Place> typePlaces = await getTypeRecommendUseCase.call();
      state = state.copyWith(
          status: UiStatus.success, place: place, reviews: reviews, tour: tour, typePlaces: typePlaces);
    }
    catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
      print('errorMessage: ${e.toString()}');
    }
  }

  Future<void> refreshPlaceDetailBackground(String placeId) async {
    try {
      final GetPlaceReviewsUseCase getPlaceReviewsUseCase = ref.read(
          getPlaceReviewsUseCaseProvider);
      List<ReviewResponse> reviews = await getPlaceReviewsUseCase.call(
          placeId, '0', '4');
      state = state.copyWith(reviews: reviews);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> addDefaultFolder(int placeId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      final AddDefaultFolderUseCase addDefaultFolderUseCase = ref.read(
          addDefaultFolderUseCaseProvider);
      await addDefaultFolderUseCase.call(placeId);

      state = state.copyWith(
        buttonStatus: UiStatus.success,
        place: state.place?.copyWith(isSaved: true),
      );
      print('successs');
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error,
          errorMessage: e.toString()
      );
      print('errorrr: $e');
    }
  }

  Future<void> deleteDefaultFolder(int placeId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      final DeleteDefaultFolderUseCase deleteDefaultFolderUseCase = ref.read(
          deleteDefaultFolderUseCaseProvider);
      await deleteDefaultFolderUseCase.call(placeId);

      state = state.copyWith(
        buttonStatus: UiStatus.success,
        place: state.place?.copyWith(isSaved: false),
      );
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }
}