import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/home/data/models/ultra_srt_item.dart';
import 'package:oreum_fe/features/home/data/models/vilage_fcst_item.dart';

class WeatherService {
  final Dio _dio;

  WeatherService(this._dio);

  static String dataPortalApikey =
      dotenv.get('DATA_PORTAL_API_KEY', fallback: null);

  static const int _jejuNX = 52;
  static const int _jejuNY = 38;

  Future<List<VilageFcstItem>> getVilageFcst(String baseDate, String baseTime) async {
    Response response = await _dio.get(
      ApiPath.getVilageFcst,
      queryParameters: {
        'serviceKey': dataPortalApikey,
        'base_date': baseDate,
        'base_time': baseTime,
        'nx': _jejuNX,
        'ny': _jejuNY,
        'dataType': 'JSON',
        'numOfRows': 12,
      },
    );


    logger.i(_parseVilageFcstItems(response.data).toString());
    return _parseVilageFcstItems(response.data);
  }

  Future<List<UltraSrtItem>> getUltraSrtNcst(String baseDate, String baseTime) async {
    Response response = await _dio.get(
      ApiPath.getUltraSrtNcst,
      queryParameters: {
        'serviceKey': dataPortalApikey,
        'base_date': baseDate,
        'base_time': baseTime,
        'nx': _jejuNX,
        'ny': _jejuNY,
        'dataType': 'JSON',
        'numOfRows': 8,
      },
    );


    logger.i(_parseUltraSrtItems(response.data).toString());
    return _parseUltraSrtItems(response.data);
  }

  List<VilageFcstItem> _parseVilageFcstItems(Map<String, dynamic> json) {
    final itemList = json['response']['body']['items']['item'] as List;
    return itemList
        .map((e) => VilageFcstItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  List<UltraSrtItem> _parseUltraSrtItems(Map<String, dynamic> json) {
    final itemList = json['response']['body']['items']['item'] as List;
    return itemList
        .map((e) => UltraSrtItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
