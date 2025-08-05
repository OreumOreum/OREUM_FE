import 'package:oreum_fe/core/exceptions/app_exception.dart';

class UnknownException extends AppException {
  UnknownException([super.message = '알 수 없는 오류 입니다']);
}