import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

import '../../data/models/course_review_request.dart';

class CreateCourseReviewUseCase {
  final ReviewRepository _reviewRepository;

  CreateCourseReviewUseCase(this._reviewRepository);

  Future<void> call(int courseId, double rate, String content) async {
    CourseReviewRequest courseReview =
    CourseReviewRequest(courseId: courseId, rate: rate, content: content);

    return _reviewRepository.createCourseReview(courseReview);
  }
}
