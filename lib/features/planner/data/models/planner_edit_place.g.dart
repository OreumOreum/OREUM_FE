// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_edit_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannerEditPlaceImpl _$$PlannerEditPlaceImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannerEditPlaceImpl(
      placeId: json['placeId'] as String,
      day: (json['day'] as num).toInt(),
      orderIndex: (json['orderIndex'] as num).toInt(),
      title: json['title'] as String,
      mapX: (json['mapX'] as num?)?.toDouble(),
      mapY: (json['mapY'] as num?)?.toDouble(),
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$$PlannerEditPlaceImplToJson(
        _$PlannerEditPlaceImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'day': instance.day,
      'orderIndex': instance.orderIndex,
      'title': instance.title,
      'mapX': instance.mapX,
      'mapY': instance.mapY,
      'address': instance.address,
    };
