import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiPath {
  static String baseUrl = dotenv.get('BASE_URL', fallback: null);
  static String tourBaseUrl = dotenv.get('TOUR_API_BASE_URL', fallback: null);

  static const String refresh = '/v1/auth/refresh';
  static const String loginWithKakao = '/v1/auth/login/kakao';
  static const String loginWithGoogle = '/v1/auth/login/google';

  static const String test = '/v1/member/test';
  static const String skipTest = '/v1/member/skip/test';
  static const String category = '/v1/member/me/category';

  static const String course = '/v1/course';

  static String place(String placeId) => '/v1/place/$placeId';

  static String review(String placeId) => '/v1/place/review/$placeId';
  static String reviewCourse(String courseId) => '/v1/course/review/$courseId';
  static const String myReview = '/v1/place/review/me';

  static String courseDetail(String courseId) => '/v1/course/$courseId';

  static String tourApi(String contentId, String contentTypeId) => '/detailIntro2';
  static const String placeReview = '/v1/place/review';
  static const String createCourseReview = '/v1/course/review';

}
