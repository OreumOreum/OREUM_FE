import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/setting/data/models/my_info_response.dart';

class SettingService { // MemberService -> SettingService
  final Dio _dio;
  SettingService(this._dio);

  Future<MyInfoResponse> getMyInfo() async {
    final response = await _dio.get(ApiPath.myInfo);
    return MyInfoResponse.fromJson(response.data);
  }
  Future<void> deleteMyAccount() async {
    try {
      await _dio.delete(ApiPath.myInfo);
    } catch (e) {
      rethrow;
    }
  }
}