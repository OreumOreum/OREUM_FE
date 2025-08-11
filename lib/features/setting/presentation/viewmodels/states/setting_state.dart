import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/montly_badge.dart';

import '../../../../../core/constants/ui_status.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<MontlyBadge> earnedBadges,
  }) = _SettingState;
}