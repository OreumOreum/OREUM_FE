import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/core/data/models/auth_token_response.dart';
import 'package:oreum_fe/features/auth/data/models/access_token_request.dart';
import 'package:oreum_fe/features/auth/data/models/authorization_code_request.dart';
import 'package:oreum_fe/features/auth/data/models/exist_request.dart';
import 'package:oreum_fe/features/auth/data/models/id_token_request.dart';
import 'package:oreum_fe/features/auth/data/models/type_check_response.dart';
import 'package:oreum_fe/features/auth/data/models/type_request.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<AuthTokenResponse> loginWithKakao(String accessToken) async {
    final AccessTokenRequest accessTokenRequest =
        AccessTokenRequest(accessToken: accessToken);
    Response response = await _dio.post(
      ApiPath.loginWithKakao,
      data: accessTokenRequest.toJson(),
      options: Options(
        extra: {'skipToken': true},
      ),
    );
    print('토큰: ${response.data}');
    return AuthTokenResponse.fromJson(response.data);
  }

  Future<AuthTokenResponse> loginWithGoogle(String idToken) async {
    final IdTokenRequest idTokenRequest = IdTokenRequest(idToken: idToken);
    Response response = await _dio.post(
      ApiPath.loginWithGoogle,
      data: idTokenRequest.toJson(),
      options: Options(
        extra: {'skipToken': true},
      ),
    );
    return AuthTokenResponse.fromJson(response.data);
  }

  Future<AuthTokenResponse> loginWithApple(String authorizationCode) async {
    final AuthorizationCodeRequest authorizationCodeRequest =
        AuthorizationCodeRequest(authorizationCode: authorizationCode);
    Response response = await _dio.post(
      ApiPath.loginWithApple,
      data: authorizationCodeRequest.toJson(),
      options: Options(
        extra: {'skipToken': true},
      ),
    );

    return AuthTokenResponse.fromJson(response.data);
  }

  Future<TypeCheckResponse> checkExistType() async {
    Response response = await _dio.get(
      ApiPath.test,
    );

    return TypeCheckResponse.fromJson(response.data);
  }

  Future<void> skipTypeTest() async {
    await _dio.get(ApiPath.skipTest);
  }

  Future<void> submitTypeTestResult(String type) async {
    final TypeRequest typeRequest = TypeRequest(categoryType: type);
    await _dio.patch(ApiPath.category, data: typeRequest.toJson());
  }

  Future<bool> checkExistMember(String token, String provider) async {
    final ExistRequest existRequest =
        ExistRequest(token: token, provider: provider);
    Response response = await _dio.post(
      ApiPath.existMember,
      data: existRequest.toJson(),
      options: Options(
        extra: {'skipToken': true},
      ),
    );

    return response.data;
  }
}
