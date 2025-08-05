import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class GetPlaceReviewsUseCase {
  final ReviewRepository _reviewRepository;
  GetPlaceReviewsUseCase(this._reviewRepository);
  Future<List<ReviewResponse>> call(String placeId, String page, String size) async {
    List<ReviewResponse> reviews = await _reviewRepository.getPlaceReviews(placeId, page, size);
    return reviews;
  }
}