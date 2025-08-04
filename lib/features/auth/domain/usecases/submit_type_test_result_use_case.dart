import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class SubmitTypeTestResultUseCase {
  final AuthRepository _authRepository;
  SubmitTypeTestResultUseCase(this._authRepository);

  Future<void> call(String type) {
    return _authRepository.submitTypeTestResult(type);
  }
}