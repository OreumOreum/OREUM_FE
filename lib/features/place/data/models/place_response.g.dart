// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceResponseImpl _$$PlaceResponseImplFromJson(Map<String, dynamic> json) =>
    _$PlaceResponseImpl(
      title: json['title'] as String,
      smallCategory: json['smallCategory'] as String,
      middleCategory: json['middleCategory'] as String,
      largeCategory: json['largeCategory'] as String,
      address: json['address'] as String,
      sigunguCode: (json['sigunguCode'] as num).toInt(),
      overview: json['overview'] as String?,
      mapX: (json['mapX'] as num).toDouble(),
      mapY: (json['mapY'] as num).toDouble(),
      averageRate: (json['averageRate'] as num).toInt(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      isSpot: json['isSpot'] as bool,
      isSaved: json['isSaved'] as bool,
    );

Map<String, dynamic> _$$PlaceResponseImplToJson(_$PlaceResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'smallCategory': instance.smallCategory,
      'middleCategory': instance.middleCategory,
      'largeCategory': instance.largeCategory,
      'address': instance.address,
      'sigunguCode': instance.sigunguCode,
      'overview': instance.overview,
      'mapX': instance.mapX,
      'mapY': instance.mapY,
      'averageRate': instance.averageRate,
      'reviewCount': instance.reviewCount,
      'isSpot': instance.isSpot,
      'isSaved': instance.isSaved,
    };
