// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseImpl _$$CourseResponseImplFromJson(Map<String, dynamic> json) =>
    _$CourseResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originImage: json['originImage'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      category2: json['category2'] as String,
      sigunguCode: (json['sigunguCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CourseResponseImplToJson(
        _$CourseResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originImage': instance.originImage,
      'thumbnailImage': instance.thumbnailImage,
      'category2': instance.category2,
      'sigunguCode': instance.sigunguCode,
    };
