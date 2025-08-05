// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotResponseImpl _$$SpotResponseImplFromJson(Map<String, dynamic> json) =>
    _$SpotResponseImpl(
      month: json['month'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$SpotResponseImplToJson(_$SpotResponseImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'order': instance.order,
    };
