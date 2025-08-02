import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_check_response.freezed.dart';
part 'type_check_response.g.dart';

@freezed
class TypeCheckResponse with _$TypeCheckResponse {
  const factory TypeCheckResponse({
    required bool typeCheck,
  }) = _TypeCheckResponse;

  factory TypeCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeCheckResponseFromJson(json);
}
