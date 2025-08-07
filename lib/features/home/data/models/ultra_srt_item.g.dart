// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ultra_srt_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UltraSrtItemImpl _$$UltraSrtItemImplFromJson(Map<String, dynamic> json) =>
    _$UltraSrtItemImpl(
      baseDate: json['baseDate'] as String,
      baseTime: json['baseTime'] as String,
      category: json['category'] as String,
      nx: (json['nx'] as num).toInt(),
      ny: (json['ny'] as num).toInt(),
      obsrValue: json['obsrValue'] as String,
    );

Map<String, dynamic> _$$UltraSrtItemImplToJson(_$UltraSrtItemImpl instance) =>
    <String, dynamic>{
      'baseDate': instance.baseDate,
      'baseTime': instance.baseTime,
      'category': instance.category,
      'nx': instance.nx,
      'ny': instance.ny,
      'obsrValue': instance.obsrValue,
    };
