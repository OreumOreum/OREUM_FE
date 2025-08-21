// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_saved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderSavedResponseImpl _$$FolderSavedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FolderSavedResponseImpl(
      folderId: (json['folderId'] as num).toInt(),
      folderName: json['folderName'] as String,
      isSaved: json['isSaved'] as bool,
    );

Map<String, dynamic> _$$FolderSavedResponseImplToJson(
        _$FolderSavedResponseImpl instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'folderName': instance.folderName,
      'isSaved': instance.isSaved,
    };
