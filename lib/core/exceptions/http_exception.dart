import 'app_exception.dart';

class HttpException extends AppException {
  HttpException([super.message = 'HTTP 오류가 발생했습니다']);
}