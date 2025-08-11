import 'dart:async';

import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/home/di/weather_providers.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';
import 'package:oreum_fe/features/home/domain/use_cases/get_weather_info_use_case.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:intl/intl.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_monthly_spot_state.dart';
import 'package:oreum_fe/features/spot/data/models/spot_ranking_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';

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
      GetWeatherInfoUseCase getWeatherInfoUseCase =
      ref.read(getWeatherInfoUseCaseProvider);
      WeatherInfo weatherInfo = await getWeatherInfoUseCase.call();
      final myTravelType = await ref.read(myTravelTypeProvider.future);
      final now = DateTime.now();
      final year = now.year;
      final month = now.month;
      final getMonthSpotUseCase = ref.read(getYearMonthSpotUseCaseProvider);
      final spots =
      await getMonthSpotUseCase.call(year.toString(), month.toString());
      if (spots.isEmpty) {
        state = state.copyWith(status: UiStatus.success, monthlySpots: []);
        return;
      }
      final getRankingUseCase = ref.read(getSpotRankingUseCaseProvider);
      final rankingFutures = spots
          .map((spot) => getRankingUseCase.call(spot.spotId.toString()))
          .toList();
      final List<List<SpotRankingResponse>> rankingsForAllSpots =
      await Future.wait(rankingFutures);
      final Map<int, int> visitCounts = {};
      for (int i = 0; i < spots.length; i++) {
        final spot = spots[i];
        final rankingData = rankingsForAllSpots[i];
        int myTypeVisitCount = 0;
        try {
          final myRankInfo = rankingData.firstWhere((rank) =>
          rank.categoryType.toLowerCase() == myTravelType.name.toLowerCase());
          myTypeVisitCount = myRankInfo.visitCount;
        } catch (e) {
          myTypeVisitCount = 0;
        }
        visitCounts[spot.spotId] = myTypeVisitCount;
      }
      state = state.copyWith(
        status: UiStatus.success,
        monthlySpots: spots,
        myTypeVisitCounts: visitCounts,
        year: year,
        month: month,
      );
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
  Future<void> fetchMonthlySpots() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final myTravelType = await ref.read(myTravelTypeProvider.future);
      final now = DateTime.now();
      final year = now.year;
      final month = now.month;
      final getMonthSpotUseCase = ref.read(getYearMonthSpotUseCaseProvider);

      final spots = await getMonthSpotUseCase.call(year.toString(), month.toString());

      if (spots.isEmpty) {
        state = state.copyWith(status: UiStatus.success, monthlySpots: []);
        return;
      }
      final getRankingUseCase = ref.read(getSpotRankingUseCaseProvider);
      final rankingFutures = spots
          .map((spot) => getRankingUseCase.call(spot.spotId.toString()))
          .toList();
      final List<List<SpotRankingResponse>> rankingsForAllSpots =
      await Future.wait(rankingFutures);
      final Map<int, int> visitCounts = {};
      for (int i = 0; i < spots.length; i++) {
        final spot = spots[i];
        final rankingData = rankingsForAllSpots[i];
        int myTypeVisitCount = 0;
        try {
          final myRankInfo = rankingData.firstWhere(
                  (rank) => rank.categoryType.toLowerCase() == myTravelType.name.toLowerCase()
          );
          myTypeVisitCount = myRankInfo.visitCount;
        } catch (e) {
          myTypeVisitCount = 0;
        }
        visitCounts[spot.spotId] = myTypeVisitCount;
      }
      state = state.copyWith(
        status: UiStatus.success,
        monthlySpots: spots,
        myTypeVisitCounts: visitCounts,
        year: year,
        month: month,
      );
    } catch (e) {
      state = state.copyWith(
        status: UiStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
