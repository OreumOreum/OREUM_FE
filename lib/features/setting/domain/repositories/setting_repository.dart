import '../../data/models/my_info_response.dart';

abstract class SettingRepository {
  Future<MyInfoResponse> getMyInfo();
  Future<void> deleteMyAccount();
}