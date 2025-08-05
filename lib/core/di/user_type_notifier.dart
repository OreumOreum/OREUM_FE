import 'package:flutter/foundation.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/auth/di/auth_providers.dart';
import 'package:oreum_fe/features/auth/domain/usecases/check_exist_type_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_type_notifier.g.dart';

class UserTypeNotifier extends ChangeNotifier {
  final CheckExistTypeUseCase checkExistTypeUseCase;

  UserTypeNotifier(this.checkExistTypeUseCase);

  bool? _hasType;
  bool _alreadyChecked = false;


  bool? get hasType => _hasType;

  void setHasType(bool hasType) {
    if (_hasType != hasType) {
      _hasType = hasType;
      notifyListeners();
      logger.i(_hasType);
    }
  }

  Future<void> checkUserType() async {
    if (_alreadyChecked) return;
    _alreadyChecked = true;

    final bool hasType = await checkExistTypeUseCase.call();
    setHasType(hasType);
  }

  void resetCheck() {
    _alreadyChecked = false;
  }
}

@riverpod
UserTypeNotifier userTypeNotifier(UserTypeNotifierRef ref) {
  final checkExistTypeUseCase = ref.watch(checkExistTypeUseCaseProvider);
  return UserTypeNotifier(checkExistTypeUseCase);
}