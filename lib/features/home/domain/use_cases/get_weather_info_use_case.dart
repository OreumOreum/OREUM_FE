import 'package:oreum_fe/core/utils/date_time_utils.dart';
import 'package:oreum_fe/features/home/data/models/ultra_srt_item.dart';
import 'package:oreum_fe/features/home/data/models/vilage_fcst_item.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';
import 'package:oreum_fe/features/home/domain/repositories/weather_repository.dart';

class GetWeatherInfoUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherInfoUseCase(this._weatherRepository);

  Future<WeatherInfo> call() async {
    final koreanTime = await DateTimeUtils.getKoreanTime();
    print('한국시간: ${koreanTime.toString()}');
    if (koreanTime == null) {
      throw Exception('시간 동기화 실패');
    }

    DateTime vilageFcstTime =
        DateTimeUtils().getClosestVilageFcstDateTime(koreanTime);

    String formattedvilageFcstDate =
        DateTimeUtils().formatToYYYYMMDD(vilageFcstTime);
    print('formattedvilageFcstDate: $formattedvilageFcstDate');
    String formattedvilageFcstTime =
        DateTimeUtils().formatToHHMM(vilageFcstTime);
    print('formattedvilageFcstTime: $formattedvilageFcstTime');

    String formattedUltraSrtDate = DateTimeUtils().formatToYYYYMMDD(koreanTime);
    String formattedUltraSrtTime = DateTimeUtils().formatToHHMM(koreanTime);

    List<VilageFcstItem> vilageFcstItems =
        await _weatherRepository.getVilageFcst(
      formattedvilageFcstDate,
      formattedvilageFcstTime,
    );

    List<UltraSrtItem> ultraSrtItem = await _weatherRepository.getUltraSrtNcst(
        formattedUltraSrtDate, formattedUltraSrtTime);

    final skyItem = vilageFcstItems.firstWhere((e) => e.category == 'SKY');
    final ptyItem = vilageFcstItems.firstWhere((e) => e.category == 'PTY');
    final tempItem = ultraSrtItem.firstWhere((e) => e.category == 'T1H');

    final String sky = skyItem.fcstValue;
    final String pty = ptyItem.fcstValue;
    final String temp = tempItem.obsrValue;
    final tempSplit = temp.split('.').first;

    return WeatherInfo(sky: sky, pty: pty, temp: tempSplit);
  }
}
