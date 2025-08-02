import 'package:oreum_fe/core/exceptions/app_exception.dart';

class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = '로그인이 필요합니다.']);
}