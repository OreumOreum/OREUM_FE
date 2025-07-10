import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/auth/domain/entities/type_question.dart';

part 'type_test_state.freezed.dart';

@freezed
class TypeTestState with _$TypeTestState {
  const factory TypeTestState({
    required List<TypeQuestion> questions,
    required int currentIndex,
  }) = _TypeTestState;
}