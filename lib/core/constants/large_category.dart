import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

enum LargeCategory {
  all,
  touristAttraction, // 관광지
  culturalFacility,  // 문화시설
  festivalEvent,     // 축제공연행사
  leisureSports,     // 레포츠
  accommodation,     // 숙박
  shopping,          // 쇼핑
  restaurant,        // 음식점
}

extension LargeCategoryExtension on LargeCategory {
  String get label {
    switch (this) {
      case LargeCategory.all:
        return '전체';
      case LargeCategory.touristAttraction:
        return '관광지';
      case LargeCategory.culturalFacility:
        return '문화시설';
      case LargeCategory.festivalEvent:
        return '축제공연행사';
      case LargeCategory.leisureSports:
        return '레포츠';
      case LargeCategory.accommodation:
        return '숙박';
      case LargeCategory.shopping:
        return '쇼핑';
      case LargeCategory.restaurant:
        return '음식점';
    }
  }

  String get iconPath {
    switch (this) {
      case LargeCategory.all:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.touristAttraction:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.culturalFacility:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.festivalEvent:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.leisureSports:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.accommodation:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.shopping:
        return IconPath.largeCategoryImage('default');
      case LargeCategory.restaurant:
        return IconPath.largeCategoryImage('default');
    }
  }

  double get iconWidth {
    switch (this) {
      case LargeCategory.all:
        return 23.r;
      case LargeCategory.touristAttraction:
        return 23.r;
      case LargeCategory.culturalFacility:
        return 23.r;
      case LargeCategory.festivalEvent:
        return 23.r;
      case LargeCategory.leisureSports:
        return 23.r;
      case LargeCategory.accommodation:
        return 23.r;
      case LargeCategory.shopping:
        return 23.r;
      case LargeCategory.restaurant:
        return 23.r;
    }
  }
}