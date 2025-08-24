// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderResponseImpl _$$FolderResponseImplFromJson(Map<String, dynamic> json) =>
    _$FolderResponseImpl(
      folderId: (json['folderId'] as num).toInt(),
      folderName: json['folderName'] as String,
      originImages: (json['originImages'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$FolderResponseImplToJson(
        _$FolderResponseImpl instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'folderName': instance.folderName,
      'originImages': instance.originImages,
      'isDefault': instance.isDefault,
    };
