import 'package:oreum_fe/features/place/data/models/place_response.dart';

abstract class PlaceRepository {
  Future<PlaceResponse> getPlace(String placeId);
}