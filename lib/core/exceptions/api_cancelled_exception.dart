import 'app_exception.dart';

class ApiCancelledException extends AppException {
  ApiCancelledException([super.message = 'API 호출이 취소되었습니다']);
}