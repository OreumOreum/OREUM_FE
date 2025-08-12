import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_response.freezed.dart';
part 'spot_response.g.dart';

@freezed
class SpotResponse with _$SpotResponse {
  const factory SpotResponse({
    required String month,
    required int order,
  }) = _SpotResponse;

  factory SpotResponse.fromJson(Map<String, dynamic> json) => _$SpotResponseFromJson(json);
}