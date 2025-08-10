// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceReviewRequestImpl _$$PlaceReviewRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceReviewRequestImpl(
      placeId: (json['placeId'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$PlaceReviewRequestImplToJson(
        _$PlaceReviewRequestImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'rate': instance.rate,
      'content': instance.content,
    };
