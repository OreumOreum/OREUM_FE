import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/core/widgets/name_editing_modal.dart';

enum PlaceListType {
  create,
  recommendation,
  iconButton,
  elevatedButton,
}

class PlannerListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onButtonPressed;
  final PlaceListType type;
  final VoidCallback? onPressed;

  const PlannerListTile(
      {super.key,
      required this.type,
      required this.title,
      required this.subTitle,
      this.onButtonPressed,
      this.onPressed});

  factory PlannerListTile.create() => PlannerListTile(
        type: PlaceListType.create,
        title: AppStrings.userCreatedCourseTileTitle,
        subTitle: AppStrings.userCreatedCourseTileSubTitle,
      );

  factory PlannerListTile.recommendation() => PlannerListTile(
        type: PlaceListType.recommendation,
        title: AppStrings.userRecommendationCourseTileTitle('모험 액티비티형'),
        subTitle: AppStrings.userRecommendationCourseTileSubTitle,
      );

  factory PlannerListTile.iconButton(
          {required String title,
          required String subTitle,
          required VoidCallback onPressed,
          required VoidCallback onButtonPressed}) =>
      PlannerListTile(
        type: PlaceListType.iconButton,
        title: title,
        subTitle: subTitle,
        onPressed: onPressed,
        onButtonPressed: onButtonPressed,
      );

  factory PlannerListTile.elevatedButton(
          {required String title,
          required String subTitle,
          required VoidCallback onPressed}) =>
      PlannerListTile(
        type: PlaceListType.elevatedButton,
        title: title,
        subTitle: subTitle,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case PlaceListType.create:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow200.withOpacity(0.25),
                  offset: Offset(0, 4.h),
                  blurRadius: 10.r,
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: AppSizes.defaultPadding,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.headLine4.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      subTitle,
                      style: context.textStyles.body1.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  height: 28.h,
                  width: 56.h,
                  child: CustomElevatedButton.primary(
                    text: AppStrings.create,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useRootNavigator: true,
                          builder: (context) {
                            return NameEditingModal.plannerCreate();
                          });
                    },
                    textStyle: context.textStyles.label4,
                    radius: AppSizes.radiusXS,
                  ),
                ),
              ],
            ),
          ),
        );
      case PlaceListType.recommendation:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow200.withOpacity(0.25),
                  offset: Offset(0, 4.h),
                  blurRadius: 10.r,
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: AppSizes.defaultPadding,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.headLine4.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      subTitle,
                      style: context.textStyles.body1.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  height: 28.h,
                  width: 56.h,
                  child: CustomElevatedButton.primary(
                    text: AppStrings.create,
                    onPressed: () {},
                    textStyle: context.textStyles.label4,
                    radius: AppSizes.radiusXS,
                  ),
                ),
              ],
            ),
          ),
        );
      case PlaceListType.iconButton:
        return InkWell(
          borderRadius: BorderRadius.circular(AppSizes.radiusXS),
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow200.withOpacity(0.25),
                    offset: Offset(0, 4.h),
                    blurRadius: 10.r,
                    spreadRadius: 0,
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: AppSizes.defaultPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.textStyles.headLine4.copyWith(
                            color: AppColors.gray500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          subTitle,
                          style: context.textStyles.body1.copyWith(
                            color: AppColors.gray400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    height: AppSizes.iconSM,
                    width: AppSizes.iconSM,
                    child: IconButton(
                      onPressed: onButtonPressed,
                      icon: SvgPicture.asset(
                        IconPath.dots,
                        width: 16.r,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      case PlaceListType.elevatedButton:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow200.withOpacity(0.25),
                  offset: Offset(0, 4.h),
                  blurRadius: 10.r,
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: AppSizes.defaultPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textStyles.headLine4.copyWith(
                          color: AppColors.gray500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        subTitle,
                        style: context.textStyles.body1.copyWith(
                          color: AppColors.gray400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  height: 28.h,
                  width: 56.w,
                  child: CustomElevatedButton.secondary(
                    text: AppStrings.select,
                    onPressed: onButtonPressed,
                    textStyle: context.textStyles.label4,
                    radius: AppSizes.radiusXS,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
