import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/montly_badge.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/my_type_provider.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_tab_launcher.dart';
import 'package:oreum_fe/core/utils/email_sander.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/features/setting/presentation/viewmodels/setting_view_model.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final bool _isLocationEnabled = true;
  final bool _isNotificationEnabled = false;

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext dialogContext) {
        return SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLG)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    // 제목
                    Text(
                      '로그아웃',
                      style: context.textStyles.headLine4.copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: 8.h),
                    // 내용
                    Text(
                      '정말 로그아웃 하시겠습니까?',
                      textAlign: TextAlign.center,
                      style: context.textStyles.label3.copyWith(color: AppColors.gray300),
                    ),
                    SizedBox(height: 24.h),
                    // 버튼 영역
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
                            onPressed: () async {
                              Navigator.of(dialogContext).pop(); // 먼저 모달을 닫고
                              await ref.read(loginNotifierProvider).logout(); // 로그아웃 로직 실행
                              ref.read(userTypeNotifierProvider).reset();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Text(
                                '로그아웃',
                                style: context.textStyles.label3.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /*void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Center(
            child: Text(
              '로그아웃',
              style: context.textStyles.headLine4.copyWith(color: AppColors.primary),
            ),
          ),
          content: SizedBox(
            width: 300.w, // 원하는 너비로 조절
            child: Text(
              '정말 로그아웃 하시겠습니까?',
              textAlign: TextAlign.center,
              style: context.textStyles.body2.copyWith(color: AppColors.gray300),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            TextButton(
              child: Text('취소', style: context.textStyles.label3.copyWith(color: AppColors.gray400)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('로그아웃', style: context.textStyles.label3.copyWith(color: AppColors.primary)),
              onPressed: () {
                ref.read(loginNotifierProvider).logout();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          titlePadding: EdgeInsets.only(top: 24.h, bottom: 8.h),
          contentPadding: EdgeInsets.only(bottom: 24.h, left: 24.w, right: 24.w),
        );
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    final settingState = ref.watch(settingViewModelProvider);
    final List<MontlyBadge> myMonthlyBadge = settingState.earnedBadges;
    final myTypeState = ref.watch(myTravelTypeProvider);
    final myTravelType = myTypeState.myTravelType;
    final myTrvelProfile = myTravelType!.profile;
    final myTravelTypeLabel = myTravelType.type;
    if (settingState.status == UiStatus.loading || myTypeState.status == UiStatus.loading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
      );
    }
    else if (settingState.status == UiStatus.error || myTypeState.status == UiStatus.error) {
      return Center(child: ErrorRetryWidget(
        onPressed: () {
          ref.invalidate(settingViewModelProvider);
          ref.invalidate(myTravelTypeProvider);
        },
      ));
    }
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultPadding, vertical: 24.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 72.r,
                    height: 72.r,
                    child: CircleAvatar(
                      backgroundColor: AppColors.gray100,
                      child: Image.asset(
                        myTrvelProfile,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myTravelTypeLabel,
                        style: context.textStyles.headLine4
                            .copyWith(color: AppColors.gray600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        AppStrings.appMainText,
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.push(RoutePath.accountSetting),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.manageAccount,
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray200),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          IconPath.expand,
                          width: 7.r,
                          height: 12.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 14.h, left: 18.w, bottom: 24.h, right: 18.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.travelPickOfMonth,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => context.push(RoutePath.monthlySpot),
                          child: Text(
                            AppStrings.viewAll,
                            style: context.textStyles.body1
                                .copyWith(color: AppColors.gray300),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),myMonthlyBadge.isEmpty
                        ? SizedBox(
                      height: 62.h,
                      child: const Center(
                        child: Text(
                          '아직 획득한 뱃지가 없어요.',
                          style: TextStyle(color: AppColors.gray300),
                        ),
                      ),
                    )
                        :
                    Row(
                      children:
                      List.generate(myMonthlyBadge.length * 2 - 1, (index) {

                        if (index.isOdd) {
                          return SizedBox(width: 12.w);
                        } else {
                          final category = myMonthlyBadge[index ~/ 2];
                          return GestureDetector(
                            onTap: () {
                              print('${category.label} tapped');
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 62.h,
                                  width: 92.w,
                                  child: Center(
                                    child: Image.asset(
                                      category.iconPath,
                                      width: category.iconWidth,
                                      height: category.iconHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
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
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Column(
                children: [
                  //저장됨
                  /*GestureDetector(
                    onTap: () {
                      print('저장됨 터치');
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Text(
                            AppStrings.saved,
                            style: context.textStyles.label3
                                .copyWith(color: AppColors.gray500),
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
                  ),*/
                  SizedBox(
                    height: 32.h,
                  ),
                  //앱 설정
                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          AppStrings.appSettings,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.locationPermission,
                                  style: context.textStyles.body1
                                      .copyWith(color: AppColors.gray400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Switch.adaptive(
                                  activeColor: AppColors.primary,
                                  value: _isLocationEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isLocationEnabled = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: 1.h,
                              thickness: 1.h,
                              color: AppColors.gray100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        height: 1.h,
                        thickness: 1.h,
                        color: AppColors.gray100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          AppStrings.customerSupport,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.versionInfo,
                                  style: context.textStyles.body1
                                      .copyWith(color: AppColors.gray400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Text(
                                  '0.0.0',
                                  style: context.textStyles.body2
                                      .copyWith(color: AppColors.gray300),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                        thickness: 1.h,
                        color: AppColors.gray100,
                      ),
                      GestureDetector(
                        onTap: () {
                          EmailSander().sendEmail(context);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.customerCenter,
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
                  SizedBox(
                    height: 32.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          AppStrings.termsAndPolicies,
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
                        onTap: () {
                          launchCustomTab(
                            context,
                            url: 'https://butternut-lens-9b9.notion.site/2527f270b082800faff2c6b3d867d95d',
                            title: '서비스 이용약관',
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.termsOfService,
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
                          launchCustomTab(
                            context,
                            url: 'https://butternut-lens-9b9.notion.site/2097f270b082819d9bdfe6f21f2a4ef4',
                            title: '모닥불 개인정보 처리방침',
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.privacyPolicy,
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
                  SizedBox(
                    height: 32.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        _showLogoutDialog(context);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                        child: Text(
                          AppStrings.logout,
                          style: context.textStyles.body2
                              .copyWith(color: AppColors.gray200),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}