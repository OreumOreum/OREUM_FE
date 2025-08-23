import 'package:freezed_annotation/freezed_annotation.dart';

part 'exist_request.freezed.dart';
part 'exist_request.g.dart';

@freezed
class ExistRequest with _$ExistRequest {
  const factory ExistRequest({
    required String token,
    required String provider,
  }) = _ExistRequest;

  factory ExistRequest.fromJson(Map<String, dynamic> json) =>
      _$ExistRequestFromJson(json);
}