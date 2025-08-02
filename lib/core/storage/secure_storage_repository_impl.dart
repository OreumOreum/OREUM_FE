import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oreum_fe/core/storage/local_storage_repository.dart';

class SecureStorageRepositoryImpl implements LocalStorageRepository {
  final FlutterSecureStorage _secureStorage;

  SecureStorageRepositoryImpl(this._secureStorage);

  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _refreshTokenKey = 'REFRESH_TOKEN';

  @override
  Future<void> write(String key, String value) => _secureStorage.write(key: key, value: value);
  @override
  Future<String?> read(String key) => _secureStorage.read(key: key);
  @override
  Future<void> delete(String key) => _secureStorage.delete(key: key);


  Future<void> saveAccessToken(String token) => write(_accessTokenKey, token);
  Future<String?> getAccessToken() => read(_accessTokenKey);
  Future<void> deleteAccessToken() => delete(_accessTokenKey);

  Future<void> saveRefreshToken(String token) => write(_refreshTokenKey, token);
  Future<String?> getRefreshToken() => read(_refreshTokenKey);
  Future<void> deleteRefreshToken() => delete(_refreshTokenKey);

  Future<void> deleteAll() => _secureStorage.deleteAll();
}
