import '../../data/models/place_response.dart';
import '../repositories/place_repository.dart';

class GetPlaceUseCase{
  final PlaceRepository _placeRepository;
  GetPlaceUseCase(this._placeRepository);

  Future<PlaceResponse> call(String placeId) async {
    final PlaceResponse places = await _placeRepository.getPlace(placeId);
    return places;
  }
}