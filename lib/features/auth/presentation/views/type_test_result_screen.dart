import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/string_utils.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/guide_box.dart';

class TypeTestResultScreen extends StatelessWidget {
  final TravelType travelType;

  const TypeTestResultScreen({super.key, required this.travelType});

  @override
  Widget build(BuildContext context) {
    print('travelTypeImage: ${travelType.image}');
    return Scaffold(
      appBar: CustomAppBar.logoWithButton(
          buttonText: AppStrings.retry, onActionPressed: () {}),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 46.h,
                    ),
                    GuideBox(text: AppStrings.typeTestResultGuide),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      travelType.type,
                      style: context.textStyles.headLine1
                          .copyWith(color: AppColors.gray600),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      travelType.nickname,
                      style: context.textStyles.body2
                          .copyWith(color: AppColors.gray400),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    SvgPicture.asset(
                      travelType.image,
                      width: 114.w,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 74.w,
                      ),
                      child: Text(
                        StringUtils().wordBreaks(travelType.shortDescription),
                        style: context.textStyles.body2
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.w,
                      children: travelType.tags.map((tag) {
                        return Text(
                          '#$tag',
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.primary),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      StringUtils().wordBreaks(travelType.detailedDescription),
                      style: context.textStyles.body2
                          .copyWith(color: AppColors.gray300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: CustomElevatedButton.primary(
                  text: AppStrings.start,
                  onPressed: () {},
                  textStyle: context.textStyles.label3,
                  radius: AppSizes.radiusMD,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
