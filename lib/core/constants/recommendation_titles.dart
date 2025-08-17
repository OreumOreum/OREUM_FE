import 'package:oreum_fe/core/constants/travel_type.dart';

import 'large_category.dart';

final Map<LargeCategory, Map<TravelType, String>> recommendationTitles = {
  // --- 음식점 ---
  LargeCategory.restaurant: {
    TravelType.ACTIVITY: '줄 서서 먹는 현지인 맛집',
    TravelType.MOOD: '맛보다 분위기, 감성 식당',
    TravelType.FOOD: '인생 최고의 한 끼 도전',
    TravelType.FOREST: '자연 속에서 즐기는 식사',
    TravelType.CULTURE: '제주 전통의 맛을 찾아서',
    TravelType.SOCIAL: '왁자지껄, 함께 먹는 즐거움',
  },
  // --- 관광지 ---
  LargeCategory.touristAttraction: {
    TravelType.ACTIVITY: '도전! 제주의 숨은 명소',
    TravelType.MOOD: '찍으면 바로 인생샷 스팟',
    TravelType.FOOD: '풍경과 함께 맛보는 즐거움',
    TravelType.FOREST: '가만히, 풍경 속으로',
    TravelType.CULTURE: '제주의 옛 이야기를 걷다',
    TravelType.SOCIAL: '여행자들의 만남의 장소',
  },
  // --- 이벤트 ---
  LargeCategory.festivalEvent: {
    TravelType.ACTIVITY: '온몸으로 즐기는 페스티벌',
    TravelType.MOOD: '밤을 채우는 감성 이벤트',
    TravelType.FOOD: '제주 미식 대탐험 축제',
    TravelType.FOREST: '자연과 함께하는 힐링 축제',
    TravelType.CULTURE: '전통을 체험하는 특별한 날',
    TravelType.SOCIAL: '오늘 밤, 우리 모두 친구',
  },
  // --- 숙박 ---
  LargeCategory.accommodation: {
    TravelType.ACTIVITY: '짜릿한 경험, 이색 숙소',
    TravelType.MOOD: '머무는 것 자체가 여행',
    TravelType.FOOD: '조식부터 특별한 미식 숙소',
    TravelType.FOREST: '완벽한 쉼을 위한 공간',
    TravelType.CULTURE: '제주 감성 가득, 이색 숙소',
    TravelType.SOCIAL: '매일 밤 즐거운 파티',
  },
  // --- 쇼핑 ---
  LargeCategory.shopping: {
    TravelType.ACTIVITY: '희귀템 찾는 보물찾기',
    TravelType.MOOD: '나만의 제주 기념품 찾기',
    TravelType.FOOD: '제주를 통째로 담아가기',
    TravelType.FOREST: '자연을 닮은 제주 기념품',
    TravelType.CULTURE: '제주 전통의 멋, 쇼핑하기',
    TravelType.SOCIAL: '현지인과 만나는 쇼핑 길',
  },
  // --- 문화 ---
  LargeCategory.culturalFacility: {
    TravelType.ACTIVITY: '온몸으로 체험하는 제주 문화',
    TravelType.MOOD: '예술과 감성이 있는 공간',
    TravelType.FOOD: '입으로 즐기는 제주 역사',
    TravelType.FOREST: '자연 속 예술 작품 감상',
    TravelType.CULTURE: '제주의 진짜 모습 엿보기',
    TravelType.SOCIAL: '함께 즐겨 더 좋은 문화 체험',
  },
  // --- 레포츠 ---
  LargeCategory.leisureSports: {
    TravelType.ACTIVITY: '하늘과 바다를 가르다',
    TravelType.MOOD: '풍경과 함께 즐기는 레포츠',
    TravelType.FOOD: '땀 흘린 뒤, 맛보는 즐거움',
    TravelType.FOREST: '가볍게 즐기는 힐링 레포츠',
    TravelType.CULTURE: '제주 전통 방식의 레포츠',
    TravelType.SOCIAL: '새로운 친구와 함께, 액티비티!',
  },
};