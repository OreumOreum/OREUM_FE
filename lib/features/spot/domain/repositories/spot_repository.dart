import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';

import '../../data/models/spot_ranking_response.dart';

abstract class SpotRepository{
  Future<List<SpotResponse>> getYearSpot(String year);
  Future<List<SpotMonthResponse>> getMonthSpot(String year, String month);
  Future<void> postVisitSpot(String spotId);
  Future<List<SpotRankingResponse>> getSpotRanking(String spotId);

}