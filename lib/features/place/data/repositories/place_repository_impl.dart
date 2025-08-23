import '../../domain/repositories/place_repository.dart';
import '../models/place_response.dart';
import '../models/search_place_response.dart';
import '../services/place_service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceService _placeService;

  PlaceRepositoryImpl(this._placeService);

  @override
  Future<PlaceResponse> getPlace(String placeId) {
    return _placeService.getPlace(placeId);
  }

  @override
  Future<SearchPlaceResponse> searchPlaces(
      String keyword, int page, int size,
      {int? sigunguCode}) {
    return _placeService.searchPlaces(keyword, page, size, sigunguCode: sigunguCode);
  }
}
