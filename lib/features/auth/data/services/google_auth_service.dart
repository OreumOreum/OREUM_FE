import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    serverClientId: '363434153342-78s4emgaco38iloe467liegs0hgm8u8t.apps.googleusercontent.com',
  );

  Future<String> googleLogin() async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    print(googleSignInAccount);
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    print(googleSignInAuthentication);
    String? idToken = googleSignInAuthentication.idToken;
    print(idToken);
    final payload = parseJwt(idToken!);
    print(payload); /// 구글 고유 ID (계정마다 고정)
    return idToken;
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT');
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));

    return json.decode(decoded);
  }
}
