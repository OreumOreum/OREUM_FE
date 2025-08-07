import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

import 'weather_info.dart';

extension WeatherInfoExtension on WeatherInfo {
  String get description {
    if (pty != '0') {
      return _ptyMap[pty] ?? '비가 내릴 것으로 예상됩니다.';
    } else {
      return _skyMap[sky] ?? '날씨를 예상 할 수 없습니다.';
    }
  }

  String get iconAsset {
    if (pty != '0') {
      switch (pty) {
        case '1':
          return IconPath.weatherType('rain');
        case '2':
          return IconPath.weatherType('rain_snow');
        case '3':
          return IconPath.weatherType('snow');
        case '4':
          return IconPath.weatherType('rain');
        default:
          return IconPath.weatherType('unknown');
      }
    } else {
      switch (sky) {
        case '1':
          return IconPath.weatherType('clear');
        case '3':
          return IconPath.weatherType('partly_cloudy');
        case '4':
          return IconPath.weatherType('cloudy');
        default:
          return IconPath.weatherType('unknown');
      }
    }
  }

  double get iconWidth {
    if (pty != '0') {
      switch (pty) {
        case '1':
          return 62.r;
        case '2':
          return 62.r;
        case '3':
          return 62.r;
        case '4':
          return 62.r;
        default:
          return 0;
      }
    } else {
      switch (sky) {
        case '1':
          return 56.r;
        case '3':
          return 62.r;
        case '4':
          return 62.r;
        default:
          return 0;
      }
    }
  }

  static const Map<String, String> _skyMap = {
    '1': '매우 맑을 것으로 예상됩니다.',
    '3': '구름이 많을 것으로 예상됩니다.',
    '4': '흐린 날씨로 예상됩니다.',
  };

  static const Map<String, String> _ptyMap = {
    '1': '비가 내릴 것으로 예상됩니다.',
    '2': '비 또는 눈이 내릴 것으로 예상됩니다.',
    '3': '눈이 내릴 것으로 예상됩니다.',
    '4': '소나기가 내릴 것으로 예상됩니다.',
  };
}