import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import '../../../../core/di/login_notifier.dart';
import '../viewmodels/account_setting_view_model.dart';

class AccountSettingScreen extends ConsumerStatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  ConsumerState<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends ConsumerState<AccountSettingScreen> {

  void _showDeleteAccountDialog(BuildContext context) {
    final viewModel = ref.read(accountSettingViewModelProvider.notifier);
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext dialogContext) {
        return Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                '정말로 탈퇴하시겠습니까?',
                style: context.textStyles.headLine4.copyWith(color: AppColors.primary),
              ),
              SizedBox(height: 8.h),
              Text(
                '탈퇴하시면 모든 정보가 삭제되며 복구할 수 없습니다.',
                textAlign: TextAlign.center,
                style: context.textStyles.label3.copyWith(color: AppColors.gray300),
              ),
              SizedBox(height: 24.h),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gray100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Text(
                          '취소',
                          style: context.textStyles.label3.copyWith(color: AppColors.gray400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        viewModel.deleteAccount();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Text(
                          '탈퇴하기',
                          style: context.textStyles.label3.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    AppStrings.manageAccount,
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.gray500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                GestureDetector(
                  onTap: () => context.push(RoutePath.typeTest),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.retakeTypeTest,
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.expand,
                              width: 7.w,
                              height: 12.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
                GestureDetector(
                  onTap: () {
                    print('내가쓴 리뷰 터치');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.viewMyReviews,
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.expand,
                              width: 7.w,
                              height: 12.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => _showDeleteAccountDialog(context),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                    child: Text(
                      AppStrings.deleteAccount,
                      style: context.textStyles.body2
                          .copyWith(color: AppColors.gray200),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}