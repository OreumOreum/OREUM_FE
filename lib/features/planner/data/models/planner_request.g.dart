// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannerRequestImpl _$$PlannerRequestImplFromJson(Map<String, dynamic> json) =>
    _$PlannerRequestImpl(
      name: json['name'] as String,
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlannerRequestImplToJson(
        _$PlannerRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'places': instance.places,
    };

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      placeId: (json['placeId'] as num).toInt(),
      day: (json['day'] as num).toInt(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'day': instance.day,
      'order': instance.order,
    };
