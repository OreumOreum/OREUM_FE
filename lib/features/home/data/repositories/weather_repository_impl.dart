import 'package:oreum_fe/features/home/data/models/ultra_srt_item.dart';
import 'package:oreum_fe/features/home/data/models/vilage_fcst_item.dart';
import 'package:oreum_fe/features/home/data/services/weather_service.dart';
import 'package:oreum_fe/features/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService _weatherService;
  WeatherRepositoryImpl(this._weatherService);

  @override
  Future<List<VilageFcstItem>> getVilageFcst(String baseDate, String baseTime) {
    return _weatherService.getVilageFcst(baseDate, baseTime);
  }

  @override
  Future<List<UltraSrtItem>> getUltraSrtNcst(String baseDate, String baseTime) {
    return _weatherService.getUltraSrtNcst(baseDate, baseTime);
  }
}