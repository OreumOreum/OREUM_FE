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
  final int _pageSize = 20;

  @override
  ReviewDetailState build() {
    return ReviewDetailState(status: UiStatus.loading);
  }

  Future<void> getInitialPlaceReviews(String placeId) async {
    state = state.copyWith(status: UiStatus.loading, currentPage: 0);
    try {
      GetPlaceReviewsUseCase usecase = ref.read(getPlaceReviewsUseCaseProvider);
      List<ReviewResponse> reviews = await usecase.call(placeId, '0', _pageSize.toString());
      state = state.copyWith(
        status: UiStatus.success,
        reviews: reviews,
        isLastPage: reviews.length < _pageSize,
      );
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loadNextPlacePage(String placeId) async {
    if (state.isLastPage || state.isLoadingNextPage) return;

    state = state.copyWith(isLoadingNextPage: true);
    final nextPage = state.currentPage + 1;

    try {
      GetPlaceReviewsUseCase usecase = ref.read(getPlaceReviewsUseCaseProvider);
      List<ReviewResponse> newReviews = await usecase.call(placeId, nextPage.toString(), _pageSize.toString());

      state = state.copyWith(
        reviews: [...state.reviews, ...newReviews],
        currentPage: nextPage,
        isLastPage: newReviews.length < _pageSize,
        isLoadingNextPage: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingNextPage: false);
    }
  }

  Future<void> getInitialCourseReviews(String courseId) async {
    state = state.copyWith(status: UiStatus.loading, currentPage: 0, reviews: []);
    try {
      GetCourseReviewsUseCase usecase = ref.read(getCourseReviewsUseCaseProvider);
      final reviews = await usecase.call(courseId, '0', _pageSize.toString());
      state = state.copyWith(
        status: UiStatus.success,
        reviews: reviews,
        isLastPage: reviews.length < _pageSize,
      );
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loadNextCoursePage(String courseId) async {
    if (state.isLastPage || state.isLoadingNextPage) return;

    state = state.copyWith(isLoadingNextPage: true);
    final nextPage = state.currentPage + 1;

    try {
      GetCourseReviewsUseCase usecase = ref.read(getCourseReviewsUseCaseProvider);
      final newReviews = await usecase.call(courseId, nextPage.toString(), _pageSize.toString());

      state = state.copyWith(
        reviews: [...state.reviews, ...newReviews],
        currentPage: nextPage,
        isLastPage: newReviews.length < _pageSize,
        isLoadingNextPage: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingNextPage: false);
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
