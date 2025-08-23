import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

import 'custom_logger.dart';

class DateTimeUtils {
  static Future<DateTime?> getKoreanTime() async {
    try {
      final DateTime utcTime = await NTP.now();
      final DateTime koreanTime = utcTime.toUtc().add(const Duration(hours: 9));
      return koreanTime;
    } catch (e) {
      logger.e('NTP 시간 가져오기 실패: $e');
      return null;
    }
  }

  /// NTP 서버에서 시간을 가져와 한국 시간으로 변환한 후, '년도'를 문자열(String)로 반환합니다.
  static Future<String?> getNtpYearAsString() async {
    try {
      final DateTime utcTime = await NTP.now();
      final DateTime koreanTime = utcTime.toUtc().add(const Duration(hours: 9));
      return koreanTime.year.toString();
    } catch (e) {
      logger.e('NTP 시간 가져오기 실패: $e');
      return null;
    }
  }

  /// NTP 서버에서 시간을 가져와 한국 시간으로 변환한 후, '월'을 문자열(String)로 반환합니다.
  static Future<String?> getNtpMonthAsString() async {
    try {
      final DateTime utcTime = await NTP.now();
      final DateTime koreanTime = utcTime.toUtc().add(const Duration(hours: 9));
      return koreanTime.month.toString();
    } catch (e) {
      logger.e('NTP 시간 가져오기 실패: $e');
      return null;
    }
  }

  String formatToYYYYMMDD(DateTime dateTime) {
    return DateFormat('yyyyMMdd').format(dateTime);
  }

  String formatToHHMM(DateTime dateTime) {
    return DateFormat('HHmm').format(dateTime);
  }

  DateTime getClosestVilageFcstDateTime(DateTime now) {
    final forecastHours = [2, 5, 8, 11, 14, 17, 20, 23];
    final DateTime baseTime = now.subtract(const Duration(minutes: 15));

    print('baseTime: ${baseTime.toString()}, 시간: ${baseTime.hour}');

    DateTime? selected;

    for (final hour in forecastHours.reversed) {
      print('비교: ${baseTime.hour} >= $hour = ${baseTime.hour >= hour}');
      if (baseTime.hour >= hour) {
        selected = DateTime(baseTime.year, baseTime.month, baseTime.day, hour);
        print('선택: $hour시');
        break;
      }
    }

    selected ??= DateTime(baseTime.year, baseTime.month, baseTime.day - 1, 23);

    return selected;
  }
}
