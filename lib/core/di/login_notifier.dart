import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

enum LoginState {  initializing, loggedIn, loggedOut }

class LoginNotifier extends ChangeNotifier {
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

    setLoggedOut();
  }
}


@Riverpod(keepAlive: true)
LoginNotifier loginNotifier(LoginNotifierRef ref) {
  return LoginNotifier();
}