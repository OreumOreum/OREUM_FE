import 'package:oreum_fe/features/spot/data/models/spot_ranking_response.dart';
import 'package:oreum_fe/features/spot/domain/repositories/spot_repository.dart';

class GetSpotRankingUseCase {
  final SpotRepository _spotRepository;
  GetSpotRankingUseCase(this._spotRepository);

  Future<List<SpotRankingResponse>> call(String spotId) {
    return _spotRepository.getSpotRanking(spotId);
  }
}