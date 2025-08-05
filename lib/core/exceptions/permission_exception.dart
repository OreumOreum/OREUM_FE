import 'app_exception.dart';

class PermissionException extends AppException {
  PermissionException([super.message = '권한이 없습니다']);
}