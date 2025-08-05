import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.apiCancelled([
    @Default('API 호출이 취소되었습니다') String message,
  ]) = ApiCancelledException;

  const factory AppException.http([
    @Default('HTTP 오류가 발생했습니다') String message,
  ]) = HttpException;

  const factory AppException.network([
    @Default('인터넷 연결을 확인해주세요') String message,
  ]) = NetworkException;

  const factory AppException.notFound([
    @Default('요청한 리소스를 찾을 수 없습니다') String message,
  ]) = NotFoundException;

  const factory AppException.permission([
    @Default('권한이 없습니다') String message,
  ]) = PermissionException;

  const factory AppException.server([
    @Default('서버 오류가 발생했습니다') String message,
  ]) = ServerException;

  const factory AppException.unauthorized([
    @Default('권한이 없습니다.') String message,
  ]) = UnauthorizedException;

  const factory AppException.unknown([
    @Default('알 수 없는 오류 입니다') String message,
  ]) = UnknownException;
}