import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';

import '../../../../core/constants/icon_path.dart';

class PlaceDetailAddBottomSheet extends StatefulWidget {
  final String? originImage;
  final String title;
  final int id;

  PlaceDetailAddBottomSheet(
      {super.key,
      required this.originImage,
      required this.title,
      required this.id});

  @override
  State<PlaceDetailAddBottomSheet> createState() =>
      _PlaceDetailAddBottomSheetState();
}

class _PlaceDetailAddBottomSheetState extends State<PlaceDetailAddBottomSheet> {
  final List<Map<String, String>> mockData = [
    {
      'title': '성산일출봉',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
  ];

  final List<Map<String, String>> mockFolder = [
    {
      'title': '제주공항 부근 맛집',
    },
    {
      'title': '친구들이랑 놀만한 곳',
    },
  ];

  List<bool> folderSelectedStates = [false, false];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLG)),
        ),
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h),
                        Container(
                          width: 42.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: AppColors.gray200,
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusXXS),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusXS),
                                child: Image.network(
                                  mockData[0]['thumbnailImage']!,
                                  height: 64.r,
                                  width: 64.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mockData[0]['title']!,
                                      style: context.textStyles.headLine4
                                          .copyWith(color: AppColors.gray500)),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(AppStrings.isSaved,
                                      style: context.textStyles.body1
                                          .copyWith(color: AppColors.gray300)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.bookmarkFill,
                                width: 16.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(height: 21.h),
            Divider(height: 1.h, color: AppColors.gray100),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.folder,
                          style: context.textStyles.headLine4
                              .copyWith(color: AppColors.gray500)),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.addFolderButtonText,
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.gray300),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.allSave,
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.gray400)),
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.saveCheck,
                            width: 14.w,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: mockFolder.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: index == mockFolder.length - 1 ? 0 : 20.h),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              folderSelectedStates[index] =
                                  !folderSelectedStates[index];
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(mockFolder[index]['title']!,
                                  style: context.textStyles.label4
                                      .copyWith(color: AppColors.gray400)),
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: Center(
                                  child: SvgPicture.asset(
                                    folderSelectedStates[index]
                                        ? IconPath.saveCheck
                                        : IconPath.savePlus,
                                    width: 12.w,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
