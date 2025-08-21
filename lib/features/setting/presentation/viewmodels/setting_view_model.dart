import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:oreum_fe/core/constants/montly_badge.dart';
import 'package:oreum_fe/features/spot/di/spot_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/ui_status.dart';
import 'states/setting_state.dart';

part 'setting_view_model.g.dart';

@riverpod
class SettingViewModel extends _$SettingViewModel {
  @override
  SettingState build() {
    Future.microtask(() => fetchMyBadges());
    return const SettingState(status: UiStatus.loading);
  }

  Future<void> fetchMyBadges() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final usecase = ref.read(getYearSpotUseCaseProvider);
      final stamps = await usecase.call();
      print('✅ API 응답 (원본 스탬프): $stamps');

      final Map<String, Set<int>> stampsByMonth = {};
      for (final stamp in stamps) {
        stampsByMonth.putIfAbsent(stamp.month, () => {}).add(stamp.order);
      }
      print('✅ 월별 그룹핑 결과: $stampsByMonth');

      final Map<String, int> monthNameMap = {
        'JANUARY': 1, 'FEBRUARY': 2, 'MARCH': 3, 'APRIL': 4, 'MAY': 5,
        'JUNE': 6, 'JULY': 7, 'AUGUST': 8, 'SEPTEMBER': 9, 'OCTOBER': 10,
        'NOVEMBER': 11, 'DECEMBER': 12,
      };

      final Map<String, MontlyBadge> badgeMap = {
        for (var badge in MontlyBadge.values) badge.name: badge
      };

      final List<MontlyBadge> myBadges = [];
      stampsByMonth.forEach((monthName, orders) {
        final monthNumber = monthNameMap[monthName.toUpperCase()];
        if (monthNumber == null) return;

        // 서귀포 뱃지 (order 0, 1)
        if (orders.contains(0) && orders.contains(1)) {
          final badgeName = 'badge_seogwipo_$monthNumber';
          if (badgeMap.containsKey(badgeName)) {
            myBadges.add(badgeMap[badgeName]!);
          }
        }
        // 제주시 뱃지 (order 2, 3)
        if (orders.contains(2) && orders.contains(3)) {
          final badgeName = 'badge_jeju_$monthNumber';
          if (badgeMap.containsKey(badgeName)) {
            myBadges.add(badgeMap[badgeName]!);
          }
        }
      });
      print('✅ 최종 획득 뱃지: ${myBadges.map((b) => b.name).toList()}');


      state = state.copyWith(status: UiStatus.success, earnedBadges: myBadges);

    } catch (e) {
      print('🚨 뱃지 로딩 실패: $e');
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }
}