import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoAuthService {
  Future<String> kakaoLoginWithKakaoTalk() async {
    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    return token.accessToken;
  }

  Future<String> kakaoLoginWithKakaoAccount() async {
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    return token.accessToken;
  }
}