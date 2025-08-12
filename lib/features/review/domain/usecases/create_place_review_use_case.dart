import 'package:oreum_fe/features/review/data/models/place_review_request.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class CreatePlaceReviewUseCase {
  final ReviewRepository _reviewRepository;

  CreatePlaceReviewUseCase(this._reviewRepository);

  Future<void> call(int placeId, double rate, String content) async {
    PlaceReviewRequest placeReview =
        PlaceReviewRequest(placeId: placeId, rate: rate, content: content);

    return _reviewRepository.createPlaceReview(placeReview);
  }
}
