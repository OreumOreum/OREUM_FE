import 'package:oreum_fe/features/setting/data/services/setting_service.dart';
import '../../domain/repositories/setting_repository.dart';
import '../models/my_info_response.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingService _service;
  SettingRepositoryImpl(this._service);

  @override
  Future<MyInfoResponse> getMyInfo() {
    return _service.getMyInfo();
  }
}