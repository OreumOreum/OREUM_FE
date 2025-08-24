import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/di/course_providers.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:oreum_fe/features/course/presentation/viewmodels/states/course_detail_state.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/di/review_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../review/domain/usecases/get_course_reviews_use_case.dart';
import '../../../tour/data/models/tour_response.dart';
import '../../../tour/di/tour_providers.dart';
import '../../../tour/domain/usecases/get_tour_api_use_case.dart';
import '../../domain/usecases/get_course_detail_use_case.dart';

part 'course_detail_view_model.g.dart';

@riverpod
class CourseDetailViewModel extends _$CourseDetailViewModel {
  @override
  CourseDetailState build(String courseId) {
    return CourseDetailState();
  }

  Future<void> initializeCourseDetail(String courseId, String contentId, String contentTypeId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      final GetCourseDetailUseCase getCourseDetailUseCase = ref.read(getCourseDetailUseCaseProvider);
      final GetTourApiUseCase getTourApiUseCase = ref.read(getTourApiUseCaseProvider);
      final GetCourseReviewsUseCase getCourseReviewsUseCase = ref.read(getCourseReviewsUseCaseProvider);
      final GetCourseListUseCase getCourseListUseCase = ref.read(getCourseListUseCaseProvider);
      List<CourseResponse> courses = await getCourseListUseCase.call();
      List<ReviewResponse> reviews = await getCourseReviewsUseCase.call(courseId, '0', '4');
      TourResponse tour = await getTourApiUseCase.call(contentId, contentTypeId);
      CourseDetailResponse course = await getCourseDetailUseCase.call(courseId, contentId, contentTypeId);
      state = state.copyWith(status: UiStatus.success, courseDetail: course, tour: tour, reviews: reviews,courses: courses);
    }
    catch(e){
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> refreshCourseDetailBackground(String courseId) async {
    try {
      final GetCourseReviewsUseCase getCourseReviewsUseCase = ref.read(getCourseReviewsUseCaseProvider);
      List<ReviewResponse> reviews = await getCourseReviewsUseCase.call(courseId, '0', '4');
      state = state.copyWith(reviews: reviews);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }
}
