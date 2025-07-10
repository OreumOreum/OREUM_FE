import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';

part 'type_question.freezed.dart';

@freezed
class TypeQuestion with _$TypeQuestion {
  const factory TypeQuestion({
    required String questionText,
    required TravelType type,
    int? selectedScore,
  }) = _TypeQuestion;
}