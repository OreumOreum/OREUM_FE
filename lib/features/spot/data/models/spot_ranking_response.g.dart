// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_ranking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotRankingResponseImpl _$$SpotRankingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SpotRankingResponseImpl(
      rank: (json['rank'] as num).toInt(),
      categoryType: json['categoryType'] as String,
      visitCount: (json['visitCount'] as num).toInt(),
    );

Map<String, dynamic> _$$SpotRankingResponseImplToJson(
        _$SpotRankingResponseImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'categoryType': instance.categoryType,
      'visitCount': instance.visitCount,
    };
