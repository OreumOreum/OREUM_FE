import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/course/data/repositories/course_repository_impl.dart';
import 'package:oreum_fe/features/course/data/services/course_service.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_detail_use_case.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_providers.g.dart';

@riverpod
CourseService courseService(CourseServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return CourseService(dio);
}

@riverpod
CourseRepositoryImpl courseRepository(CourseRepositoryRef ref) {
  final courseService = ref.watch(courseServiceProvider);
  return CourseRepositoryImpl(courseService);
}

@riverpod
GetCourseListUseCase getCourseListUseCase(GetCourseListUseCaseRef ref) {
  final courseRepo = ref.watch(courseRepositoryProvider);
  return GetCourseListUseCase(courseRepo);
}

@riverpod
GetCourseDetailUseCase getCourseDetailUseCase(GetCourseDetailUseCaseRef ref) {
  final courseRepo = ref.watch(courseRepositoryProvider);
  return GetCourseDetailUseCase(courseRepo);
}