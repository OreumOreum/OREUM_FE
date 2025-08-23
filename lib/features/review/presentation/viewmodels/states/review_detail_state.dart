import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

part 'review_detail_state.freezed.dart';

@freezed
class ReviewDetailState with _$ReviewDetailState {
  const factory ReviewDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus paginationStatus,
    @Default('') String errorMessage,
    @Default([]) List<ReviewResponse> reviews,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default('') String keyword,
  }) = _ReviewDetailState;
}