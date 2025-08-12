import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/states/monthly_spot_detail_state.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/states/monthly_spot_state.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_detail.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:oreum_fe/features/spot/domain/usecases/get_year_month_spot_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../spot/domain/usecases/get_year_spot_use_case.dart';

part 'monthly_spot_detail_view_model.g.dart';

@riverpod
class MonthlySpotDetailViewModel extends _$MonthlySpotDetailViewModel {
  @override
  MonthlySpotDetailState build() {
    return MonthlySpotDetailState();
  }

  Future<void> initiallizeMonthlySpot(String year, String month) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final GetYearMonthSpotUseCase getYearMonthSpotUseCase = ref.read(getYearMonthSpotUseCaseProvider);
      List<SpotMonthResponse> spots = await getYearMonthSpotUseCase.call(year, month);
      state = state.copyWith(status: UiStatus.success, spotsByMonth: spots);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }
}