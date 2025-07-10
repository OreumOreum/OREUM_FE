import 'package:oreum_fe/core/constants/icon_path.dart';

enum TravelType {
  activity,
  mood,
  food,
  nature,
  culture,
  social,
}

extension TravelTypeInfo on TravelType {
  String get type {
    switch (this) {
      case TravelType.activity: return '모험 액티비티형';
      case TravelType.mood: return '감성 공간형';
      case TravelType.food: return '미식 탐험형';
      case TravelType.nature: return '자연 휴식형';
      case TravelType.culture: return '문화 몰입형';
      case TravelType.social: return '사교 교류형';
    }
  }

  String get nickname {
    switch (this) {
      case TravelType.activity: return '익스트림 챌린저';
      case TravelType.mood: return '무드 스포터';
      case TravelType.food: return '푸드 노마드';
      case TravelType.nature: return '포레스트 힐러';
      case TravelType.culture: return '컬처 시커';
      case TravelType.social: return '소셜 트래블러';
    }
  }

  String get image {
    switch (this) {
      case TravelType.activity: return IconPath.typeImage('default');
      case TravelType.mood: return IconPath.typeImage('default');
      case TravelType.food: return IconPath.typeImage('default');
      case TravelType.nature: return IconPath.typeImage('default');
      case TravelType.culture: return IconPath.typeImage('default');
      case TravelType.social: return IconPath.typeImage('default');
    }
  }

  String get shortDescription {
    switch (this) {
      case TravelType.activity: return '"모험 액티비티형의 짧은 설명"';
      case TravelType.mood: return '"감성 공간형의 짧은 설명"';
      case TravelType.food: return '"미식 탐험형의 짦은 설명"';
      case TravelType.nature: return '"자연 휴식형의 짧은 설명"';
      case TravelType.culture: return '"문화 몰입형의 짧은 설명"';
      case TravelType.social: return '"사교 교류형의 짧은 설명"';
    }
  }

  List<String> get tags {
    switch (this) {
      case TravelType.activity: return ['태그', '태그', '태그', '태그'];
      case TravelType.mood: return ['태그', '태그', '태그', '태그'];
      case TravelType.food: return ['태그', '태그', '태그', '태그'];
      case TravelType.nature: return ['태그', '태그', '태그', '태그'];
      case TravelType.culture: return ['태그', '태그', '태그', '태그'];
      case TravelType.social: return ['태그', '태그', '태그', '태그'];
    }
  }

  String get detailedDescription {
    switch (this) {
      case TravelType.activity:
        return '모험 액티비티형의 긴 설명';
      case TravelType.mood:
        return '감성 공간형의 긴 설명';
      case TravelType.food:
        return '미식 탐험형의 긴 설명';
      case TravelType.nature:
        return '자연 휴식형의 긴 설명';
      case TravelType.culture:
        return '문화 몰입형의 긴 설명';
      case TravelType.social:
        return '사교 교류형의 긴 설명';
    }
  }
}