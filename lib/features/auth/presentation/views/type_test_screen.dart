import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/string_utils.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/type_test_view_model.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/custom_percent_indicatioer.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/guide_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

enum TypeTestButtonStatus {
  selected,
  unselected,
}

class TypeTestScreen extends ConsumerWidget {
  const TypeTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(typeTestProvider);
    final viewModel = ref.read(typeTestProvider.notifier);

    final currentQuestion = state.questions[state.currentIndex];

    return Scaffold(
      appBar: CustomAppBar.logoWithButton(
        buttonText: AppStrings.skip,
        onActionPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomPercentIndicatioer(
              percent: (state.currentIndex + 1) / state.questions.length,
              height: 2.h,
              backgroundColor: AppColors.gray100,
              progressColor: AppColors.primary,
              borderRadius: 8.r,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultPadding,
                ),
                child: Column(
                  children: [
                    // 상단 콘텐츠
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 44.h,
                          ),
                          Text(
                            'Q${state.currentIndex + 1}',
                            style: context.textStyles.headLine5
                                .copyWith(color: AppColors.primary),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          GuideBox(text: AppStrings.typeTestGuide),
                          SizedBox(
                            height: 14.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.w),
                            child: Text(
                              StringUtils().wordBreaks(currentQuestion .questionText),
                              textAlign: TextAlign.center,
                              style: context.textStyles.headLine1
                                  .copyWith(color: AppColors.gray600),
                            ),
                          ),
                          SizedBox(
                            height: 152.h,
                          ),
                          Wrap(
                            spacing: 20.w,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: List.generate(5, (index) {
                              final int score = index + 1;
                              final bool isSelected = currentQuestion .selectedScore == score;
                              final double size = (score == 3) ? 42.r : AppSizes.iconMD;
                              final String iconPath = isSelected
                                  ? IconPath.typeTestStatus(
                                  TypeTestButtonStatus.selected.name)
                                  : (score == 3
                                  ? IconPath.typeTestUnselectedSM
                                  : IconPath.typeTestStatus(
                                  TypeTestButtonStatus.unselected.name));

                              String? label;
                              if (score == 1) {
                                label = AppStrings.no;
                              } else if (score == 5) {
                                label = AppStrings.yes;
                              }

                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => viewModel.selectScore(score),
                                    child: SvgPicture.asset(
                                      iconPath,
                                      width: size,
                                      height: size,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                      height: 12.sp * 16 / 12,
                                      child: label != null
                                          ? Text(
                                        label,
                                        style: context.textStyles.caption2
                                            .copyWith(color: AppColors.gray300),
                                      )
                                          : null),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56.h,
                            child: CustomElevatedButton.secondary(
                                text: AppStrings.previous,
                                onPressed: () {
                                  if (state.currentIndex == 0) {
                                    context.pop();
                                  } else {
                                    viewModel.goPrev();
                                  }
                                },
                                textStyle: context.textStyles.label3),
                          ),
                        ),
                        SizedBox(
                          width: 21.w,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 56.h,
                            child: CustomElevatedButton.primary(
                                text: viewModel.isLastQuestion ? AppStrings.viewResult : AppStrings.next,
                                onPressed: viewModel.canGoNext ? () {
                                  if (viewModel.isLastQuestion) {
                                    final result = viewModel.calculateResult();
                                    context.go(RoutePath.typeTestResult, extra: result);
                                  } else {
                                    viewModel.goNext();
                                  }
                                } : null,
                                textStyle: context.textStyles.label3),
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
          ],
        ),
      ),
    );
  }
}