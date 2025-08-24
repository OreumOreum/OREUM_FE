import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class DeleteMyReviewUseCase {
  final ReviewRepository _reviewRepository;

  DeleteMyReviewUseCase(this._reviewRepository);

  Future<void> call(int reviewId) async {
    return _reviewRepository.deleteMyReview(reviewId);
  }
}
