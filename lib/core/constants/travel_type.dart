import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/image_path.dart';

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

  String get profile {
    switch (this) {
      case TravelType.ACTIVITY: return ImagePath.typeProfile('activity');
      case TravelType.MOOD: return ImagePath.typeProfile('mood');
      case TravelType.FOOD: return ImagePath.typeProfile('food');
      case TravelType.FOREST: return ImagePath.typeProfile('forest');
      case TravelType.CULTURE: return ImagePath.typeProfile('culture');
      case TravelType.SOCIAL: return ImagePath.typeProfile('social');
    }
  }

  String get image {
    switch (this) {
      case TravelType.ACTIVITY: return ImagePath.typeImage('activity');
      case TravelType.MOOD: return ImagePath.typeImage('mood');
      case TravelType.FOOD: return ImagePath.typeImage('food');
      case TravelType.FOREST: return ImagePath.typeImage('forest');
      case TravelType.CULTURE: return ImagePath.typeImage('culture');
      case TravelType.SOCIAL: return ImagePath.typeImage('social');
    }
  }

  String get shortDescription {
    switch (this) {
      case TravelType.ACTIVITY: return '"가만히 있는 건 지루해! 새로운 경험과 아드레날린을 찾아 떠나는 당신"';
      case TravelType.MOOD: return '"여행지에서도 꼭 분위기 좋은 카페와 예쁜 공간을 찾아다니는 감각적인 당신"';
      case TravelType.FOOD: return '"맛있는 게 곧 행복! 한 도시의 진짜 얼굴은 음식에 있다"';
      case TravelType.FOREST: return '"자연 속에서 조용히 쉬며, 마음을 내려놓고 풍경을 사진으로 담는 여행자"';
      case TravelType.CULTURE: return '"여행은 배우는 시간! 예술, 역사, 로컬 이야기에 몰입하는 타입"';
      case TravelType.SOCIAL: return '"새로운 사람과의 만남이 여행의 재미! 혼자 떠나도 절대 안 외로워"';
    }
  }

  List<String> get tags {
    switch (this) {
      case TravelType.ACTIVITY: return ['액티비티', '도전', '즉흥', '움직임'];
      case TravelType.MOOD: return ['카페', '무드', '감성공간', '인테리어'];
      case TravelType.FOOD: return ['미식', '로컬음식', '맛집'];
      case TravelType.FOREST: return ['힐링', '숲', '바다', '풍경 사진'];
      case TravelType.CULTURE: return ['예술', '역사', '전통', '로컬'];
      case TravelType.SOCIAL: return ['파티', '펍', '소통', '게스트하우스'];
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