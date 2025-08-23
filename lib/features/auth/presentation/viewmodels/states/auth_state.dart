import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStatus { idle, loading, success, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.idle) AuthStatus status,
    @Default('') String errorMessage,
    @Default(false) bool isExist,
    @Default('') String token,
  }) = _AuthState;
}
