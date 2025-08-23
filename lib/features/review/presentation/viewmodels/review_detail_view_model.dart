import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/states/review_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/delete_my_review_use_case.dart';
import '../../domain/usecases/get_course_reviews_use_case.dart';

part 'review_detail_view_model.g.dart';

@riverpod
class ReviewDetailViewModel extends _$ReviewDetailViewModel {
  @override
  ReviewDetailState build() {
    return ReviewDetailState(status: UiStatus.loading);
  }

  Future<void> getPlaceReviews(String placeId, String page, String size) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetPlaceReviewsUseCase getPlaceReviewsUseCase =
          ref.read(getPlaceReviewsUseCaseProvider);
      List<ReviewResponse> reviews =
          await getPlaceReviewsUseCase.call(placeId, page, size);
      state = state.copyWith(status: UiStatus.success, reviews: reviews);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> getCourseReviews(String courseId, String page, String size) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetCourseReviewsUseCase getCourseReviewsUseCase =
      ref.read(getCourseReviewsUseCaseProvider);
      List<ReviewResponse> reviewsCourse =
      await getCourseReviewsUseCase.call(courseId, page, size);
      state = state.copyWith(status: UiStatus.success, reviews: reviewsCourse);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> refreshReviewsBackground(String placeId, String page, String size) async {
    try {
      GetPlaceReviewsUseCase getPlaceReviewsUseCase =
      ref.read(getPlaceReviewsUseCaseProvider);
      List<ReviewResponse> reviews =
      await getPlaceReviewsUseCase.call(placeId, page, size);
      state = state.copyWith(reviews: reviews);
    } catch (e) {
      state =
          state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> refreshCourseReviewsBackground(String courseId, String page, String size) async {
    try {
      GetCourseReviewsUseCase getCourseReviewsUseCase =
      ref.read(getCourseReviewsUseCaseProvider);
      List<ReviewResponse> reviewsCourse =
      await getCourseReviewsUseCase.call(courseId, page, size);
      state = state.copyWith(reviews: reviewsCourse);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> deleteReview(int reviewId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      final DeleteMyReviewUseCase deleteMyReviewUseCase = ref.read(deleteMyReviewUseCaseProvider);
      await deleteMyReviewUseCase.call(reviewId);
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }
}
