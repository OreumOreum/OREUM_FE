import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/di/course_providers.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:oreum_fe/features/course/presentation/viewmodels/states/course_detail_state.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/states/place_detail_state.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../di/course_providers.dart';
import '../../domain/usecases/get_course_detail_use_case.dart';

part 'course_detail_view_model.g.dart';

@riverpod
class CourseDetailViewModel extends _$CourseDetailViewModel {
  @override
  CourseDetailState build() {
    return CourseDetailState();
  }

  Future<void> initializeCourseDetail(String courseId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final GetCourseDetailUseCase getCourseDetailUseCase = ref.read(getCourseDetailUseCaseProvider);
      CourseDetailResponse course = await getCourseDetailUseCase.call(courseId);
      state = state.copyWith(status: UiStatus.success, courseDetail: course);
    }
    catch(e){
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }



}