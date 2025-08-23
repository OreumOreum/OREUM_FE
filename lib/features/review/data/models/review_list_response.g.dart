// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewListResponseImpl _$$ReviewListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewListResponseImpl(
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      average: (json['average'] as num).toDouble(),
      total: (json['total'] as num).toInt(),
      isLastPage: json['isLastPage'] as bool,
    );

Map<String, dynamic> _$$ReviewListResponseImplToJson(
        _$ReviewListResponseImpl instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'average': instance.average,
      'total': instance.total,
      'isLastPage': instance.isLastPage,
    };
