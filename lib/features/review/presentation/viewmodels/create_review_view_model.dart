import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_view_model.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/create_place_review_use_case.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/review_detail_view_model.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/states/create_review_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../course/presentation/viewmodels/course_detail_view_model.dart';
import '../../domain/usecases/create_course_review_use_case.dart';

part 'create_review_view_model.g.dart';

@riverpod
class CreateReviewViewModel extends _$CreateReviewViewModel {
  @override
  CreateReviewState build() {
    return CreateReviewState();
  }

  Future<void> createPlaceReview(int placeId, double rate, String content) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      CreatePlaceReviewUseCase createPlaceReviewUseCase = ref.read(createPlaceReviewUseCaseProvider);
      PlaceDetailViewModel placeDetailViewModel = ref.read(placeDetailViewModelProvider(placeId.toString()).notifier);
      ReviewDetailViewModel reviewDetailViewModel = ref.read(reviewDetailViewModelProvider.notifier);
      await createPlaceReviewUseCase.call(placeId, rate, content);
      await placeDetailViewModel.refreshPlaceDetailBackground(placeId.toString());
      await reviewDetailViewModel.refreshReviewsBackground(placeId.toString(), '0', '20');

      state = state.copyWith(status: UiStatus.success);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> createCourseReview(int courseId, double rate, String content) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      CreateCourseReviewUseCase createCourseReviewUseCase = ref.read(createCourseReviewUseCaseProvider);
      CourseDetailViewModel courseDetailViewModel = ref.read(courseDetailViewModelProvider.notifier);
      ReviewDetailViewModel reviewDetailViewModel = ref.read(reviewDetailViewModelProvider.notifier);
      await createCourseReviewUseCase.call(courseId, rate, content);
      await courseDetailViewModel.refreshCourseDetailBackground(courseId.toString());
      await reviewDetailViewModel.refreshReviewsBackground(courseId.toString(), '0', '20');

      state = state.copyWith(status: UiStatus.success);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }
}