import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/montly_badge.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isLocationEnabled = true;
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    final List<String> ownedBadgeNamesFromApi = ['lucky', 'travelhunter'];
    final List<MontlyBadge> myMonthlyBadge = MontlyBadge.values
        .where((badge) => ownedBadgeNamesFromApi.contains(badge.name))
        .toList();

    return Scaffold(
      appBar: CustomAppBar.logo(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultPadding, vertical: 24.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 74.r,
                    height: 74.r,
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.search,
                        width: 18.r,
                        height: 18.r,
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
                        '모험 액티비티형',
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
                  Spacer(),
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
              color: AppColors.gray100,
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
                        Spacer(),
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
                    ),
                    Row(
                      children:
                          List.generate(myMonthlyBadge.length * 2 - 1, (index) {
                        if (index.isOdd) {
                          return SizedBox(width: 12.w); // 아이템 사이 간격
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
                                    child: SvgPicture.asset(
                                      IconPath.search,
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
            SizedBox(
              height: 18.h,
            ),
            //
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Column(
                children: [
                  //저장됨
                  GestureDetector(
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
                          Spacer(),
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
                  SizedBox(
                    height: 32.h,
                  ),
                  //앱 설정
                  Column(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 10.h),
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
                                Spacer(),
                                Switch(
                                  value: _isLocationEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _isLocationEnabled = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Text(
                              AppStrings.notificationSettings,
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Switch(
                              value: _isNotificationEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _isNotificationEnabled = value;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ],
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 10.h),
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
                                Spacer(),
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
                          print('고객센터 터치');
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
                              Spacer(),
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
                          print('서비스 터치');
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppStrings.termsOfService,
                                    style: context.textStyles.body1
                                        .copyWith(color: AppColors.gray400),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
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
                          print('개인정보 터치');
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
                              Spacer(),
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
                        print('로그아웃 터치');
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 10.h),
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
