import 'package:oreum_fe/features/home/domain/repositories/place_repository.dart';

import '../../data/models/place_response.dart';



class GetTypeRecommendUseCase{
  final PlaceRepository _placeRepository;
  GetTypeRecommendUseCase(this._placeRepository);

  Future<List<Place>> call() async {
    final List<Place> typePlaces = await _placeRepository.getTypeRecommend();
    return typePlaces;
  }
}