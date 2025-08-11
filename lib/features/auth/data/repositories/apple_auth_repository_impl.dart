import 'package:oreum_fe/features/auth/data/services/apple_auth_service.dart';
import 'package:oreum_fe/features/auth/domain/repositories/apple_auth_repository.dart';

class AppleAuthRepositoryImpl implements AppleAuthRepository {
  final AppleAuthService _appleAuthService;
  AppleAuthRepositoryImpl(this._appleAuthService);

  @override
  Future<String> appleLogin() {
    return _appleAuthService.appleLogin();
  }
}