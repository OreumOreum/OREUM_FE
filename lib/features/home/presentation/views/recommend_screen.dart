import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';

import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import '../viewmodels/recommend_view_model.dart';
import '../viewmodels/states/recommend_state.dart';

class RecommendScreen extends ConsumerStatefulWidget {
  final int contentTypeId;

  const RecommendScreen({
    super.key,
    required this.contentTypeId,
  });

  @override
  ConsumerState<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends ConsumerState<RecommendScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Future.microtask(() {
      ref
          .read(recommendViewModelProvider.notifier)
          .fetchPlaces(widget.contentTypeId);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 300) {
      // 다음 페이지 로딩 시에도 contentTypeId 전달
      ref
          .read(recommendViewModelProvider.notifier)
          .fetchNextPage(widget.contentTypeId);
    }
  }

  final List<LargeCategory> largeCategories = LargeCategory.values;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recommendViewModelProvider);
    final viewModel = ref.read(recommendViewModelProvider.notifier);
    final myTravelTypeLabel = state.myTravelType?.type ?? '';
    final categoryLabel = LargeCategory.values
        .firstWhere(
          (cat) =>
      cat.contentTypeId ==
          (state.selectedContentTypeId ?? widget.contentTypeId),
      orElse: () => LargeCategory.touristAttraction,
    )
        .label;

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: HomeTitleText(
                      title: AppStrings.typeRecommend(myTravelTypeLabel),
                      primaryText: myTravelTypeLabel,
                      subtitle: AppStrings.typePlaceRecommendation),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.defaultPadding, vertical: 16.h),
                  child: SearchBarButton(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                          children: List.generate(
                              largeCategories.length * 2 - 1, (index) {
                            if (index.isOdd) {
                              return SizedBox(width: 14.w);
                            } else {
                              final category = largeCategories[index ~/ 2];
                              final isSelected = state.selectedContentTypeId ==
                                  category.contentTypeId;

                              return GestureDetector(
                                onTap: () =>
                                    viewModel.setContentTypeId(
                                    category.contentTypeId),
                                behavior: HitTestBehavior.translucent,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.r),
                                      child: SvgPicture.asset(
                                        category.iconPath,
                                        width: category.iconWidth,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      category.label,
                                      style: context.textStyles.body2.copyWith(
                                        color: isSelected
                                            ? AppColors.primary
                                            : AppColors.gray400,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          })),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.viewAll,
                        style: context.textStyles.label3
                            .copyWith(color: AppColors.gray500),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '리뷰 좋은순',
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray300),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: Row(
                    children: [
                      _buildFilterButton(
                        context: context,
                        label: '전체',
                        isSelected: state.selectedFilter == RegionFilter.all,
                        onTap: () =>
                            viewModel.setFilter(
                                RegionFilter.all, state.selectedContentTypeId ??
                                widget.contentTypeId),
                      ),
                      SizedBox(width: 9.w),
                      _buildFilterButton(
                        context: context,
                        label: '제주시',
                        isSelected: state.selectedFilter == RegionFilter.jeju,
                        onTap: () =>
                            viewModel.setFilter(
                                RegionFilter.jeju,
                                state.selectedContentTypeId ??
                                    widget.contentTypeId),
                      ),
                      SizedBox(width: 9.w),
                      _buildFilterButton(
                        context: context,
                        label: '서귀포시',
                        isSelected:
                        state.selectedFilter == RegionFilter.seogwipo,
                        onTap: () =>
                            viewModel.setFilter(
                                RegionFilter.seogwipo,
                                state.selectedContentTypeId ??
                                    widget.contentTypeId),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
              ],
            ),
          ),
          if (state.status == UiStatus.loading && !state.isLoadingNextPage)
            const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()))
          else
            if (state.status == UiStatus.error)
              SliverFillRemaining(
                  child: Center(child: Text(state.errorMessage)))
            else
              if (state.filteredPlaces.isEmpty)
                const SliverFillRemaining(
                    child: Center(child: Text('표시할 장소가 없습니다.')))
              else
                SliverList.separated(
                  itemCount: state.filteredPlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    final place = state.filteredPlaces[index];
                    return PlaceListTile(
                        thumbnailImage: place.thumbnailImage ?? '',
                        title: place.title,
                        address: 'place.address');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: AppColors.gray100,
                    );
                  },
                ),
          if (state.isLoadingNextPage)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    Color color;
    Color textColor;
    String iconPath;

    if (isSelected) {
      textColor = Colors.white;
      if (label == '제주시') {
        color = AppColors.jeju;
        iconPath = IconPath.recommendJeju;
      } else if (label == '서귀포시') {
        color = AppColors.seogwipo;
        iconPath = IconPath.recommendSeogwipo;
      } else {
        color = AppColors.primary;
        iconPath = IconPath.recommendViewAll;
      }
    } else {
      color = AppColors.gray200;
      textColor = AppColors.gray400;
      if (label == '제주시') {
        iconPath = IconPath.recommendJeju;
      } else if (label == '서귀포시') {
        iconPath = IconPath.recommendSeogwipo;
      } else {
        iconPath = IconPath.recommendViewAll;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 12.r,
              height: 12.r,
              child: Center(
                child: SvgPicture.asset(iconPath,
                    width: 12.r,
                    height: 12.r,
                    colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn)),
              ),
            ),
            SizedBox(width: 4.w),
            Text(label,
                style: context.textStyles.body1.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}