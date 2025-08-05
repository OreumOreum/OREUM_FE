import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';

class TokenSaver {
  final SecureStorageRepositoryImpl _storage;

  TokenSaver(this._storage);

  Future<void> saveTokens(AuthToken authToken) async {
    await _storage.saveAccessToken(authToken.accessToken);
    await _storage.saveRefreshToken(authToken.refreshToken);
  }
}