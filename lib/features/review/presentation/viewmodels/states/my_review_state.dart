import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../../../../../core/constants/ui_status.dart';
import '../../../data/models/my_review_response.dart';

part 'my_review_state.freezed.dart';

@freezed
class MyReviewState with _$MyReviewState{
  const factory MyReviewState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    List<MyReviewResponse>? myReviews,
  }) = _MyReviewState;
}