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
      case TravelType.ACTIVITY:
        return '모험 액티비티형';
      case TravelType.MOOD:
        return '감성 공간형';
      case TravelType.FOOD:
        return '미식 탐험형';
      case TravelType.FOREST:
        return '자연 휴식형';
      case TravelType.CULTURE:
        return '문화 몰입형';
      case TravelType.SOCIAL:
        return '사교 교류형';
    }
  }

  String get nickname {
    switch (this) {
      case TravelType.ACTIVITY:
        return '익스트림 챌린저';
      case TravelType.MOOD:
        return '무드 스포터';
      case TravelType.FOOD:
        return '푸드 노마드';
      case TravelType.FOREST:
        return '포레스트 힐러';
      case TravelType.CULTURE:
        return '컬처 시커';
      case TravelType.SOCIAL:
        return '소셜 트래블러';
    }
  }

  String get profile {
    switch (this) {
      case TravelType.ACTIVITY:
        return ImagePath.typeProfile('activity');
      case TravelType.MOOD:
        return ImagePath.typeProfile('mood');
      case TravelType.FOOD:
        return ImagePath.typeProfile('food');
      case TravelType.FOREST:
        return ImagePath.typeProfile('forest');
      case TravelType.CULTURE:
        return ImagePath.typeProfile('culture');
      case TravelType.SOCIAL:
        return ImagePath.typeProfile('social');
    }
  }

  String get image {
    switch (this) {
      case TravelType.ACTIVITY:
        return ImagePath.typeImage('activity');
      case TravelType.MOOD:
        return ImagePath.typeImage('mood');
      case TravelType.FOOD:
        return ImagePath.typeImage('food');
      case TravelType.FOREST:
        return ImagePath.typeImage('forest');
      case TravelType.CULTURE:
        return ImagePath.typeImage('culture');
      case TravelType.SOCIAL:
        return ImagePath.typeImage('social');
    }
  }

  String get shortDescription {
    switch (this) {
      case TravelType.ACTIVITY:
        return '"가만히 있는 건 지루해! 새로운 경험과 아드레날린을 찾아 떠나는 당신"';
      case TravelType.MOOD:
        return '"여행지에서도 꼭 분위기 좋은 카페와 예쁜 공간을 찾아다니는 감각적인 당신"';
      case TravelType.FOOD:
        return '"맛있는 게 곧 행복! 한 도시의 진짜 얼굴은 음식에 있다"';
      case TravelType.FOREST:
        return '"자연 속에서 조용히 쉬며, 마음을 내려놓고 풍경을 사진으로 담는 여행자"';
      case TravelType.CULTURE:
        return '"여행은 배우는 시간! 예술, 역사, 로컬 이야기에 몰입하는 타입"';
      case TravelType.SOCIAL:
        return '"새로운 사람과의 만남이 여행의 재미! 혼자 떠나도 절대 안 외로워"';
    }
  }

  List<String> get tags {
    switch (this) {
      case TravelType.ACTIVITY:
        return ['액티비티', '도전', '즉흥', '움직임'];
      case TravelType.MOOD:
        return ['카페', '무드', '감성공간', '인테리어'];
      case TravelType.FOOD:
        return ['미식', '로컬음식', '맛집'];
      case TravelType.FOREST:
        return ['힐링', '숲', '바다', '풍경 사진'];
      case TravelType.CULTURE:
        return ['예술', '역사', '전통', '로컬'];
      case TravelType.SOCIAL:
        return ['파티', '펍', '소통', '게스트하우스'];
    }
  }

  String get detailedDescription {
    switch (this) {
      case TravelType.ACTIVITY:
        return '당신에게 여행은 단순한 휴식이 아니라 새로운 기록을 세우는 모험입니다. 바다에서는 서핑 보드를 타고, 산에서는 하이킹과 암벽등반에 도전하며, 예기치 못한 순간을 즐깁니다. 계획보다는 즉흥적인 선택에서 더 큰 즐거움을 느끼고, 아찔한 순간이 오히려 여행의 하이라이트가 됩니다. 몸이 움직일 때 비로소 진짜 여행이 시작된다고 믿는 액티비티형 여행자입니다.';
      case TravelType.MOOD:
        return '여행지에서도 당신의 눈은 늘 감각적인 장소를 향합니다. 분위기 좋은 카페, 독특한 인테리어, 햇살이 예쁘게 들어오는 창가 자리까지, 당신은 공간이 주는 무드를 소중하게 느끼는 사람입니다. 사진을 찍을 때도 단순한 기록이 아니라, 그 순간의 공기와 색감을 담아내려 노력합니다. 여행은 단순한 이동이 아니라, 아름다운 장면을 수집하는 과정입니다.';
      case TravelType.FOOD:
        return '여행의 시작은 지도보다 맛집 검색에서 시작됩니다. 그 지역의 유명한 음식부터 숨겨진 로컬 맛집까지, 미리 리스트를 작성해두고 하나하나 정복해 나갑니다. 음식은 그 도시의 문화와 삶을 가장 잘 보여준다고 믿으며, 새로운 맛을 발견할 때마다 여행의 행복이 배가됩니다. 당신에게 여행의 가장 큰 기념품은 그곳에서 먹었던 잊지 못할 한 끼입니다.';
      case TravelType.FOREST:
        return '당신에게 여행은 바쁜 일상에서 벗어나 마음을 비우는 시간입니다. 숲속의 맑은 공기, 파도 소리가 들리는 바다, 햇살이 부드럽게 스미는 리조트… 이런 곳에서 조용히 시간을 보내는 것이 최고의 호사입니다. 사진 속에는 사람보다 풍경이 더 많이 담기고, 여행의 가장 큰 목적은 "쉼"입니다. 자연 속에서 재충전하며 진짜 나를 찾는 여행자입니다.';
      case TravelType.CULTURE:
        return '당신은 여행지를 단순히 "구경"하는 것이 아니라 깊이 "이해"하려 합니다. 박물관과 전시회, 역사적인 건물, 지역의 전통 행사까지, 발길이 닿는 곳마다 그 속에 담긴 이야기를 찾아내는 탐험가입니다. 사진보다 기억 속에 각인되는 건 그곳의 역사와 문화이며, 관광보다 그 지역 사람들의 삶을 느끼는 것을 더 중요하게 생각합니다.';
      case TravelType.SOCIAL:
        return '당신에게 여행은 새로운 사람을 만나는 최고의 기회입니다. 혼자 떠나더라도 현지에서 금세 친구를 사귀고, 밤이 되면 펍이나 파티에서 즐겁게 어울립니다. 여행지에서 만난 사람들과 나눈 대화와 웃음이야말로 가장 오래 남는 추억입니다. 외향적이고 개방적인 당신의 여행은 언제나 즐거운 만남으로 가득합니다.';
    }
  }
}
