import '../../data/models/place_response.dart';
import '../repositories/place_repository.dart';

class GetPlacesUseCase {
  final PlaceRepository _repository;
  GetPlacesUseCase(this._repository);

  Future<PageablePlaceResponse> call({
    required int contentTypeId,
    int? sigunguCode,
    bool? type,
    Map<String, dynamic>? pageable,
  }) {
    return _repository.getPlaces(
      contentTypeId: contentTypeId,
      sigunguCode: sigunguCode,
      type: type,
      pageable: pageable,
    );
  }
}