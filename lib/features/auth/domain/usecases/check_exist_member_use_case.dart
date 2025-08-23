import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class CheckExistMemberUseCase {
  final AuthRepository _authRepository;
  CheckExistMemberUseCase(this._authRepository);

  Future<bool> call(String token, String provider) async {
    final bool isExist = await _authRepository.checkExistMember(token, provider);
    return isExist;
  }
}