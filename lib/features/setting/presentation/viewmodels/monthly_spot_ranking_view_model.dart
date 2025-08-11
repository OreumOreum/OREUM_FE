import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/spot/data/models/spot_ranking_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import 'states/monthly_spot_ranking_state.dart';

part 'monthly_spot_ranking_view_model.g.dart';

@riverpod
class MonthlySpotRankingViewModel extends _$MonthlySpotRankingViewModel {
  @override
  MonthlySpotRankingState build() {
    return const MonthlySpotRankingState();
  }

  Future<void> fetchRanking({required String spotId}) async {
    state = state.copyWith(status: UiStatus.loading);

    try {
      final myTypeState = ref.read(myTravelTypeProvider);
      final myTravelType = myTypeState.myTravelType;
      final usecase = ref.read(getSpotRankingUseCaseProvider);
      final rankingData = await usecase.call(spotId);

      int myTypeVisitCount = 0;
      try {
        final myRankInfo = rankingData.firstWhere((info) =>
            info.categoryType.toLowerCase() == myTravelType?.name.toLowerCase());
        myTypeVisitCount = myRankInfo.visitCount;
      } catch (e) {
        // Just keep the count as 0
      }

      final Set<String> receivedTypes =
          rankingData.map((e) => e.categoryType.toLowerCase()).toSet();
      final List<SpotRankingResponse> missingData = TravelType.values
          .where((type) => !receivedTypes.contains(type.name.toLowerCase()))
          .map((type) => SpotRankingResponse(
                rank: 0,
                categoryType: type.name.toUpperCase(),
                visitCount: 0,
              ))
          .toList();
      final combinedList = [...rankingData, ...missingData];
      combinedList.sort((a, b) => b.visitCount.compareTo(a.visitCount));

      state = state.copyWith(
        status: UiStatus.success,
        fullRankingList: combinedList,
        myTravelType: myTravelType,
        myTypeVisitCount: myTypeVisitCount,
      );
    } catch (e) {
      state = state.copyWith(
        status: UiStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
