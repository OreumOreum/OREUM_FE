import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_type_selection.g.dart';

@riverpod
class TravelTypeSelection extends _$TravelTypeSelection {
  @override
  TravelType? build() {
    // 초기 선택값 없음(null)
    return null;
  }

  void select(TravelType type) {
    state = type;
  }
}