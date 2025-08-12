import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';

part 'create_review_state.freezed.dart';

@freezed
class CreateReviewState with _$CreateReviewState {
  const factory CreateReviewState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
  }) = _CreateReviewState;
}
