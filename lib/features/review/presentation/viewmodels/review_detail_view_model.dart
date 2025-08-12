import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/states/review_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
