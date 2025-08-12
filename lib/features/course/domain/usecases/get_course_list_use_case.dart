import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/domain/repositories/course_repository.dart';

class GetCourseListUseCase{
  final CourseRepository _courseRepository;
  GetCourseListUseCase(this._courseRepository);

  Future<List<CourseResponse>> call() async {
    final List<CourseResponse> courses = await _courseRepository.getCourseList();
    return courses;
  }
}