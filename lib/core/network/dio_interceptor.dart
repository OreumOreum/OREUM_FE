import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/core/constants/dio_options.dart';
import 'package:oreum_fe/core/data/models/auth_token_response.dart';
import 'package:oreum_fe/core/data/models/refresh_token_request.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/exceptions/api_cancelled_exception.dart';
import 'package:oreum_fe/core/exceptions/http_exception.dart';
import 'package:oreum_fe/core/exceptions/network_exception.dart';
import 'package:oreum_fe/core/exceptions/not_found_exception.dart';
import 'package:oreum_fe/core/exceptions/permission_exception.dart';
import 'package:oreum_fe/core/exceptions/server_exception.dart';
import 'package:oreum_fe/core/exceptions/unauthorized_exception.dart';
import 'package:oreum_fe/core/exceptions/unknown_exception.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/core/utils/token_saver.dart';

class DioInterceptor extends InterceptorsWrapper {
  final SecureStorageRepositoryImpl _secureStorageRepositoryImpl;
  final LoginNotifier _loginNotifier;
  final TokenSaver _tokenSaver;

  DioInterceptor(this._secureStorageRepositoryImpl, this._loginNotifier, this._tokenSaver);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['skipToken'] != true) {
      String? token = await _secureStorageRepositoryImpl.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(response.data);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e('DIO 에러 : ${err.type}');
    switch (err.type) {
      case DioExceptionType.cancel:
        logger.e('API 호출 취소');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: ApiCancelledException(),
            )
        );
      case DioExceptionType.connectionTimeout:
        logger.e('API 연결 시간 초과');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: NetworkException('연결 시간이 초과되었습니다'),
            )
        );
      case DioExceptionType.unknown:
        logger.e('인터넷 연결 문제');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: NetworkException('인터넷 연결을 확인해주세요'),
            )
        );
      case DioExceptionType.receiveTimeout:
        logger.e('API 수신 시간 초과');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: NetworkException('응답 시간이 초과되었습니다'),
            )
        );
      case DioExceptionType.sendTimeout:
        logger.e('API 요청 시간 초과');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: NetworkException('요청 시간이 초과되었습니다'),
            )
        );
      case DioExceptionType.badResponse:
        int statusCode = err.response?.statusCode ?? 0;
        switch (statusCode) {
          case 401:
            logger.e('액세스 토큰 만료');
            final success = await _refreshToken();
            try {
              if(success) {
                final String? newAccessToken = await _secureStorageRepositoryImpl
                    .getAccessToken();
                err.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

                final Dio dio = Dio(dioBaseOptions);
                final Response response = await dio.fetch(err.requestOptions);
                return handler.resolve(response);
              } else {
                await _secureStorageRepositoryImpl.deleteAll();
                _loginNotifier.setLoggedOut();
                logger.e('리프레시 토큰 만료');
                return handler.reject(
                    DioException(
                      requestOptions: err.requestOptions,
                      error: UnauthorizedException('로그인이 필요합니다'),
                    )
                );
              }
            } catch (e) {
              await _secureStorageRepositoryImpl.deleteAll();
              _loginNotifier.setLoggedOut();
              logger.e('리프레시 인증 실패');
              return handler.reject(
                  DioException(
                    requestOptions: err.requestOptions,
                    error: UnauthorizedException('인증에 실패했습니다'),
                  )
              );
            }
          case 403:
            logger.e('403');
            return handler.reject(
                DioException(
                  requestOptions: err.requestOptions,
                  error: PermissionException(),
                )
            );

          case 404:
            logger.e('404');
            return handler.reject(
                DioException(
                  requestOptions: err.requestOptions,
                  error: NotFoundException(),
                )
            );

          case 500:
            logger.e('500');
            return handler.reject(
                DioException(
                  requestOptions: err.requestOptions,
                  error: ServerException(),
                )
            );

          default:
            logger.e(statusCode);
            return handler.reject(
                DioException(
                  requestOptions: err.requestOptions,
                  error: HttpException('HTTP $statusCode 오류가 발생했습니다'),
                )
            );
        }
      default:
        logger.e('알 수 없는 오류 발생');
        return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: UnknownException('알 수 없는 오류가 발생했습니다'),
            )
        );
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final String? refreshToken = await _secureStorageRepositoryImpl.getRefreshToken();
      if (refreshToken == null) return false;

      final Dio dio = Dio(dioBaseOptions);
      final Response response = await dio.post(ApiPath.refresh,
          data: RefreshTokenRequest(refreshToken: refreshToken).toJson());
      final AuthTokenResponse authToken = AuthTokenResponse.fromJson(response.data);
      await _tokenSaver.saveTokens(authToken.toEntity());
      return true;
    } catch (e) {
      return false;
    }
  }
}
