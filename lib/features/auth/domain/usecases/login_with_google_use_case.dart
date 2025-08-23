import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogleUseCase {
  final AuthRepository _authRepository;
  final TokenSaver _tokenSaver;

  LoginWithGoogleUseCase(
      this._authRepository,
      this._tokenSaver,
      );

  Future<void> call(String idToken) async {
    final AuthToken authToken =
    await _authRepository.loginWithGoogle(idToken);
    print('authToken: ${authToken.toString()}');
    _tokenSaver.saveTokens(authToken);
  }
}