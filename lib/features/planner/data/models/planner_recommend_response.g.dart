// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_recommend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannerRecommendResponseImpl _$$PlannerRecommendResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannerRecommendResponseImpl(
      plannerName: json['plannerName'] as String,
      placeList: (json['placeList'] as List<dynamic>)
          .map((e) => PlannerRecommendItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlannerRecommendResponseImplToJson(
        _$PlannerRecommendResponseImpl instance) =>
    <String, dynamic>{
      'plannerName': instance.plannerName,
      'placeList': instance.placeList,
    };

_$PlannerRecommendItemImpl _$$PlannerRecommendItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannerRecommendItemImpl(
      placeId: (json['placeId'] as num).toInt(),
      placeTitle: json['placeTitle'] as String,
      placeAddress: json['placeAddress'] as String?,
      thumbnailImage: json['thumbnailImage'] as String?,
      contentTypeId: json['contentTypeId'] as String? ?? '관광지',
    );

Map<String, dynamic> _$$PlannerRecommendItemImplToJson(
        _$PlannerRecommendItemImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'placeTitle': instance.placeTitle,
      'placeAddress': instance.placeAddress,
      'thumbnailImage': instance.thumbnailImage,
      'contentTypeId': instance.contentTypeId,
    };
