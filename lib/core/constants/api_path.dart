import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiPath {
  static String baseUrl = dotenv.get('BASE_URL', fallback: null);
  static String tourBaseUrl = dotenv.get('TOUR_API_BASE_URL', fallback: null);
  static String weatherBaseUrl = dotenv.get('WEATHER_BASE_URL', fallback: null);

  static const String refresh = '/v1/auth/refresh';
  static const String loginWithKakao = '/v1/auth/login/kakao';
  static const String loginWithGoogle = '/v1/auth/login/google';
  static const String loginWithApple = '/v1/auth/login/apple';

  static const String test = '/v1/member/test';
  static const String skipTest = '/v1/member/skip/test';
  static const String category = '/v1/member/me/category';
  static String spotStampYear(String year) => '/v1/spots/stamp/$year';
  static String spotStampYearMonth(String year, String month) => '/v1/spots/stamp/$year/$month';
  static String spotVisit(String spotId) => '/v1/spots/$spotId/visit';
  static String spotRanking(String spotId) => '/v1/spots/$spotId/ranking';
  static const String place = '/v1/place';

  static const String myInfo = '/v1/member/me';
  static const String folder = '/v1/folder';
  static const String defaultFolder = '/v1/folder/default';
  static String folderDetail(String folderId) => '/v1/folder/$folderId';
  static String folderPlaceDelete(String folderId) => '/v1/folder/place/$folderId';

  static const String searchPlaces = '/v1/place/search-places';

  static const String planner = '/v1/planner';
  static plannerDetail(String plannerId) => '/v1/planner/$plannerId';

  static const String course = '/v1/course';

  static String placeDetail(String placeId) => '/v1/place/$placeId';

  static String review(String placeId) => '/v1/place/review/$placeId';
  static String reviewCourse(String courseId) => '/v1/course/review/$courseId';
  static const String myReview = '/v1/place/review/me';

  static String courseDetail(String courseId) => '/v1/course/$courseId';

  static String tourApi(String contentId, String contentTypeId) => '/detailIntro2';
  static const String placeReview = '/v1/place/review';
  static const String createCourseReview = '/v1/course/review';

  static const String getVilageFcst = '/getVilageFcst';
  static const String getUltraSrtNcst = '/getUltraSrtNcst';

  static plannerName(String plannerId) => '/v1/planner/$plannerId/name';
  static const plannerRecommend = '/v1/planner/recommend';

  static String folderSaved(int placeId) => '/v1/folder/detail/$placeId';

  static const String categoryRecommend = '/v1/place/category/recommend';

  static const String existMember = '/v1/auth/member/exist';
}
