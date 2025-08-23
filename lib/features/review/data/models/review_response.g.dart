// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      reviewId: (json['reviewId'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      type: json['type'] as String?,
      isMyReview: json['isMyReview'] as bool,
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'rate': instance.rate,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'type': instance.type,
      'isMyReview': instance.isMyReview,
    };
