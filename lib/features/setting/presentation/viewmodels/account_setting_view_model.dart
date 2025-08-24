import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/setting/di/setting_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_setting_view_model.g.dart';

@riverpod
class AccountSettingViewModel extends _$AccountSettingViewModel {
  @override
  void build() {
    return;
  }

  /// 회원 탈퇴를 처리하는 메소드
  Future<void> deleteAccount(BuildContext context) async {
    try {
      final usecase = ref.read(deleteMyAccountUseCaseProvider);
      await usecase.call();
      await ref.read(loginNotifierProvider).logout();
      CustomToast.showToast(context, '회원 탈퇴가 완료되었습니다.', 56.h);

    } catch (e) {
      CustomToast.showToast(context, '오류가 발생하였습니다.', 56.h);
    }
  }
}