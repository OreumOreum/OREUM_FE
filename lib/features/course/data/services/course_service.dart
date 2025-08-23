
import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';

import '../models/course_detail_response.dart';

class CourseService {
  final Dio _dio;
  CourseService(this._dio);

  Future<List<CourseResponse>> getCourseList() async {
    Response response = await _dio.get(ApiPath.course);
    print(response.data);
    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) => CourseResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<CourseDetailResponse> getCourseDetail(String courseId) async {
    Response response = await _dio.get(ApiPath.courseDetail(courseId));
    print(response.data);
    return CourseDetailResponse.fromJson(response.data);
  }
}