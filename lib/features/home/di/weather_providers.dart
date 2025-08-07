import 'package:dio/dio.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/home/data/repositories/weather_repository_impl.dart';
import 'package:oreum_fe/features/home/data/services/weather_service.dart';
import 'package:oreum_fe/features/home/domain/use_cases/get_weather_info_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_providers.g.dart';

@riverpod
WeatherService weatherService(WeatherServiceRef ref) {
  final Dio dio = ref.watch(weatherDioProvider);
  return WeatherService(dio);
}

@riverpod
WeatherRepositoryImpl weatherRepositoryImpl(WeatherRepositoryImplRef ref) {
  final WeatherService weatherService = ref.watch(weatherServiceProvider);
  return WeatherRepositoryImpl(weatherService);
}

@riverpod
GetWeatherInfoUseCase getWeatherInfoUseCase(GetWeatherInfoUseCaseRef ref) {
  final WeatherRepositoryImpl weatherRepositoryImpl = ref.watch(weatherRepositoryImplProvider);
  return GetWeatherInfoUseCase(weatherRepositoryImpl);
}