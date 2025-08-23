import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class LoginWithKakaoUseCase {
  final AuthRepository _authRepository;
  final TokenSaver _tokenSaver;

  LoginWithKakaoUseCase(
      this._authRepository,
      this._tokenSaver,
      );

  Future<void> call(String kakaoAccessToken) async {
    final AuthToken authToken =
        await _authRepository.loginWithKakao(kakaoAccessToken);
    print('authToken: ${authToken.toString()}');
    _tokenSaver.saveTokens(authToken);
  }
}