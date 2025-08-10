import 'package:oreum_fe/features/setting/domain/repositories/setting_repository.dart';

class DeleteMyAccountUseCase {
  final SettingRepository _repository;
  DeleteMyAccountUseCase(this._repository);

  Future<void> call() {
    return _repository.deleteMyAccount();
  }
}