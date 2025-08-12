import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required String sky,
    required String pty,
    required String temp,
  }) = _WeatherInfo;
}