import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';

abstract class CourseRepository {
  Future<List<CourseResponse>> getCourseList();
  Future<CourseDetailResponse> getCourseDetail(String courseId);
}