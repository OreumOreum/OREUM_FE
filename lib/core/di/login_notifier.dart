import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oreum_fe/core/di/token_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

enum LoginState {  initializing, loggedIn, loggedOut }

class LoginNotifier extends ChangeNotifier {
  final Ref _ref;
  LoginNotifier(this._ref);
  LoginState _status = LoginState.initializing;
  LoginState get status => _status;

  void updateLoginStatus(LoginState newStatus) {
    if (_status != newStatus) {
      _status = newStatus;
      notifyListeners();
    }
  }

  void setLoggedIn() {
    updateLoginStatus(LoginState.loggedIn);
  }

  void setLoggedOut() {
    updateLoginStatus(LoginState.loggedOut);
  }
  Future<void> logout() async {
    // TODO:토큰 삭제
    final tokenSaver = _ref.read(tokenSaverProvider);
    await tokenSaver.deleteTokens();
    //_ref.read(userTypeNotifierProvider).setHasType(false);
    setLoggedOut();
  }
}


@Riverpod(keepAlive: true)
LoginNotifier loginNotifier(LoginNotifierRef ref) {
  return LoginNotifier(ref);
}