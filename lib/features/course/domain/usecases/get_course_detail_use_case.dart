import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/domain/repositories/course_repository.dart';

class GetCourseDetailUseCase{
  final CourseRepository _courseRepository;
  GetCourseDetailUseCase(this._courseRepository);

  Future<CourseDetailResponse> call(String courseId) async {
    final CourseDetailResponse courseDetail = await _courseRepository.getCourseDetail(courseId);
    return courseDetail;
  }
}