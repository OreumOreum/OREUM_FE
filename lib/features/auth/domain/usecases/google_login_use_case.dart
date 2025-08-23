import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';
import 'package:oreum_fe/features/auth/domain/repositories/google_auth_repository.dart';
import 'package:oreum_fe/features/auth/domain/usecases/base_login_use_case.dart';

class GoogleLoginUseCase{
  final GoogleAuthRepository _googleAuthRepository;
  final AuthRepository _authRepository;
  final TokenSaver _tokenSaver;

  GoogleLoginUseCase(
      this._googleAuthRepository,
      this._authRepository,
      this._tokenSaver,
      );

  Future<String> call() async {
    final String idToken = await _googleAuthRepository.googleLogin();
    print('idToken: $idToken');
    return idToken;
    // final AuthToken authToken = await _authRepository.loginWithGoogle(idToken);
    // print('authToken: $authToken');
    // await _tokenSaver.saveTokens(authToken);
  }
}