import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiPath {
  static String baseUrl = dotenv.get('BASE_URL', fallback: null);

  static const String refresh = '/v1/auth/refresh';
  static const String loginWithKakao = '/v1/auth/login/kakao';
  static const String loginWithGoogle = '/v1/auth/login/google';

  static const String test = '/api/v1/member/test';
  static const String skipTest = '/api/v1/member/skip/test';
  static const String category = '/api/v1/member/me/category';

  static const String course = '/v1/course';

  static String place(String placeId) => '/v1/place/$placeId';

  static String review(String placeId) => '/v1/place/review/$placeId';
}