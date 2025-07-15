import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

enum LargeCategory {
  all,
  restaurant,        // 음식점
  touristAttraction, // 관광지
  festivalEvent,     // 이벤트
  accommodation,     // 숙박
  nature,
  shopping,          // 쇼핑
  culturalFacility,  // 문화
  leisureSports,     // 레포츠
}

extension LargeCategoryExtension on LargeCategory {
  String get label {
    switch (this) {
      case LargeCategory.all:
        return '전체';
      case LargeCategory.restaurant:
        return '음식점';
      case LargeCategory.touristAttraction:
        return '관광지';
      case LargeCategory.festivalEvent:
        return '이벤트';
      case LargeCategory.accommodation:
        return '숙박';
      case LargeCategory.nature:
        return '자연';
      case LargeCategory.shopping:
        return '쇼핑';
      case LargeCategory.culturalFacility:
        return '문화';
      case LargeCategory.leisureSports:
        return '레포츠';
    }
  }

  String get iconPath {
    switch (this) {
      case LargeCategory.all:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.restaurant:
        return IconPath.largeCategoryImage('restaurant');
      case LargeCategory.touristAttraction:
        return IconPath.largeCategoryImage('attractions');
      case LargeCategory.festivalEvent:
        return IconPath.largeCategoryImage('events');
      case LargeCategory.accommodation:
        return IconPath.largeCategoryImage('accommodation');
      case LargeCategory.nature:
        return IconPath.largeCategoryImage('nature');
      case LargeCategory.shopping:
        return IconPath.largeCategoryImage('shopping');
      case LargeCategory.culturalFacility:
        return IconPath.largeCategoryImage('culture');
      case LargeCategory.leisureSports:
        return IconPath.largeCategoryImage('sports');
    }
  }

  double get iconWidth {
    switch (this) {
      case LargeCategory.all:
        return 23.r;
      case LargeCategory.restaurant:
        return 31.r;
      case LargeCategory.touristAttraction:
        return 30.r;
      case LargeCategory.festivalEvent:
        return 29.r;
      case LargeCategory.accommodation:
        return 26.r;
      case LargeCategory.nature:
        return 40.r;
      case LargeCategory.shopping:
        return 34.r;
      case LargeCategory.culturalFacility:
        return 30.r;
      case LargeCategory.leisureSports:
        return 26.r;
    }
  }
}