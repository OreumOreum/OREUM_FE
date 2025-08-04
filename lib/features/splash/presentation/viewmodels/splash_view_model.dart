import 'package:oreum_fe/core/di/local_storage_providers.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/storage/shared_preferences_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  Future<LoginState> build() async {
    await _handleFirstRun();

    final loginState = await _checkLoginStatus();
    ref.read(loginNotifierProvider).updateLoginStatus(loginState);

    return loginState;
  }

  Future<LoginState> _checkLoginStatus() async {
    print('체크 스테이터스 시작');
    final SecureStorageRepositoryImpl secureStorageRepositoryImpl =
    ref.read(secureStorageRepositoryProvider);
    final String? accessToken = await secureStorageRepositoryImpl.getAccessToken();

    if (accessToken != null) {
      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
      return LoginState.loggedIn;
    } else {
      return LoginState.loggedOut;
    }
  }

  Future<void> _handleFirstRun() async {
    final SharedPreferencesRepositoryImpl sharedPreferencesRepositoryImpl =
    ref.read(sharedPreferencesRepositoryProvider);
    final SecureStorageRepositoryImpl secureStorageRepositoryImpl =
    ref.read(secureStorageRepositoryProvider);

    final bool isFirstRun = await sharedPreferencesRepositoryImpl.isFirstRun() ?? true;

    if (isFirstRun) {
      await secureStorageRepositoryImpl.deleteAll();
      await sharedPreferencesRepositoryImpl.setFirstRun(false);
    }
  }
}