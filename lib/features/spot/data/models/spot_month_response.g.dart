// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_month_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotMonthResponseImpl _$$SpotMonthResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SpotMonthResponseImpl(
      spotId: (json['spotId'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      title: json['title'] as String,
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
      mapX: (json['mapX'] as num).toDouble(),
      mapY: (json['mapY'] as num).toDouble(),
      visited: json['visited'] as bool,
      thumbnailImage: json['thumbnailImage'] as String?,
    );

Map<String, dynamic> _$$SpotMonthResponseImplToJson(
        _$SpotMonthResponseImpl instance) =>
    <String, dynamic>{
      'spotId': instance.spotId,
      'placeId': instance.placeId,
      'title': instance.title,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
      'mapX': instance.mapX,
      'mapY': instance.mapY,
      'visited': instance.visited,
      'thumbnailImage': instance.thumbnailImage,
    };
