import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class GetCourseReviewsUseCase {
  final ReviewRepository _reviewRepository;
  GetCourseReviewsUseCase(this._reviewRepository);
  Future<List<ReviewResponse>> call(String courseId, String page, String size) async {
    List<ReviewResponse> reviews = await _reviewRepository.getCourseReviews(courseId, page, size);
    return reviews;
  }
}