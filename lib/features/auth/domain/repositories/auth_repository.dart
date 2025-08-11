import 'package:oreum_fe/features/auth/data/models/type_check_response.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthToken> loginWithKakao(String accessToken);
  Future<AuthToken> loginWithGoogle(String idToken);
  Future<AuthToken> loginWithApple(String authorizationCode);
  Future<TypeCheckResponse> checkTypeExist();
  Future<void> skipTypeTest();
  Future<void> submitTypeTestResult(String type);
}
