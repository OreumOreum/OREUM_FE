// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailResponseImpl _$$CourseDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailResponseImpl(
      title: json['title'] as String,
      middleCategory: json['middleCategory'] as String,
      sigunguCode: (json['sigunguCode'] as num?)?.toInt(),
      overview: json['overview'] as String?,
      averageRate: (json['averageRate'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseDetailResponseImplToJson(
        _$CourseDetailResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'middleCategory': instance.middleCategory,
      'sigunguCode': instance.sigunguCode,
      'overview': instance.overview,
      'averageRate': instance.averageRate,
      'reviewCount': instance.reviewCount,
      'places': instance.places,
    };

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      title: json['title'] as String,
      address: json['address'] as String,
      mapX: (json['mapX'] as num).toDouble(),
      mapY: (json['mapY'] as num).toDouble(),
      originImage: json['originImage'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'mapX': instance.mapX,
      'mapY': instance.mapY,
      'originImage': instance.originImage,
      'thumbnailImage': instance.thumbnailImage,
    };
