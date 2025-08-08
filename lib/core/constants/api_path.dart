import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiPath {
  static String baseUrl = dotenv.get('BASE_URL', fallback: null);
  static String weatherBaseUrl = dotenv.get('WEATHER_BASE_URL', fallback: null);

  static const String refresh = '/v1/auth/refresh';
  static const String loginWithKakao = '/v1/auth/login/kakao';
  static const String loginWithGoogle = '/v1/auth/login/google';

  static const String test = '/api/v1/member/test';
  static const String skipTest = '/api/v1/member/skip/test';
  static const String category = '/api/v1/member/me/category';

  static String spotStampYear(String year) => '/api/v1/spots/stamp/$year';
  static String spotStampYearMonth(String year, String month) => '/api/v1/spots/stamp/$year/$month';
  static String spotVisit(String spotId) => '/api/v1/spots/$spotId/visit';
  static String spotRanking(String spotId) => '/api/v1/spots/$spotId/ranking';

  static const String myInfo = '/api/v1/member/me';
  static const String folder = '/v1/folder';
  static String folderDetail(String folderId) => '/v1/folder/$folderId';
  static String folderPlaceDelete(String folderId) => '/v1/folder/place/$folderId';

  static const String searchPlaces = '/v1/place/search-places';

  static const String planner = '/v1/planner';
  static plannerDetail(String plannerId) => '/v1/planner/$plannerId';

  static const String getVilageFcst = '/getVilageFcst';
  static const String getUltraSrtNcst = '/getUltraSrtNcst';

  static plannerName(String plannerId) => '/v1/planner/$plannerId/name';
  static const plannerRecommend = '/v1/planner/recommend';

}