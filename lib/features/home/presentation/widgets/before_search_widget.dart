import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/recent_search_view_model.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import 'recent_search_list_tile.dart';

class BeforeSearchWidget extends ConsumerWidget {
  final Function(String query) onSearch; // 검색어 탭 시 검색 실행을 위한 콜백

  const BeforeSearchWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentSearches = ref.watch(recentSearchViewModelProvider);
    final viewModel = ref.read(recentSearchViewModelProvider.notifier);

    return Column(
      children: [
        SizedBox(height: 18.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Row(
            children: [
              Text(AppStrings.recentSearch,
                  style: context.textStyles.label4.copyWith(color: AppColors.gray500)),
              const Spacer(),
              TextButton(
                onPressed: () {
                  viewModel.deleteAll();
                },
                child: Text(
                  AppStrings.deleteAll,
                  style: context.textStyles.body1.copyWith(color: AppColors.gray300),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),

        if (recentSearches.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Center(
              child: Text('최근 검색 기록이 없습니다.', style: TextStyle(color: AppColors.gray300)),
            ),
          )
        else
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
            itemCount: recentSearches.length,
            itemBuilder: (BuildContext context, int index) {
              final title = recentSearches[index];
              return RecentSearchListTile(
                title: title,
                onTap: () => onSearch(title),
                onDelete: () => viewModel.deleteSearch(title),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 16.h);
            },
          ),
        SizedBox(height: 16.h),
      ],
    );
  }
}