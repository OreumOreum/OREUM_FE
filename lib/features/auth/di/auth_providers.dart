import 'package:oreum_fe/core/di/token_providers.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:oreum_fe/features/auth/data/repositories/apple_auth_repository_impl.dart';
import 'package:oreum_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:oreum_fe/features/auth/data/repositories/google_auth_repository_impl.dart';
import 'package:oreum_fe/features/auth/data/repositories/kakao_auth_repository_impl.dart';
import 'package:oreum_fe/features/auth/data/services/apple_auth_service.dart';
import 'package:oreum_fe/features/auth/data/services/auth_service.dart';
import 'package:oreum_fe/features/auth/data/services/google_auth_service.dart';
import 'package:oreum_fe/features/auth/data/services/kakao_auth_service.dart';
import 'package:oreum_fe/features/auth/domain/usecases/apple_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/check_exist_member_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/check_exist_type_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/google_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/kakao_login_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_apple_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_google_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/login_with_kakao_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/skip_type_test_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/submit_type_test_result_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
}

@riverpod
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  final dataSource = ref.watch(authServiceProvider);
  return AuthRepositoryImpl(dataSource);
}

@riverpod
KakaoAuthService kakaoAuthService(KakaoAuthServiceRef ref) {
  return KakaoAuthService();
}

@riverpod
KakaoAuthRepositoryImpl kakaoAuthRepository(KakaoAuthRepositoryRef ref) {
  final dataSource = ref.watch(kakaoAuthServiceProvider);
  return KakaoAuthRepositoryImpl(dataSource);
}

@riverpod
KakaoLoginUseCase kakaoLoginUseCase(KakaoLoginUseCaseRef ref) {
  final kakaoRepo = ref.watch(kakaoAuthRepositoryProvider);
  final authRepo = ref.watch(authRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);
  return KakaoLoginUseCase(kakaoRepo, authRepo, tokenSaver);
}

@riverpod
AppleAuthService appleAuthService(AppleAuthServiceRef ref) {
  return AppleAuthService();
}

@riverpod
AppleAuthRepositoryImpl appleAuthRepositoryImpl(AppleAuthRepositoryImplRef ref) {
  final AppleAuthService appleAuthService = ref.watch(appleAuthServiceProvider);
  return AppleAuthRepositoryImpl(appleAuthService);
}

@riverpod
AppleLoginUseCase appleLoginUseCase(AppleLoginUseCaseRef ref) {
  final AppleAuthRepositoryImpl appleAuthRepositoryImpl = ref.read(appleAuthRepositoryImplProvider);
  final AuthRepositoryImpl authRepositoryImpl = ref.read(authRepositoryProvider);
  final TokenSaver tokenSaver = ref.read(tokenSaverProvider);

  return AppleLoginUseCase(appleAuthRepositoryImpl, authRepositoryImpl, tokenSaver);
}

@riverpod
GoogleAuthService googleAuthService(GoogleAuthServiceRef ref) {
  return GoogleAuthService();
}

@riverpod
GoogleAuthRepositoryImpl googleAuthRepository(GoogleAuthRepositoryRef ref) {
  final dataSource = ref.watch(googleAuthServiceProvider);
  return GoogleAuthRepositoryImpl(dataSource);
}

@riverpod
GoogleLoginUseCase googleLoginUseCase(GoogleLoginUseCaseRef ref) {
  final googleRepo = ref.watch(googleAuthRepositoryProvider);
  final authRepo = ref.watch(authRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);
  return GoogleLoginUseCase(googleRepo, authRepo, tokenSaver);
}

@riverpod
CheckExistTypeUseCase checkExistTypeUseCase(CheckExistTypeUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return CheckExistTypeUseCase(authRepo);
}

@riverpod
SkipTypeTestUseCase skipTypeTestUseCase(SkipTypeTestUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return SkipTypeTestUseCase(authRepo);
}

@riverpod
SubmitTypeTestResultUseCase submitTypeTestResultUseCase(SubmitTypeTestResultUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return SubmitTypeTestResultUseCase(authRepo);
}

@riverpod
CheckExistMemberUseCase checkExistMemberUseCase(CheckExistMemberUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return CheckExistMemberUseCase(authRepo);
}

@riverpod
LoginWithAppleUseCase loginWithAppleUseCase(LoginWithAppleUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);
  return LoginWithAppleUseCase(authRepo, tokenSaver);
}

@riverpod
LoginWithGoogleUseCase loginWithGoogleUseCase(LoginWithGoogleUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);
  return LoginWithGoogleUseCase(authRepo, tokenSaver);
}

@riverpod
LoginWithKakaoUseCase loginWithKakaoUseCase(LoginWithKakaoUseCaseRef ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final tokenSaver = ref.watch(tokenSaverProvider);
  return LoginWithKakaoUseCase(authRepo, tokenSaver);
}