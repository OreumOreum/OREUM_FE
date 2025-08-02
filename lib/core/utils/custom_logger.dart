import 'package:logger/logger.dart';

final logger = Logger(
  level: Level.debug, // 기본은 debug. release 빌드면 warning 이상만 남기도록 설정도 가능
  printer: PrettyPrinter(
    methodCount: 2,       // 메서드 호출 스택 몇 줄 보여줄지
    errorMethodCount: 8,  // 에러 시 스택 얼마나
    lineLength: 120,      // 가로 길이
    colors: true,         // 색깔 출력
    printEmojis: true,    // 이모지 쓸지
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,      // 타임스탬프 찍을지
  ),
);