import '../../features/tour/data/models/tour_response.dart';

enum TourField {
  // 일반 정보
  contentid,
  contenttypeid,
  taketime,
  theme,
  heritage1,
  heritage2,
  heritage3,

  // 공통 정보
  accomcount,
  chkbabycarriage,
  chkcreditcard,
  chkpet,
  expagerange,
  expguide,
  infocenter,
  opendate,
  parking,
  restdate,

  // 문화시설
  accomcountculture,
  chkbabycarriageculture,
  chkcreditcardculture,
  chkpetculture,
  discountinfo,
  infocenterculture,
  parkingculture,
  parkingfee,
  restdateculture,
  usefee,
  usetimeculture,
  scale,
  spendtime,

  // 축제/공연/행사
  agelimit,
  bookingplace,
  discountinfofestival,
  eventenddate,
  eventhomepage,
  eventplace,
  eventstartdate,
  festivalgrade,
  playtime,
  program,
  spendtimefestival,
  sponsor1,
  sponsor1tel,
  sponsor2,
  sponsor2tel,
  subevent,
  usetimefestival,

  // 레포츠
  accomcountleports,
  chkbabycarriageleports,
  chkcreditcardleports,
  chkpetleports,
  expagerangeleports,
  infocenterleports,
  openperiod,
  parkingleports,
  parkingfeeleports,
  reservation,
  restdateleports,
  scaleleports,
  usefeeleports,
  useseason,
  usetime,
  usetimeleports,

  // 숙박
  accomcountlodging,
  barbecue,
  beauty,
  beverage,
  bicycle,
  campfire,
  checkintime,
  checkouttime,
  chkcooking,
  fitness,
  foodplace,
  infocenterlodging,
  parkinglodging,
  pickup,
  publicbath,
  publicpc,
  refundregulation,
  reservationlodging,
  reservationurl,
  roomcount,
  roomtype,
  sauna,
  scalelodging,
  seminar,
  sports,
  subfacility,

  // 쇼핑
  chkbabycarriageshopping,
  chkcreditcardshopping,
  chkpetshopping,
  culturecenter,
  fairday,
  infocentershopping,
  opendateshopping,
  opentime,
  parkingshopping,
  restdateshopping,
  restroom,
  saleitem,
  saleitemcost,
  scaleshopping,
  shopguide,

  // 음식점
  chkcreditcardfood,
  discountinfofood,
  firstmenu,
  infocenterfood,
  kidsfacility,
  lcnsno,
  opendatefood,
  opentimefood,
  packing,
  parkingfood,
  reservationfood,
  restdatefood,
  scalefood,
  seat,
  smoking,
  treatmenu,

  // 여행코스
  distance,
  infocentertourcourse,
  schedule,

  // 기타
  karaoke,
  placeinfo,
}

extension TourFieldInfo on TourField {
  String get fieldName {
    switch (this) {
      case TourField.contentid: return 'contentid';
      case TourField.contenttypeid: return 'contenttypeid';
      case TourField.taketime: return 'taketime';
      case TourField.theme: return 'theme';
      case TourField.heritage1: return 'heritage1';
      case TourField.heritage2: return 'heritage2';
      case TourField.heritage3: return 'heritage3';
      case TourField.accomcount: return 'accomcount';
      case TourField.chkbabycarriage: return 'chkbabycarriage';
      case TourField.chkcreditcard: return 'chkcreditcard';
      case TourField.chkpet: return 'chkpet';
      case TourField.expagerange: return 'expagerange';
      case TourField.expguide: return 'expguide';
      case TourField.infocenter: return 'infocenter';
      case TourField.opendate: return 'opendate';
      case TourField.parking: return 'parking';
      case TourField.restdate: return 'restdate';
      case TourField.accomcountculture: return 'accomcountculture';
      case TourField.chkbabycarriageculture: return 'chkbabycarriageculture';
      case TourField.chkcreditcardculture: return 'chkcreditcardculture';
      case TourField.chkpetculture: return 'chkpetculture';
      case TourField.discountinfo: return 'discountinfo';
      case TourField.infocenterculture: return 'infocenterculture';
      case TourField.parkingculture: return 'parkingculture';
      case TourField.parkingfee: return 'parkingfee';
      case TourField.restdateculture: return 'restdateculture';
      case TourField.usefee: return 'usefee';
      case TourField.usetimeculture: return 'usetimeculture';
      case TourField.scale: return 'scale';
      case TourField.spendtime: return 'spendtime';
      case TourField.agelimit: return 'agelimit';
      case TourField.bookingplace: return 'bookingplace';
      case TourField.discountinfofestival: return 'discountinfofestival';
      case TourField.eventenddate: return 'eventenddate';
      case TourField.eventhomepage: return 'eventhomepage';
      case TourField.eventplace: return 'eventplace';
      case TourField.eventstartdate: return 'eventstartdate';
      case TourField.festivalgrade: return 'festivalgrade';
      case TourField.playtime: return 'playtime';
      case TourField.program: return 'program';
      case TourField.spendtimefestival: return 'spendtimefestival';
      case TourField.sponsor1: return 'sponsor1';
      case TourField.sponsor1tel: return 'sponsor1tel';
      case TourField.sponsor2: return 'sponsor2';
      case TourField.sponsor2tel: return 'sponsor2tel';
      case TourField.subevent: return 'subevent';
      case TourField.usetimefestival: return 'usetimefestival';
      case TourField.accomcountleports: return 'accomcountleports';
      case TourField.chkbabycarriageleports: return 'chkbabycarriageleports';
      case TourField.chkcreditcardleports: return 'chkcreditcardleports';
      case TourField.chkpetleports: return 'chkpetleports';
      case TourField.expagerangeleports: return 'expagerangeleports';
      case TourField.infocenterleports: return 'infocenterleports';
      case TourField.openperiod: return 'openperiod';
      case TourField.parkingleports: return 'parkingleports';
      case TourField.parkingfeeleports: return 'parkingfeeleports';
      case TourField.reservation: return 'reservation';
      case TourField.restdateleports: return 'restdateleports';
      case TourField.scaleleports: return 'scaleleports';
      case TourField.usefeeleports: return 'usefeeleports';
      case TourField.useseason: return 'useseason';
      case TourField.usetime: return 'usetime';
      case TourField.usetimeleports: return 'usetimeleports';
      case TourField.accomcountlodging: return 'accomcountlodging';
      case TourField.barbecue: return 'barbecue';
      case TourField.beauty: return 'beauty';
      case TourField.beverage: return 'beverage';
      case TourField.bicycle: return 'bicycle';
      case TourField.campfire: return 'campfire';
      case TourField.checkintime: return 'checkintime';
      case TourField.checkouttime: return 'checkouttime';
      case TourField.chkcooking: return 'chkcooking';
      case TourField.fitness: return 'fitness';
      case TourField.foodplace: return 'foodplace';
      case TourField.infocenterlodging: return 'infocenterlodging';
      case TourField.parkinglodging: return 'parkinglodging';
      case TourField.pickup: return 'pickup';
      case TourField.publicbath: return 'publicbath';
      case TourField.publicpc: return 'publicpc';
      case TourField.refundregulation: return 'refundregulation';
      case TourField.reservationlodging: return 'reservationlodging';
      case TourField.reservationurl: return 'reservationurl';
      case TourField.roomcount: return 'roomcount';
      case TourField.roomtype: return 'roomtype';
      case TourField.sauna: return 'sauna';
      case TourField.scalelodging: return 'scalelodging';
      case TourField.seminar: return 'seminar';
      case TourField.sports: return 'sports';
      case TourField.subfacility: return 'subfacility';
      case TourField.chkbabycarriageshopping: return 'chkbabycarriageshopping';
      case TourField.chkcreditcardshopping: return 'chkcreditcardshopping';
      case TourField.chkpetshopping: return 'chkpetshopping';
      case TourField.culturecenter: return 'culturecenter';
      case TourField.fairday: return 'fairday';
      case TourField.infocentershopping: return 'infocentershopping';
      case TourField.opendateshopping: return 'opendateshopping';
      case TourField.opentime: return 'opentime';
      case TourField.parkingshopping: return 'parkingshopping';
      case TourField.restdateshopping: return 'restdateshopping';
      case TourField.restroom: return 'restroom';
      case TourField.saleitem: return 'saleitem';
      case TourField.saleitemcost: return 'saleitemcost';
      case TourField.scaleshopping: return 'scaleshopping';
      case TourField.shopguide: return 'shopguide';
      case TourField.chkcreditcardfood: return 'chkcreditcardfood';
      case TourField.discountinfofood: return 'discountinfofood';
      case TourField.firstmenu: return 'firstmenu';
      case TourField.infocenterfood: return 'infocenterfood';
      case TourField.kidsfacility: return 'kidsfacility';
      case TourField.lcnsno: return 'lcnsno';
      case TourField.opendatefood: return 'opendatefood';
      case TourField.opentimefood: return 'opentimefood';
      case TourField.packing: return 'packing';
      case TourField.parkingfood: return 'parkingfood';
      case TourField.reservationfood: return 'reservationfood';
      case TourField.restdatefood: return 'restdatefood';
      case TourField.scalefood: return 'scalefood';
      case TourField.seat: return 'seat';
      case TourField.smoking: return 'smoking';
      case TourField.treatmenu: return 'treatmenu';
      case TourField.distance: return 'distance';
      case TourField.infocentertourcourse: return 'infocentertourcourse';
      case TourField.schedule: return 'schedule';
      case TourField.karaoke: return 'karaoke';
      case TourField.placeinfo: return 'placeinfo';
    }
  }

  String get displayName {
    switch (this) {
      case TourField.contentid: return '콘텐츠 ID';
      case TourField.contenttypeid: return '콘텐츠 타입 ID';
      case TourField.taketime: return '소요시간';
      case TourField.theme: return '테마';
      case TourField.heritage1: return '세계문화유산1';
      case TourField.heritage2: return '세계문화유산2';
      case TourField.heritage3: return '세계문화유산3';
      case TourField.accomcount: return '수용인원';
      case TourField.chkbabycarriage: return '유모차대여';
      case TourField.chkcreditcard: return '카드가능';
      case TourField.chkpet: return '애완동물 동반';
      case TourField.expagerange: return '가능연령';
      case TourField.expguide: return '체험안내';
      case TourField.infocenter: return '안내';
      case TourField.opendate: return '개장일';
      case TourField.parking: return '주차시설';
      case TourField.restdate: return '쉬는날';
      case TourField.accomcountculture: return '수용인원';
      case TourField.chkbabycarriageculture: return '유모차대여';
      case TourField.chkcreditcardculture: return '신용카드 가능';
      case TourField.chkpetculture: return '애완동물 동반';
      case TourField.discountinfo: return '할인정보';
      case TourField.infocenterculture: return '안내';
      case TourField.parkingculture: return '주차시설';
      case TourField.parkingfee: return '주차요금';
      case TourField.restdateculture: return '쉬는날';
      case TourField.usefee: return '이용요금';
      case TourField.usetimeculture: return '이용시간';
      case TourField.scale: return '규모';
      case TourField.spendtime: return '관람시간';
      case TourField.agelimit: return '관람연령';
      case TourField.bookingplace: return '예매처';
      case TourField.discountinfofestival: return '할인정보';
      case TourField.eventenddate: return '행사종료일';
      case TourField.eventhomepage: return '홈페이지';
      case TourField.eventplace: return '행사장소';
      case TourField.eventstartdate: return '행사시작일';
      case TourField.festivalgrade: return '축제등급';
      case TourField.playtime: return '공연시간';
      case TourField.program: return '프로그램';
      case TourField.spendtimefestival: return '공연시간';
      case TourField.sponsor1: return '주최자';
      case TourField.sponsor1tel: return '주최자연락처';
      case TourField.sponsor2: return '주관사';
      case TourField.sponsor2tel: return '주관사연락처';
      case TourField.subevent: return '부대행사';
      case TourField.usetimefestival: return '이용요금';
      case TourField.accomcountleports: return '수용인원';
      case TourField.chkbabycarriageleports: return '유모차대여';
      case TourField.chkcreditcardleports: return '카드가능';
      case TourField.chkpetleports: return '애완동물 동반';
      case TourField.expagerangeleports: return '가능연령';
      case TourField.infocenterleports: return '안내';
      case TourField.openperiod: return '개장기간';
      case TourField.parkingleports: return '주차시설';
      case TourField.parkingfeeleports: return '주차요금';
      case TourField.reservation: return '예약안내';
      case TourField.restdateleports: return '쉬는날';
      case TourField.scaleleports: return '규모';
      case TourField.usefeeleports: return '이용요금';
      case TourField.useseason: return '이용시기';
      case TourField.usetime: return '이용시간';
      case TourField.usetimeleports: return '이용시간';
      case TourField.accomcountlodging: return '수용인원';
      case TourField.barbecue: return '바비큐장';
      case TourField.beauty: return '뷰티시설';
      case TourField.beverage: return '식음료장';
      case TourField.bicycle: return '자전거대여';
      case TourField.campfire: return '캠프파이어';
      case TourField.checkintime: return '입실시간';
      case TourField.checkouttime: return '퇴실시간';
      case TourField.chkcooking: return '객실내취사';
      case TourField.fitness: return '헬스장여부';
      case TourField.foodplace: return '식음료장';
      case TourField.infocenterlodging: return '예약안내';
      case TourField.parkinglodging: return '주차시설';
      case TourField.pickup: return '픽업서비스';
      case TourField.publicbath: return '공용샤워실';
      case TourField.publicpc: return '공용PC';
      case TourField.refundregulation: return '환불규정';
      case TourField.reservationlodging: return '예약안내';
      case TourField.reservationurl: return '예약안내홈페이지';
      case TourField.roomcount: return '객실수';
      case TourField.roomtype: return '객실유형';
      case TourField.sauna: return '사우나실';
      case TourField.scalelodging: return '규모';
      case TourField.seminar: return '세미나실';
      case TourField.sports: return '스포츠시설';
      case TourField.subfacility: return '부대시설';
      case TourField.chkbabycarriageshopping: return '유모차대여';
      case TourField.chkcreditcardshopping: return '카드가능';
      case TourField.chkpetshopping: return '애완동물동반';
      case TourField.culturecenter: return '문화센터';
      case TourField.fairday: return '장서는날';
      case TourField.infocentershopping: return '안내';
      case TourField.opendateshopping: return '개장일';
      case TourField.opentime: return '영업시간';
      case TourField.parkingshopping: return '주차시설';
      case TourField.restdateshopping: return '쉬는날';
      case TourField.restroom: return '화장실';
      case TourField.saleitem: return '판매품목';
      case TourField.saleitemcost: return '판매품목별가격';
      case TourField.scaleshopping: return '규모';
      case TourField.shopguide: return '매장안내';
      case TourField.chkcreditcardfood: return '카드가능';
      case TourField.discountinfofood: return '할인정보';
      case TourField.firstmenu: return '대표메뉴';
      case TourField.infocenterfood: return '안내';
      case TourField.kidsfacility: return '아이놀이방';
      case TourField.lcnsno: return '인허가번호';
      case TourField.opendatefood: return '개업일';
      case TourField.opentimefood: return '영업시간';
      case TourField.packing: return '포장가능';
      case TourField.parkingfood: return '주차시설';
      case TourField.reservationfood: return '예약안내';
      case TourField.restdatefood: return '쉬는날';
      case TourField.scalefood: return '규모';
      case TourField.seat: return '좌석수';
      case TourField.smoking: return '금연/흡연';
      case TourField.treatmenu: return '취급메뉴';
      case TourField.distance: return '코스총거리';
      case TourField.infocentertourcourse: return '문의및안내';
      case TourField.schedule: return '코스일정';
      case TourField.karaoke: return '노래방';
      case TourField.placeinfo: return '장소';
    }
  }
}

/// TourResponse 확장 함수
extension TourResponseExtension on TourResponse {

  // 필드명으로 값 가져오기
  String? getFieldValue(String fieldName) {
    switch (fieldName) {
      case 'chkpetculture': return chkpetculture;
      case 'eventhomepage': return eventhomepage;
      case 'eventplace': return eventplace;
      case 'parkingleports': return parkingleports;
      case 'reservation': return reservation;
      case 'restdateleports': return restdateleports;
      case 'eventstartdate': return eventstartdate;
      case 'festivalgrade': return festivalgrade;
      case 'karaoke': return karaoke;
      case 'discountinfofood': return discountinfofood;
      case 'firstmenu': return firstmenu;
      case 'infocenterfood': return infocenterfood;
      case 'kidsfacility': return kidsfacility;
      case 'opendatefood': return opendatefood;
      case 'opentimefood': return opentimefood;
      case 'packing': return packing;
      case 'parkingfood': return parkingfood;
      case 'reservationfood': return reservationfood;
      case 'chkcreditcardculture': return chkcreditcardculture;
      case 'scaleleports': return scaleleports;
      case 'usefeeleports': return usefeeleports;
      case 'discountinfofestival': return discountinfofestival;
      case 'chkcreditcardfood': return chkcreditcardfood;
      case 'eventenddate': return eventenddate;
      case 'playtime': return playtime;
      case 'chkbabycarriageculture': return chkbabycarriageculture;
      case 'roomcount': return roomcount;
      case 'reservationlodging': return reservationlodging;
      case 'reservationurl': return reservationurl;
      case 'roomtype': return roomtype;
      case 'scalelodging': return scalelodging;
      case 'subfacility': return subfacility;
      case 'barbecue': return barbecue;
      case 'beauty': return beauty;
      case 'beverage': return beverage;
      case 'bicycle': return bicycle;
      case 'campfire': return campfire;
      case 'fitness': return fitness;
      case 'placeinfo': return placeinfo;
      case 'parkinglodging': return parkinglodging;
      case 'pickup': return pickup;
      case 'publicbath': return publicbath;
      case 'opendate': return opendate;
      case 'parking': return parking;
      case 'restdate': return restdate;
      case 'usetimeleports': return usetimeleports;
      case 'foodplace': return foodplace;
      case 'infocenterlodging': return infocenterlodging;
      case 'restdatefood': return restdatefood;
      case 'scalefood': return scalefood;
      case 'seat': return seat;
      case 'smoking': return smoking;
      case 'treatmenu': return treatmenu;
      case 'lcnsno': return lcnsno;
      case 'accomcount': return accomcount;
      case 'chkbabycarriage': return chkbabycarriage;
      case 'chkcreditcard': return chkcreditcard;
      case 'chkpet': return chkpet;
      case 'expagerange': return expagerange;
      case 'expguide': return expguide;
      case 'heritage1': return heritage1;
      case 'heritage2': return heritage2;
      case 'heritage3': return heritage3;
      case 'infocenter': return infocenter;
      case 'taketime': return taketime;
      case 'theme': return theme;
      case 'accomcountleports': return accomcountleports;
      case 'chkbabycarriageleports': return chkbabycarriageleports;
      case 'chkcreditcardleports': return chkcreditcardleports;
      case 'chkpetleports': return chkpetleports;
      case 'expagerangeleports': return expagerangeleports;
      case 'infocenterleports': return infocenterleports;
      case 'openperiod': return openperiod;
      case 'parkingfeeleports': return parkingfeeleports;
      case 'program': return program;
      case 'spendtimefestival': return spendtimefestival;
      case 'sponsor1': return sponsor1;
      case 'sponsor1tel': return sponsor1tel;
      case 'discountinfo': return discountinfo;
      case 'infocenterculture': return infocenterculture;
      case 'parkingculture': return parkingculture;
      case 'parkingfee': return parkingfee;
      case 'restdateculture': return restdateculture;
      case 'usefee': return usefee;
      case 'usetimeculture': return usetimeculture;
      case 'scale': return scale;
      case 'spendtime': return spendtime;
      case 'agelimit': return agelimit;
      case 'bookingplace': return bookingplace;
      case 'useseason': return useseason;
      case 'usetime': return usetime;
      case 'accomcountculture': return accomcountculture;
      case 'sponsor2': return sponsor2;
      case 'sponsor2tel': return sponsor2tel;
      case 'subevent': return subevent;
      case 'usetimefestival': return usetimefestival;
      case 'distance': return distance;
      case 'infocentertourcourse': return infocentertourcourse;
      case 'schedule': return schedule;
      case 'publicpc': return publicpc;
      case 'sauna': return sauna;
      case 'seminar': return seminar;
      case 'sports': return sports;
      case 'refundregulation': return refundregulation;
      case 'chkbabycarriageshopping': return chkbabycarriageshopping;
      case 'chkcreditcardshopping': return chkcreditcardshopping;
      case 'chkpetshopping': return chkpetshopping;
      case 'culturecenter': return culturecenter;
      case 'fairday': return fairday;
      case 'infocentershopping': return infocentershopping;
      case 'opendateshopping': return opendateshopping;
      case 'opentime': return opentime;
      case 'parkingshopping': return parkingshopping;
      case 'restdateshopping': return restdateshopping;
      case 'restroom': return restroom;
      case 'saleitem': return saleitem;
      case 'saleitemcost': return saleitemcost;
      case 'scaleshopping': return scaleshopping;
      case 'shopguide': return shopguide;
      case 'checkintime': return checkintime;
      case 'checkouttime': return checkouttime;
      case 'chkcooking': return chkcooking;
      case 'accomcountlodging': return accomcountlodging;
      default: return null;
    }
  }

  // 0/1 값을 변환하는 헬퍼 함수
  String _convertBinaryValue(String? value) {
    if (value == null || value.isEmpty) return '';

    if (value == '0') {
      return '없음';
    } else if (value == '1') {
      return '있음';
    }

    return value; // 0, 1이 아닌 경우 원래 값 반환
  }

  // TourField enum으로 값 가져오기
  String? getFieldValueByEnum(TourField field) {
    return getFieldValue(field.fieldName);
  }

  // 모든 값이 있는 필드들을 한국어로 포맷팅해서 반환
  Map<String, String> getFormattedInfo() {
    final Map<String, String> result = {};

    for (final field in TourField.values) {
      final value = getFieldValueByEnum(field);
      if (value != null && value.isNotEmpty) {
        // 0/1 값을 변환
        final convertedValue = _convertBinaryValue(value);
        if (convertedValue.isNotEmpty) {
          result[field.displayName] = convertedValue;
        }
      }
    }

    return result;
  }

  // 특정 필드만 가져오기
  String? getFormattedField(TourField field) {
    final value = getFieldValueByEnum(field);
    if (value?.isNotEmpty == true) {
      return _convertBinaryValue(value);
    }
    return null;
  }
}