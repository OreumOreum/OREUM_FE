import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/features/auth/di/auth_providers.dart';
import 'package:oreum_fe/features/auth/domain/entities/auth_token.dart';
import 'package:oreum_fe/features/auth/domain/usecases/apple_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/google_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/kakao_login_use_case.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> loginWithKakao() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final KakaoLoginUseCase kakaoLoginUseCase = ref.read(kakaoLoginUseCaseProvider);
      await kakaoLoginUseCase.call();
      state = state.copyWith(status: AuthStatus.success);
      ref.read(loginNotifierProvider).setLoggedIn();

      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final GoogleLoginUseCase googleLoginUseCase = ref.read(googleLoginUseCaseProvider);
      await googleLoginUseCase.call();
      state = state.copyWith(status: AuthStatus.success);
      ref.read(loginNotifierProvider).setLoggedIn();

      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loginWithApple() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final AppleLoginUseCase appleLoginUseCase = ref.read(appleLoginUseCaseProvider);
      await appleLoginUseCase.call();
      state = state.copyWith(status: AuthStatus.success);

      ref.read(loginNotifierProvider).setLoggedIn();
      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage:  e.toString());
    }
  }
}