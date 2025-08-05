import 'package:oreum_fe/features/auth/data/services/kakao_auth_service.dart';
import 'package:oreum_fe/features/auth/domain/repositories/kakao_auth_repository.dart';

class KakaoAuthRepositoryImpl implements KakaoAuthRepository{
  final KakaoAuthService _kakaoAuthService;

  KakaoAuthRepositoryImpl(this._kakaoAuthService);

  @override
  Future<String> kakaoLoginWithKakaoTalk() {
    return _kakaoAuthService.kakaoLoginWithKakaoTalk();
  }

  @override
  Future<String> kakaoLoginWithKakaoAccount() {
    return _kakaoAuthService.kakaoLoginWithKakaoAccount();
  }
}