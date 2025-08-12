import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class SkipTypeTestUseCase {
  final AuthRepository _authRepository;
  SkipTypeTestUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.skipTypeTest();
  }
}