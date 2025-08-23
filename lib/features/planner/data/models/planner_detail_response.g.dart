// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannerDetailResponseImpl _$$PlannerDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannerDetailResponseImpl(
      plannerPlaceId: (json['plannerPlaceId'] as num).toInt(),
      day: (json['day'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      plannerId: (json['plannerId'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      placeTitle: json['placeTitle'] as String,
      placeAddress: json['placeAddress'] as String,
      placeThumbnailImage: json['placeThumbnailImage'] as String?,
      contentTypeId: json['contentTypeId'] as String,
      contentId: json['contentId'] as String,
      mapX: (json['mapX'] as num?)?.toDouble(),
      mapY: (json['mapY'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlannerDetailResponseImplToJson(
        _$PlannerDetailResponseImpl instance) =>
    <String, dynamic>{
      'plannerPlaceId': instance.plannerPlaceId,
      'day': instance.day,
      'order': instance.order,
      'plannerId': instance.plannerId,
      'placeId': instance.placeId,
      'placeTitle': instance.placeTitle,
      'placeAddress': instance.placeAddress,
      'placeThumbnailImage': instance.placeThumbnailImage,
      'contentTypeId': instance.contentTypeId,
      'contentId': instance.contentId,
      'mapX': instance.mapX,
      'mapY': instance.mapY,
    };
