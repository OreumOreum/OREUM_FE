import 'package:oreum_fe/features/home/data/models/ultra_srt_item.dart';
import 'package:oreum_fe/features/home/data/models/vilage_fcst_item.dart';

abstract class WeatherRepository {
  Future<List<VilageFcstItem>> getVilageFcst(String baseDate, String baseTime);
  Future<List<UltraSrtItem>> getUltraSrtNcst(String baseDate, String baseTime);
}