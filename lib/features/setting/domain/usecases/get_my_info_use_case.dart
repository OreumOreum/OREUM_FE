import 'package:oreum_fe/features/setting/domain/repositories/setting_repository.dart';

import '../../data/models/my_info_response.dart';

class GetMyInfoUseCase {
  final SettingRepository _repository;
  GetMyInfoUseCase(this._repository);

  Future<MyInfoResponse> call() {
    return _repository.getMyInfo();
  }
}