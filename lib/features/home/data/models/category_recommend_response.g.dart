// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_recommend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryRecommendResponseImpl _$$CategoryRecommendResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryRecommendResponseImpl(
      placeId: (json['placeId'] as num).toInt(),
      contentId: json['contentId'] as String,
      contentTypeId: json['contentTypeId'] as String,
      orignImage: json['orignImage'] as String,
    );

Map<String, dynamic> _$$CategoryRecommendResponseImplToJson(
        _$CategoryRecommendResponseImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'orignImage': instance.orignImage,
    };
