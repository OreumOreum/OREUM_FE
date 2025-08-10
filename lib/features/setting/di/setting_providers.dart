import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:oreum_fe/features/setting/data/services/setting_service.dart';
import 'package:oreum_fe/features/setting/domain/repositories/setting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/usecases/delete_my_account_use_case.dart';
import '../domain/usecases/get_my_info_use_case.dart';

part 'setting_providers.g.dart';

@riverpod
SettingService settingService(SettingServiceRef ref) {
  return SettingService(ref.watch(dioProvider));
}

@riverpod
SettingRepositoryImpl settingRepository(SettingRepositoryRef ref) {
  return SettingRepositoryImpl(ref.watch(settingServiceProvider));
}

@riverpod
GetMyInfoUseCase getMyInfoUseCase(GetMyInfoUseCaseRef ref) {
  return GetMyInfoUseCase(ref.watch(settingRepositoryProvider));
}
@riverpod
DeleteMyAccountUseCase deleteMyAccountUseCase(DeleteMyAccountUseCaseRef ref) {
  final repo = ref.watch(settingRepositoryProvider);
  return DeleteMyAccountUseCase(repo);
}