import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/string_utils.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? thumbnailImage;
  final VoidCallback onPressed;

  const CourseCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.thumbnailImage,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final TextStyle label4 = context.textStyles.label4.copyWith(
      color: AppColors.gray600,
    );
    final TextStyle label3 = context.textStyles.label3.copyWith(
      color: AppColors.gray600,
    );
    return InkWell(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          AppSizes.radiusXS,
        ),
        topRight: Radius.circular(AppSizes.radiusXS),
      ),
      onTap: onPressed,
      child: SizedBox(
        width: 220.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              child: thumbnailImage == null
                  ? Container(
                      color: AppColors.gray200,
                      height: 220.r,
                      width: 220.r,
                    )
                  : Image.network(
                      thumbnailImage!,
                      width: 220.r,
                      height: 220.r,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final TextPainter textPainter = TextPainter(
                        text: TextSpan(
                          text: title,
                          style: label3,
                        ),
                        textDirection: TextDirection.ltr,
                        maxLines: 2,
                      )..layout(maxWidth: constraints.maxWidth);

                      final int lineCount =
                          textPainter.computeLineMetrics().length;
                      final TextStyle textStyle =
                          lineCount > 1 ? label4 : label3;

                      return Text(
                        StringUtils().wordBreaks(title),
                        style: textStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    subTitle,
                    style: context.textStyles.body2
                        .copyWith(color: AppColors.gray400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
