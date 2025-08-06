import 'package:oreum_fe/features/setting/presentation/viewmodels/states/monthly_spot_state.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../spot/domain/usecases/get_year_spot_use_case.dart';

part 'monthly_spot_view_model.g.dart';

@riverpod
class MonthlySpotViewModel extends _$MonthlySpotViewModel {
  @override
  MonthlySpotState build() {
    return MonthlySpotState();
  }

  // 1. 월 이름과 숫자를 매핑하는 Map을 만듭니다.
  static const Map<String, int> _monthMap = {
    'JANUARY': 1, 'FEBRUARY': 2, 'MARCH': 3, 'APRIL': 4,
    'MAY': 5, 'JUNE': 6, 'JULY': 7, 'AUGUST': 8,
    'SEPTEMBER': 9, 'OCTOBER': 10, 'NOVEMBER': 11, 'DECEMBER': 12,
  };

  Future<void> initiallizeMonthlySpot() async {
    state = state.copyWith(status: MonthlySpotStatus.loading);
    try {
      final GetYearSpotUseCase getYearSpotUseCase = ref.read(getYearSpotUseCaseProvider);
      List<SpotResponse> spots = await getYearSpotUseCase.call();

      // 2. map을 사용해 spots 리스트의 각 항목을 변환합니다.
      final transformedSpots = spots.map((spot) {
        // 영어 월을 숫자로 변환합니다 (월 이름이 없는 경우 기본값 1).
        final monthNumber = _monthMap[spot.month.toUpperCase()] ?? 1;

        // copyWith를 사용해 month 필드만 새로운 값(숫자 문자열)으로 교체합니다.
        return spot.copyWith(month: monthNumber.toString());
      }).toList();
      final Map<String, List<SpotResponse>> spotsByMonth = {};

      for (final spot in transformedSpots) {
        spotsByMonth.putIfAbsent(spot.month, () => []).add(spot);
      }
      spotsByMonth.forEach((month, spotList) {
        spotList.sort((a, b) => a.order.compareTo(b.order));
      });

      print('변환된 spots: $transformedSpots');

      // 3. 변환된 리스트로 상태를 업데이트합니다.
      state = state.copyWith(status: MonthlySpotStatus.success, spotsByMonth: spotsByMonth);
    } catch (e) {
      state = state.copyWith(status: MonthlySpotStatus.error, errorMessage: e.toString());
    }
  }
}