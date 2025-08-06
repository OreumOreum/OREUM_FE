import 'package:ntp/ntp.dart';


class DateTimeUtils {
  /// NTP 서버에서 시간을 가져와 한국 시간으로 변환한 후, '년도'를 문자열(String)로 반환합니다.
  static Future<String?> getNtpYearAsString() async {
    try {
      final DateTime utcTime = await NTP.now();
      final DateTime koreanTime = utcTime.toUtc().add(const Duration(hours: 9));
      return koreanTime.year.toString();
    } catch (e) {
      print('NTP 시간 가져오기 실패: $e');
      return null;
    }
  }

  /// NTP 서버에서 시간을 가져와 한국 시간으로 변환한 후, '월'을 문자열(String)로 반환합니다.
  static Future<String?> getNtpMonthAsString() async {
    try {
      final DateTime utcTime = await NTP.now();
      final DateTime koreanTime = utcTime.toUtc().add(const Duration(hours: 9));
      // 월을 추출하여 문자열로 변환합니다.
      return koreanTime.month.toString();
    } catch (e) {
      print('NTP 시간 가져오기 실패: $e');
      return null;
    }
  }
}