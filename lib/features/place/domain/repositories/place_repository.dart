import 'package:oreum_fe/features/place/data/models/place_response.dart';

import 'package:oreum_fe/features/place/data/models/search_place_response.dart';

abstract class PlaceRepository {
  Future<PlaceResponse> getPlace(String placeId);
  Future<SearchPlaceResponse> searchPlaces(
      String keyword, int page, int size,
      {int? sigunguCode});
}
