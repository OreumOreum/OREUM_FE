import 'package:oreum_fe/features/auth/data/models/type_check_response.dart';
import 'package:oreum_fe/features/auth/domain/repositories/auth_repository.dart';

class CheckExistTypeUseCase {
  final AuthRepository _authRepository;
  CheckExistTypeUseCase(this._authRepository);

  Future<bool> call() async {
    final TypeCheckResponse response = await _authRepository.checkTypeExist();
    return response.typeCheck;
  }
}