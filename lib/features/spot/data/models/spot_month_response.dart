import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_month_response.freezed.dart';
part 'spot_month_response.g.dart';

@freezed
class SpotMonthResponse with _$SpotMonthResponse {
  const factory SpotMonthResponse({
    required int spotId,
    required int placeId,
    required String title,
    required String address,
    required String detailAddress,
    required double mapX,
    required double mapY,
    required bool visited,
  }) = _SpotMonthResponse;

  factory SpotMonthResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotMonthResponseFromJson(json);
}