import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_ranking_response.freezed.dart';
part 'spot_ranking_response.g.dart';

@freezed
class SpotRankingResponse with _$SpotRankingResponse {
  const factory SpotRankingResponse({
    required int rank,
    required String categoryType,
    required int visitCount,
  }) = _SpotRankingResponse;

  factory SpotRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotRankingResponseFromJson(json);
}