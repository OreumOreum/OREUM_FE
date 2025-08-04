import 'package:oreum_fe/core/constants/icon_path.dart';

enum TravelType {
  ACTIVITY,
  MOOD,
  FOOD,
  FOREST,
  CULTURE,
  SOCIAL,
}

extension TravelTypeInfo on TravelType {
  String get type {
    switch (this) {
      case TravelType.ACTIVITY: return '모험 액티비티형';
      case TravelType.MOOD: return '감성 공간형';
      case TravelType.FOOD: return '미식 탐험형';
      case TravelType.FOREST: return '자연 휴식형';
      case TravelType.CULTURE: return '문화 몰입형';
      case TravelType.SOCIAL: return '사교 교류형';
    }
  }

  String get nickname {
    switch (this) {
      case TravelType.ACTIVITY: return '익스트림 챌린저';
      case TravelType.MOOD: return '무드 스포터';
      case TravelType.FOOD: return '푸드 노마드';
      case TravelType.FOREST: return '포레스트 힐러';
      case TravelType.CULTURE: return '컬처 시커';
      case TravelType.SOCIAL: return '소셜 트래블러';
    }
  }

  String get image {
    switch (this) {
      case TravelType.ACTIVITY: return IconPath.typeImage('default');
      case TravelType.MOOD: return IconPath.typeImage('default');
      case TravelType.FOOD: return IconPath.typeImage('default');
      case TravelType.FOREST: return IconPath.typeImage('default');
      case TravelType.CULTURE: return IconPath.typeImage('default');
      case TravelType.SOCIAL: return IconPath.typeImage('default');
    }
  }

  String get shortDescription {
    switch (this) {
      case TravelType.ACTIVITY: return '"모험 액티비티형의 짧은 설명"';
      case TravelType.MOOD: return '"감성 공간형의 짧은 설명"';
      case TravelType.FOOD: return '"미식 탐험형의 짦은 설명"';
      case TravelType.FOREST: return '"자연 휴식형의 짧은 설명"';
      case TravelType.CULTURE: return '"문화 몰입형의 짧은 설명"';
      case TravelType.SOCIAL: return '"사교 교류형의 짧은 설명"';
    }
  }

  List<String> get tags {
    switch (this) {
      case TravelType.ACTIVITY: return ['태그', '태그', '태그', '태그'];
      case TravelType.MOOD: return ['태그', '태그', '태그', '태그'];
      case TravelType.FOOD: return ['태그', '태그', '태그', '태그'];
      case TravelType.FOREST: return ['태그', '태그', '태그', '태그'];
      case TravelType.CULTURE: return ['태그', '태그', '태그', '태그'];
      case TravelType.SOCIAL: return ['태그', '태그', '태그', '태그'];
    }
  }

  String get detailedDescription {
    switch (this) {
      case TravelType.ACTIVITY:
        return '모험 액티비티형의 긴 설명';
      case TravelType.MOOD:
        return '감성 공간형의 긴 설명';
      case TravelType.FOOD:
        return '미식 탐험형의 긴 설명';
      case TravelType.FOREST:
        return '자연 휴식형의 긴 설명';
      case TravelType.CULTURE:
        return '문화 몰입형의 긴 설명';
      case TravelType.SOCIAL:
        return '사교 교류형의 긴 설명';
    }
  }
}