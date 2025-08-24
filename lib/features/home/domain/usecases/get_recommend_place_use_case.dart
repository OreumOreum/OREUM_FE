import 'package:oreum_fe/features/home/data/models/category_recommend_response.dart';
import 'package:oreum_fe/features/home/domain/repositories/place_repository.dart';

class GetRecommendPlaceUseCase{
  final PlaceRepository _placeRepository;
  GetRecommendPlaceUseCase(this._placeRepository);

  Future<List<CategoryRecommendResponse>> call() async {
    final List<CategoryRecommendResponse> categoryPlaces = await _placeRepository.getRecommendPlace();
    return categoryPlaces;
  }
}