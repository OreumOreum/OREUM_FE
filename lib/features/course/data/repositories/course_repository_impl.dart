import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/data/services/course_service.dart';
import 'package:oreum_fe/features/course/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository{
  final CourseService _courseService;
  CourseRepositoryImpl(this._courseService);

  @override
  Future<List<CourseResponse>> getCourseList() {
    return _courseService.getCourseList();
  }

  @override
  Future<CourseDetailResponse> getCourseDetail(String courseId,String contentId, String contentTypeId) {
    return _courseService.getCourseDetail(courseId);
  }

}