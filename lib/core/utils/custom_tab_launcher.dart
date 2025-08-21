import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';

Future<void> launchCustomTab(BuildContext context, {
  required String url,
  required String title,
}) async {
  try {
    await launchUrl(
      Uri.parse(url),
      customTabsOptions: CustomTabsOptions(
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: Colors.white,
        ),
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: const SafariViewControllerOptions(
        preferredBarTintColor: Colors.white,
        preferredControlTintColor: Colors.black,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // 브라우저를 열 수 없을 경우 에러 메시지를 표시합니다.
    CustomToast.showToast(context, '브라우저를 열 수 없습니다', 56.h);
  }
}