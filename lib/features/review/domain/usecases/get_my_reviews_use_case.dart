import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class GetMyReviewsUseCase {
  final ReviewRepository _reviewRepository;
  GetMyReviewsUseCase(this._reviewRepository);
  Future<List<MyReviewResponse>> call() async {
    List<MyReviewResponse> myReviews = await _reviewRepository.getMyReviews();
    return myReviews;
  }
}