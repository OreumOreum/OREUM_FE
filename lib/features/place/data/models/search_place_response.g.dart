// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchPlaceResponseImpl _$$SearchPlaceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchPlaceResponseImpl(
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => SearchPlaceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLastPage: json['isLastPage'] as bool,
    );

Map<String, dynamic> _$$SearchPlaceResponseImplToJson(
        _$SearchPlaceResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'isLastPage': instance.isLastPage,
    };

_$SearchPlaceItemImpl _$$SearchPlaceItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchPlaceItemImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      contentId: json['contentId'] as String,
      contentTypeId: json['contentTypeId'] as String,
      address: json['address'] as String?,
      thumbnailImage: json['thumbnailImage'] as String?,
      isSaved: json['isSaved'] as bool,
    );

Map<String, dynamic> _$$SearchPlaceItemImplToJson(
        _$SearchPlaceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'address': instance.address,
      'thumbnailImage': instance.thumbnailImage,
      'isSaved': instance.isSaved,
    };
