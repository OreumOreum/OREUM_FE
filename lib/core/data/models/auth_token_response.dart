import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';

part 'auth_token_response.freezed.dart';
part 'auth_token_response.g.dart';

@freezed
class AuthTokenResponse with _$AuthTokenResponse {
  const factory AuthTokenResponse({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokenResponse;

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);
}

extension AuthTokenResponseX on AuthTokenResponse {
  AuthToken toEntity() => AuthToken(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}