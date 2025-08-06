import '../repositories/spot_repository.dart';

class PostVisitSpotUseCase {
  final SpotRepository _spotRepository;
  PostVisitSpotUseCase(this._spotRepository);

  Future<void> call(String spotId) async {
    return _spotRepository.postVisitSpot(spotId);
  }
}