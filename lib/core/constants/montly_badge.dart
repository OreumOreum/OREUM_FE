import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

enum MontlyBadge {
  // 1월
  badge_jeju_1,
  badge_seogwipo_1,
  // 2월
  badge_jeju_2,
  badge_seogwipo_2,
  // 3월
  badge_jeju_3,
  badge_seogwipo_3,
  // 4월
  badge_jeju_4,
  badge_seogwipo_4,
  // 5월
  badge_jeju_5,
  badge_seogwipo_5,
  // 6월
  badge_jeju_6,
  badge_seogwipo_6,
  // 7월
  badge_jeju_7,
  badge_seogwipo_7,
  // 8월
  badge_jeju_8,
  badge_seogwipo_8,
  // 9월
  badge_jeju_9,
  badge_seogwipo_9,
  // 10월
  badge_jeju_10,
  badge_seogwipo_10,
  // 11월
  badge_jeju_11,
  badge_seogwipo_11,
  // 12월
  badge_jeju_12,
  badge_seogwipo_12,
}

extension MontlyBadgeExtension on MontlyBadge {
  String get label {
    final match = RegExp(r'badge_(jeju|seogwipo)_(\d+)').firstMatch(name);
    if (match != null) {
      final region = match.group(1)!;
      final month = match.group(2)!;
      final regionLabel = region == 'jeju' ? '제주시' : '서귀포시';
      return '${month}월 $regionLabel';
    }
    return '';
  }

  String get iconPath {
    return IconPath.badge(name);
  }

  double get iconWidth {
    return 92.w;
  }

  double get iconHeight {
    return 62.h;
  }
}