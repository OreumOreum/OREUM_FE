import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';
import 'package:oreum_fe/features/auth/domain/repositories/kakao_auth_repository.dart';
import 'package:oreum_fe/features/auth/domain/usecases/base_login_use_case.dart';

class KakaoLoginUseCase {
  final KakaoAuthRepository _kakaoAuthRepository;
  final AuthRepository _authRepository;
  final TokenSaver _tokenSaver;

  KakaoLoginUseCase(this._kakaoAuthRepository, this._authRepository, this._tokenSaver);

  Future<String> call() async {
    if (await isKakaoTalkInstalled()) {
        final String kakaoAccessToken =
            await _kakaoAuthRepository.kakaoLoginWithKakaoTalk();

        // final AuthToken authToken =
        //     await _authRepository.loginWithKakao(kakaoAccessToken);
        // _tokenSaver.saveTokens(authToken);
      return kakaoAccessToken;
    } else {
      final String kakaoAccessToken =
          await _kakaoAuthRepository.kakaoLoginWithKakaoAccount();
      print('kakaoAccessToken: $kakaoAccessToken');
      return kakaoAccessToken;
      // final AuthToken authToken =
      //     await _authRepository.loginWithKakao(kakaoAccessToken);
      // print('authToken: ${authToken.toString()}');
      // _tokenSaver.saveTokens(authToken);
    }
  }
}
