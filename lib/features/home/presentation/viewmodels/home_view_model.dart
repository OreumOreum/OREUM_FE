import 'dart:async';

import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/home/di/weather_providers.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';
import 'package:oreum_fe/features/home/domain/use_cases/get_weather_info_use_case.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

///날씨 상태 Ui따로 고려
@riverpod
class HomeViewModel extends _$HomeViewModel {
  Timer? _weatherTimer;
  @override
  HomeState build() {
    _startWeatherTimer();
    ref.onDispose(() {
      _weatherTimer?.cancel();
    });
    return HomeState(status: UiStatus.loading);
  }

  Future<void> initializeHome() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetWeatherInfoUseCase getWeatherInfoUseCase = ref.read(getWeatherInfoUseCaseProvider);
      WeatherInfo weatherInfo = await getWeatherInfoUseCase.call();
      state = state.copyWith(status: UiStatus.success, weatherInfo: weatherInfo);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> refreshWeatherBackground() async {
    try {
      GetWeatherInfoUseCase getWeatherInfoUseCase = ref.read(getWeatherInfoUseCaseProvider);
      WeatherInfo weatherInfo = await getWeatherInfoUseCase.call();
      state = state.copyWith(weatherInfo: weatherInfo);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  void _startWeatherTimer() {
    _weatherTimer?.cancel();
    _weatherTimer = Timer.periodic(Duration(hours: 1), (_) {
      refreshWeatherBackground();
    });
  }
}
