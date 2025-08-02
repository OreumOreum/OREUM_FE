abstract class KakaoAuthRepository {
  Future<String> kakaoLoginWithKakaoTalk();
  Future<String> kakaoLoginWithKakaoAccount();
}