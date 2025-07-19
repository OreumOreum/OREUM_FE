import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';

class DetailContainer extends StatefulWidget {
  final List<Map<String, String>> detailList;

  const DetailContainer({
    super.key,
    required this.detailList,
  });

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  bool isExpanded = false;
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray200),
            borderRadius: BorderRadius.circular(AppSizes.radiusXS),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 44.h, 10.w, 12.h),
            child: selectedTabIndex == 0 ? _buildDetailContent() : _buildMapContent(),
          ),
        ),

        Positioned(
          top: -19.h,
          left: 24.w,
          right: 24.w,
          child: Container(
            height: 38.h,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 0 ? AppColors.white : AppColors.gray100,
                        borderRadius: BorderRadius.circular(19.r),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.detailInfo,
                          style: context.textStyles.body2.copyWith(
                            color: selectedTabIndex == 0 ? AppColors.primary : AppColors.gray200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 1 ? AppColors.white : AppColors.gray100,
                        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.map,
                          style: context.textStyles.body2.copyWith(
                            color: selectedTabIndex == 1 ? AppColors.primary : AppColors.gray200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailContent() {
    int itemCount = isExpanded ? 5 : 4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              String detailText = widget.detailList[0]['detail${index + 1}']!;
              bool isPhoneNumber = detailText.contains(AppStrings.phoneNo);

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              detailText,
                              style: context.textStyles.body2.copyWith(
                                color: AppColors.gray400,
                              ),
                            ),
                          ),
                          if (isPhoneNumber) ...[
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () => _copyToClipboard('064-728-3988'),
                              child: Text(
                                AppStrings.copy,
                                style: context.textStyles.body2.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: SvgPicture.asset(
            isExpanded ? IconPath.arrowUp : IconPath.arrowDown,
            width: 13.w
          ),
        ),
      ],
    );
  }

  Widget _buildMapContent() {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.locationInfo,
              style: context.textStyles.body2.copyWith(
                  color: AppColors.gray300
              ),
            ),
            SizedBox(width: 18.w),
            Text('제주특별자치도 제주시 구좌읍 구좌해안로 237',
              style: context.textStyles.body2.copyWith(
                  color: AppColors.gray400
              ),
            ),
          ],
        ),

        Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(AppSizes.radiusXS),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map_outlined,
                  size: 48.w,
                  color: AppColors.gray400,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.copyPhoneNo),
        duration: Duration(seconds: 2),
      ),
    );
  }
}