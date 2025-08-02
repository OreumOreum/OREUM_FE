import 'app_exception.dart';

class NotFoundException extends AppException {
  NotFoundException([super.message = '요청한 리소스를 찾을 수 없습니다']);
}