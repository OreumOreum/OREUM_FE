import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/domain/repositories/spot_repository.dart';

import '../../../../core/utils/date_time_utils.dart';

class GetYearMonthSpotUseCase{
  final SpotRepository _spotRepository;
  GetYearMonthSpotUseCase(this._spotRepository);
  Future<List<SpotMonthResponse>> call(String year, String month) async{
    List<SpotMonthResponse> spots = await _spotRepository.getMonthSpot(year, month);
    return spots;
  }
}