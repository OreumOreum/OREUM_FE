import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_request.freezed.dart';
part 'access_token_request.g.dart';

@freezed
class AccessTokenRequest with _$AccessTokenRequest {
  const factory AccessTokenRequest({
    @JsonKey(name: 'accessToken') required String accessToken,
  }) = _AccessTokenRequest;

  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenRequestFromJson(json);
}