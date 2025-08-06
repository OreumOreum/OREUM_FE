import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../../../../../core/constants/ui_status.dart';

part 'course_detail_state.freezed.dart';

@freezed
class CourseDetailState with _$CourseDetailState{
  const factory CourseDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    CourseDetailResponse? courseDetail ,
  }) = _CourseDetailState;
}