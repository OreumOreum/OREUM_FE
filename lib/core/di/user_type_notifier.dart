import 'package:flutter/foundation.dart';
import 'package:oreum_fe/features/auth/di/auth_providers.dart';
import 'package:oreum_fe/features/auth/domain/usecases/check_exist_type_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_type_notifier.g.dart';

class UserTypeNotifier extends ChangeNotifier {
  final CheckExistTypeUseCase checkExistTypeUseCase;

  UserTypeNotifier(this.checkExistTypeUseCase);

  bool? _hasType;

  bool? get hasType => _hasType;

  void setHasType(bool hasType) {
    if (_hasType != hasType) {
      _hasType = hasType;
      notifyListeners();
    }
  }

  Future<void> checkUserType() async {
    final bool hasType = await checkExistTypeUseCase.call();
    setHasType(hasType);
  }
}

@riverpod
UserTypeNotifier userTypeNotifier(UserTypeNotifierRef ref) {
  final checkExistTypeUseCase = ref.watch(checkExistTypeUseCaseProvider);
  return UserTypeNotifier(checkExistTypeUseCase);
}