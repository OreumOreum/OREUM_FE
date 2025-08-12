// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseReviewRequestImpl _$$CourseReviewRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseReviewRequestImpl(
      courseId: (json['courseId'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$CourseReviewRequestImplToJson(
        _$CourseReviewRequestImpl instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'rate': instance.rate,
      'content': instance.content,
    };
