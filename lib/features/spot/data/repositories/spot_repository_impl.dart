import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';
import 'package:oreum_fe/features/spot/data/services/spot_service.dart';

import '../../domain/repositories/spot_repository.dart';
import '../models/spot_ranking_response.dart';

class SpotRepositoryImpl implements SpotRepository{
  final SpotService _spotService;
  SpotRepositoryImpl(this._spotService);
  @override
  Future<List<SpotResponse>> getYearSpot(String year) {
    return _spotService.getYearSpot(year);
  }

  @override
  Future<List<SpotMonthResponse>> getMonthSpot(String year, String month) {
    return _spotService.getMonthSpot(year, month);
  }

  @override
  Future<void> postVisitSpot(String spotId) {
    return _spotService.postVisitSpot(spotId);
  }

  @override
  Future<List<SpotRankingResponse>> getSpotRanking(String spotId) {
    return _spotService.getSpotRanking(spotId);
  }
}