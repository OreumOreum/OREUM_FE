// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderDetialResponseImpl _$$FolderDetialResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FolderDetialResponseImpl(
      folderPlaceId: (json['folderPlaceId'] as num).toInt(),
      FolderId: (json['FolderId'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      placeTitle: json['placeTitle'] as String,
      placeAddress: json['placeAddress'] as String?,
      originImage: json['originImage'] as String?,
      contentId: json['contentId'] as String,
      contentTypeId: json['contentTypeId'] as String,
    );

Map<String, dynamic> _$$FolderDetialResponseImplToJson(
        _$FolderDetialResponseImpl instance) =>
    <String, dynamic>{
      'folderPlaceId': instance.folderPlaceId,
      'FolderId': instance.FolderId,
      'placeId': instance.placeId,
      'placeTitle': instance.placeTitle,
      'placeAddress': instance.placeAddress,
      'originImage': instance.originImage,
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
    };
