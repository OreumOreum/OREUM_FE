import 'package:oreum_fe/features/place/data/models/search_place_response.dart';
import 'package:oreum_fe/features/place/data/services/place_service.dart';
import 'package:oreum_fe/features/place/domain/repositories/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceService _placeService;

  PlaceRepositoryImpl(this._placeService);

  @override
  Future<SearchPlaceResponse> searchPlaces(
      String keyword, int page, int size,
      {int? sigunguCode}) {
    return _placeService.searchPlaces(keyword, page, size, sigunguCode: sigunguCode);
  }
}
