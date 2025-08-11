import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/travel_type_selection.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/type_test_view_model.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/type_test_skip_list_tile.dart';

import '../../../../core/utils/custom_logger.dart';
import '../widgets/guide_box.dart';

class TypeTestSkipScreen extends ConsumerStatefulWidget {
  const TypeTestSkipScreen({super.key});

  @override
  ConsumerState<TypeTestSkipScreen> createState() => _TypeTestSkipScreenState();
}

class _TypeTestSkipScreenState extends ConsumerState<TypeTestSkipScreen> {

  @override
  Widget build(BuildContext context) {
    final selectedType = ref.watch(travelTypeSelectionProvider);
    final state = ref.watch(typeTestViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 44.h,
                      ),
                      GuideBox(text: AppStrings.typeTestGuide),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '오름오름을 시작하기 전\n유형을 선택해주세요.',
                        style: context.textStyles.headLine2
                            .copyWith(color: AppColors.gray600),
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: TravelType.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          TravelType travelType = TravelType.values[index];
                          final isSelected = selectedType == travelType;
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(travelTypeSelectionProvider.notifier)
                                  .select(travelType);
                            },
                            child: TypeTestSkipListTile(
                              title: travelType.type,
                              tags: travelType.tags,
                              nickName: travelType.nickname,
                              isSelected: isSelected,
                            ),
                          );
                        },
                        separatorBuilder: (index, context) {
                          return SizedBox(
                            height: 14.h,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16.h,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 56.h,
                  child: CustomElevatedButton(
                      text: ('유형 선택하기'),
                      onPressed: selectedType == null ||
                              state.status == UiStatus.loading
                          ? null
                          : () async {
                        try {
                          await ref
                              .read(typeTestViewModelProvider.notifier)
                              .submitTypeTestResult(selectedType.name);
                          ref.read(typeTestViewModelProvider);
                          final state = ref.watch(typeTestViewModelProvider);
                          if(mounted && state.status == UiStatus.success) {
                            context.go(RoutePath.home);
                          }
                        } catch (e) {
                          // 에러 처리
                          logger.e('Error: $e');
                        }
                      },
                      textStyle: context.textStyles.label3,
                      radius: AppSizes.radiusMD),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
