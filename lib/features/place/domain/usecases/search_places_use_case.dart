import 'package:oreum_fe/features/place/data/models/search_place_response.dart';
import 'package:oreum_fe/features/place/domain/repositories/place_repository.dart';

class SearchPlacesUseCase {
  final PlaceRepository _placeRepository;
  SearchPlacesUseCase(this._placeRepository);

  Future<SearchPlaceResponse> call(String keyword, int page, {int? sigunguCode}) async {
    SearchPlaceResponse searchPlaceResponse = await _placeRepository.searchPlaces(keyword, page, 20, sigunguCode: sigunguCode);

    return searchPlaceResponse;
  }
}