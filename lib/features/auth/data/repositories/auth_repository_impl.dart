import 'package:oreum_fe/core/data/models/auth_token_response.dart';
import 'package:oreum_fe/features/auth/data/models/type_check_response.dart';
import 'package:oreum_fe/features/auth/data/services/auth_service.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthService _authService;
  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthToken> loginWithKakao(String accessToken) async {
    final AuthTokenResponse authTokenResponse = await _authService.loginWithKakao(accessToken);
    return authTokenResponse.toEntity();
  }

  @override
  Future<AuthToken> loginWithGoogle(String idToken) async {
    final AuthTokenResponse authTokenResponse = await _authService.loginWithGoogle(idToken);
    return authTokenResponse.toEntity();
  }

  @override
  Future<TypeCheckResponse> checkTypeExist() {
    return _authService.checkExistType();
  }
}