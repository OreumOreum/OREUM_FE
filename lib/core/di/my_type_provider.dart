import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';

// setting 기능의 provider들을 import 합니다.
import 'package:oreum_fe/features/setting/di/setting_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/ui_status.dart';

part 'my_type_provider.g.dart';

part 'my_type_provider.freezed.dart';

@Riverpod(keepAlive: true)
class MyTravelType extends _$MyTravelType {
  @override
  MyTravelTypeState build() {
    return MyTravelTypeState();
  }

  Future<void> getMyTravelType() async {
    try {
      final usecase = ref.read(getMyInfoUseCaseProvider);
      final myInfo = await usecase.call();
      final categoryString = myInfo.categoryType ?? '유형이 없습니다';

      final myType = TravelType.values.firstWhere(
            (e) => e.name.toLowerCase() == categoryString.toLowerCase(),
        orElse: () => TravelType.ACTIVITY,
      );
      state = state.copyWith(status:UiStatus.success, myTravelType:myType);
    } catch (e) {}
  }
}

@freezed
class MyTravelTypeState with _$MyTravelTypeState {
  const factory MyTravelTypeState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    TravelType? myTravelType,
  }) = _MyTravelTypeState;
}
