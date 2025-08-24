import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/domain/repositories/apple_auth_repository.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class AppleLoginUseCase {
  final AppleAuthRepository _appleAuthRepository;
  final AuthRepository _authRepository;
  final TokenSaver _tokenSaver;

  AppleLoginUseCase(
      this._appleAuthRepository,
      this._authRepository,
      this._tokenSaver,
      );

  Future<String> call() async {
    final String authorizationCode = await _appleAuthRepository.appleLogin();
    print('authorizationCode: $authorizationCode');
    return authorizationCode;
    // final AuthToken authToken = await _authRepository.loginWithApple(authorizationCode);
    // print('authToken: $authToken');
    // await _tokenSaver.saveTokens(authToken);
  }
}