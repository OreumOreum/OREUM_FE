import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/di/course_providers.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/states/place_detail_state.dart';
import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/states/my_review_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../di/review_providers.dart';
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