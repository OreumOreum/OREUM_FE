import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/data/services/review_service.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository{
  final ReviewService _reviewService;
  ReviewRepositoryImpl(this._reviewService);
  @override
  Future<List<ReviewResponse>> getPlaceReviews(String placeId, String page, String size) {
    return _reviewService.getPlaceReviews(placeId, page, size);
  }

}