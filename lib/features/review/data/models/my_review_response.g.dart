// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyReviewResponseImpl _$$MyReviewResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyReviewResponseImpl(
      rate: (json['rate'] as num).toDouble(),
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      placeTitle: json['placeTitle'] as String,
      reviewID: (json['reviewID'] as num).toInt(),
    );

Map<String, dynamic> _$$MyReviewResponseImplToJson(
        _$MyReviewResponseImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'placeTitle': instance.placeTitle,
      'reviewID': instance.reviewID,
    };
