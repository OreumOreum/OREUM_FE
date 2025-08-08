// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannerResponseImpl _$$PlannerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannerResponseImpl(
      plannerId: (json['plannerId'] as num).toInt(),
      plannerName: json['plannerName'] as String,
      day: (json['day'] as num).toInt(),
    );

Map<String, dynamic> _$$PlannerResponseImplToJson(
        _$PlannerResponseImpl instance) =>
    <String, dynamic>{
      'plannerId': instance.plannerId,
      'plannerName': instance.plannerName,
      'day': instance.day,
    };
