import 'package:oreum_fe/features/place/data/models/search_place_response.dart';

abstract class PlaceRepository {
  Future<SearchPlaceResponse> searchPlaces(
      String keyword, int page, int size,
      {int? sigunguCode});
}
