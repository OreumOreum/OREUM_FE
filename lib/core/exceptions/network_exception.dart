import 'package:oreum_fe/core/exceptions/app_exception.dart';

class NetworkException extends AppException {
  NetworkException([super.message = '인터넷 연결을 확인해주세요']);
}