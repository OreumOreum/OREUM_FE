import 'app_exception.dart';

class ServerException extends AppException {
  ServerException([super.message = '서버 오류가 발생했습니다']);
}
