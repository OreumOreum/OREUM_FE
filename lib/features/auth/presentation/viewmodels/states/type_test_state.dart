import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/auth/domain/entities/type_question.dart';

part 'type_test_state.freezed.dart';

@freezed
class TypeTestState with _$TypeTestState {
  const factory TypeTestState({
    required List<TypeQuestion> questions,
    required int currentIndex,
    @Default('') String errorMessage,
    @Default(UiStatus.idle) UiStatus status,
    TravelType? type,
  }) = _TypeTestState;
}