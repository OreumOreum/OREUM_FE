import 'package:oreum_fe/features/auth/data/services/google_auth_service.dart';
import 'package:oreum_fe/features/auth/domain/repositories/google_auth_repository.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  final GoogleAuthService _googleAuthService;

  GoogleAuthRepositoryImpl(this._googleAuthService);

  @override
  Future<String> googleLogin() {
    return _googleAuthService.googleLogin();
  }
}