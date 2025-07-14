import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

enum MontlyBadge {
  lucky,
  nice,
  travelhunter,
}

extension MontlyBadgeExtension on MontlyBadge {
  String get label {
    switch (this) {
      case MontlyBadge.lucky:
        return '럭키 세븐';
      case MontlyBadge.nice:
        return '만나서 반가워';
      case MontlyBadge.travelhunter:
        return '여행 헌터';
    }
  }

  String get iconPath {
    switch (this) {
      case MontlyBadge.lucky:
        return IconPath.montlyBadge('lucky');
      case MontlyBadge.nice:
        return IconPath.montlyBadge('nice');
      case MontlyBadge.travelhunter:
        return IconPath.montlyBadge('travelhunter');
    }
  }

  double get iconWidth {
    switch (this) {
      case MontlyBadge.lucky:
        return 78.w;
      case MontlyBadge.nice:
        return 80.w;
      case MontlyBadge.travelhunter:
        return 73.w;

    }
  }
  double get iconHeight {
    switch (this) {
      case MontlyBadge.lucky:
        return 62.h;
      case MontlyBadge.nice:
        return 62.h;
      case MontlyBadge.travelhunter:
        return 62.h;

    }
  }
}