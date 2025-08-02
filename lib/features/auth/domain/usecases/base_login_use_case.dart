import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';

abstract class BaseLoginUseCase {
  final SecureStorageRepositoryImpl _secureStorageRepositoryImpl;

  BaseLoginUseCase(this._secureStorageRepositoryImpl);

  Future<void> saveTokens(AuthToken authToken) async {
    await _secureStorageRepositoryImpl.saveAccessToken(authToken.accessToken);
    await _secureStorageRepositoryImpl.saveRefreshToken(authToken.refreshToken);
  }
}