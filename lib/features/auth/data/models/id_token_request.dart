import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_token_request.freezed.dart';
part 'id_token_request.g.dart';

@freezed
class IdTokenRequest with _$IdTokenRequest {
  const factory IdTokenRequest({
    required String idToken,
  }) = _IdTokenRequest;

  factory IdTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$IdTokenRequestFromJson(json);
}
