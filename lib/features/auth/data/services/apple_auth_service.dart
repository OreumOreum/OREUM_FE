import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService {
  Future<String> appleLogin() async {
    AuthorizationCredentialAppleID authorizationCredentialAppleID =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    String authorizationCode = authorizationCredentialAppleID.authorizationCode;

    return authorizationCode;
  }
}
