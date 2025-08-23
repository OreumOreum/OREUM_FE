import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/states/my_review_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_my_reviews_use_case.dart';

part 'my_review_view_model.g.dart';

@riverpod
class MyReviewViewModel extends _$MyReviewViewModel {
  @override
  MyReviewState build() {
    return MyReviewState();
  }

  Future<void> initializeMyReview() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final GetMyReviewsUseCase getMyReviewsUseCase = ref.read(getMyReviewsUseCaseProvider);
      List<MyReviewResponse> myReviews = await getMyReviewsUseCase.call();
      state = state.copyWith(status: UiStatus.success, myReviews: myReviews);
    }
    catch(e){
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }


}