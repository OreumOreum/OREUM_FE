import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    WeatherInfo? weatherInfo,
}) = _HomeState;
}