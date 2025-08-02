import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../course/data/models/course_response.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  idle, loading, success, error
}

@freezed
class HomeState with _$HomeState{
  const factory HomeState({
    @Default(HomeStatus.idle) HomeStatus status,
    @Default('') String errorMessage,
    @Default([]) List<CourseResponse> courses,
}) = _HomeState;
}