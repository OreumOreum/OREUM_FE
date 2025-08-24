import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/features/auth/di/auth_providers.dart';
import 'package:oreum_fe/features/auth/domain/usecases/apple_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/check_exist_member_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/google_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/kakao_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_apple_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_google_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_kakao_use_case.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/my_type_provider.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> checkUserExist(String provider) async {
    switch (provider) {
      case 'KAKAO':
        final KakaoLoginUseCase kakaoLoginUseCase = ref.read(kakaoLoginUseCaseProvider);
        String token = await kakaoLoginUseCase.call();
        final CheckExistMemberUseCase checkExistMemberUseCase = ref.read(checkExistMemberUseCaseProvider);
        bool isExist = await checkExistMemberUseCase.call(token, provider);
        state = state.copyWith(isExist: isExist, token: token);
        break;
      case 'APPLE':
        final AppleLoginUseCase appleLoginUseCase = ref.read(appleLoginUseCaseProvider);
        String token = await appleLoginUseCase.call();
        final CheckExistMemberUseCase checkExistMemberUseCase = ref.read(checkExistMemberUseCaseProvider);
        bool isExist = await checkExistMemberUseCase.call(token, provider);
        state = state.copyWith(isExist: isExist, token: token);
        break;
      case 'GOOGLE':
        final GoogleLoginUseCase googleLoginUseCase = ref.read(googleLoginUseCaseProvider);
        String token = await googleLoginUseCase.call();
        final CheckExistMemberUseCase checkExistMemberUseCase = ref.read(checkExistMemberUseCaseProvider);
        bool isExist = await checkExistMemberUseCase.call(token, provider);
        state = state.copyWith(isExist: isExist, token: token);
        break;
    }
  }

  Future<void> loginWithKakao() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final LoginWithKakaoUseCase loginWithKakaoUseCase = ref.read(loginWithKakaoUseCaseProvider);
      await loginWithKakaoUseCase.call(state.token);
      state = state.copyWith(status: AuthStatus.success);
      ref.read(loginNotifierProvider).setLoggedIn();

      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
      ref.read(userTypeNotifierProvider);
      print('typeState ===== ${userTypeNotifier.hasType}');
      if(userTypeNotifier.hasType == false){
        await ref.read(myTravelTypeProvider.notifier).getMyTravelType();
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final LoginWithGoogleUseCase loginWithGoogleUseCase = ref.read(loginWithGoogleUseCaseProvider);
      await loginWithGoogleUseCase.call(state.token);
      state = state.copyWith(status: AuthStatus.success);
      ref.read(loginNotifierProvider).setLoggedIn();

      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
      ref.read(userTypeNotifierProvider);
      print('typeState ===== ${userTypeNotifier.hasType}');
      if(userTypeNotifier.hasType == false){
        await ref.read(myTravelTypeProvider.notifier).getMyTravelType();
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loginWithApple() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final LoginWithAppleUseCase loginWithAppleUseCase = ref.read(loginWithAppleUseCaseProvider);
      await loginWithAppleUseCase.call(state.token);
      state = state.copyWith(status: AuthStatus.success);

      ref.read(loginNotifierProvider).setLoggedIn();
      final UserTypeNotifier userTypeNotifier = ref.read(userTypeNotifierProvider);
      await userTypeNotifier.checkUserType();
      ref.read(userTypeNotifierProvider);
      print('typeState ===== ${userTypeNotifier.hasType}');
      if(userTypeNotifier.hasType == false){
        await ref.read(myTravelTypeProvider.notifier).getMyTravelType();
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, errorMessage:  e.toString());
    }
  }
}