// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageablePlaceResponseImpl _$$PageablePlaceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PageablePlaceResponseImpl(
      content: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      last: json['isLastPage'] as bool,
    );

Map<String, dynamic> _$$PageablePlaceResponseImplToJson(
        _$PageablePlaceResponseImpl instance) =>
    <String, dynamic>{
      'places': instance.content,
      'isLastPage': instance.last,
    };

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      placeId: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originImage: json['originImage'] as String?,
      thumbnailImage: json['thumbnailImage'] as String?,
      sigunguCode: (json['sigunguCode'] as num).toInt(),
      isSaved: json['isSaved'] as bool,
      contentId: json['contentId'] as String?,
      contentTypeId: json['contentTypeId'] as String?,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.placeId,
      'title': instance.title,
      'originImage': instance.originImage,
      'thumbnailImage': instance.thumbnailImage,
      'sigunguCode': instance.sigunguCode,
      'isSaved': instance.isSaved,
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
    };
