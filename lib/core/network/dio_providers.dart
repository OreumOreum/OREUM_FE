import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/dio_options.dart';
import 'package:oreum_fe/core/constants/tour_dio_base_options.dart';
import 'package:oreum_fe/core/di/local_storage_providers.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/token_providers.dart';
import 'package:oreum_fe/core/network/dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio (DioRef ref) {
  final loginNotifier = ref.watch(loginNotifierProvider);
  final storageRepo = ref.watch(secureStorageRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);

  final dio = Dio(dioBaseOptions);
  dio.interceptors.clear();
  dio.interceptors.add(DioInterceptor(storageRepo, loginNotifier, tokenSaver));

  return dio;
}

@Riverpod(keepAlive: true)
Dio tourDio (TourDioRef ref) {
  final dio = Dio(tourDioBaseOptions);
  return dio;
}

@Riverpod(keepAlive: true)
Dio weatherDio (WeatherDioRef ref) {
  final dio = Dio(weatherDioBaseOptions);

  return dio;
}