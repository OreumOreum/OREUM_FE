import 'package:collection/collection.dart';

enum ContentTypeId {
  attraction('12'),
  culture('14'),
  event('15'),
  reports('28'),
  restaurant('39'),
  shopping('38'),
  stay('32');

  final String contentTypeId;
  const ContentTypeId(this.contentTypeId);

  static ContentTypeId? fromContentTypeId(String contentTypeId) {
    return ContentTypeId.values.firstWhereOrNull(
          (e) => e.contentTypeId == contentTypeId,
    );
  }
}

extension ContentTypeIdExtension on ContentTypeId {
  String get label {
    switch (this) {
      case ContentTypeId.attraction:
        return '관광지';
      case ContentTypeId.culture:
        return '문화시설';
      case ContentTypeId.event:
        return '축제공연행사';
      case ContentTypeId.reports:
        return '레포츠';
      case ContentTypeId.restaurant:
        return '음식점';
      case ContentTypeId.shopping:
        return '쇼핑';
      case ContentTypeId.stay:
        return '숙박';
    }
  }

  String get description {
    switch (this) {
      case ContentTypeId.attraction:
        return '자연경관, 명소, 테마파크 등';
      case ContentTypeId.culture:
        return '박물관, 미술관, 전시관 등';
      case ContentTypeId.event:
        return '축제, 공연, 행사 등';
      case ContentTypeId.reports:
        return '체험활동, 스포츠, 레저 등';
      case ContentTypeId.restaurant:
        return '맛집, 카페, 전통음식 등';
      case ContentTypeId.shopping:
        return '쇼핑몰, 시장, 면세점 등';
      case ContentTypeId.stay:
        return '호텔, 펜션, 리조트 등';
    }
  }

  String get shortLabel {
    switch (this) {
      case ContentTypeId.attraction:
        return '관광';
      case ContentTypeId.culture:
        return '문화';
      case ContentTypeId.event:
        return '축제';
      case ContentTypeId.reports:
        return '레포츠';
      case ContentTypeId.restaurant:
        return '음식';
      case ContentTypeId.shopping:
        return '쇼핑';
      case ContentTypeId.stay:
        return '숙박';
    }
  }
}