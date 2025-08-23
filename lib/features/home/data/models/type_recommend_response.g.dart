// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_recommend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeRecommendResponseImpl _$$TypeRecommendResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TypeRecommendResponseImpl(
      places: (json['places'] as List<dynamic>)
          .map((e) => PlaceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLastPage: json['isLastPage'] as bool,
    );

Map<String, dynamic> _$$TypeRecommendResponseImplToJson(
        _$TypeRecommendResponseImpl instance) =>
    <String, dynamic>{
      'places': instance.places,
      'isLastPage': instance.isLastPage,
    };

_$PlaceItemImpl _$$PlaceItemImplFromJson(Map<String, dynamic> json) =>
    _$PlaceItemImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      contentId: json['contentId'] as String,
      contentTypeId: json['contentTypeId'] as String,
      originImage: json['originImage'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      sigunguCode: (json['sigunguCode'] as num).toInt(),
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
      isSaved: json['isSaved'] as bool,
    );

Map<String, dynamic> _$$PlaceItemImplToJson(_$PlaceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'originImage': instance.originImage,
      'thumbnailImage': instance.thumbnailImage,
      'sigunguCode': instance.sigunguCode,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
      'isSaved': instance.isSaved,
    };
