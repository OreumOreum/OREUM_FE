import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_code_request.freezed.dart';
part 'authorization_code_request.g.dart';

@freezed
class AuthorizationCodeRequest with _$AuthorizationCodeRequest {
  const factory AuthorizationCodeRequest({
    required String authorizationCode,
  }) = _AuthorizationCodeRequest;

  factory AuthorizationCodeRequest.fromJson(Map<String, dynamic> json) =>
    _$AuthorizationCodeRequestFromJson(json);
}
