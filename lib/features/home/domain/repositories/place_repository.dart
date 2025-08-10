import '../../data/models/place_response.dart';

abstract class PlaceRepository {
  Future<PageablePlaceResponse> getPlaces({
    required int contentTypeId,
    int? sigunguCode,
    bool? type,
    Map<String, dynamic>? pageable,
  });
}