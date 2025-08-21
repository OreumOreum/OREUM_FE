import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
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

import '../../../../core/constants/animation_path.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import '../../../../core/widgets/error_widget.dart';
import '../viewmodels/recommend_view_model.dart';
import '../viewmodels/states/recommend_state.dart';

class RecommendScreen extends ConsumerStatefulWidget {
  final int contentTypeId;
  final RegionFilter regionFilter;
  final bool type;

  const RecommendScreen({
    super.key,
    required this.contentTypeId,
    required this.regionFilter,
    required this.type,
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
          .fetchPlaces(widget.contentTypeId, widget.type, widget.regionFilter);
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
      final currentTypeId =
          ref.read(recommendViewModelProvider).selectedContentTypeId ??
              widget.contentTypeId;
      ref
          .read(recommendViewModelProvider.notifier)
          .fetchNextPage(currentTypeId, widget.type, widget.regionFilter);
    }
  }

  final List<LargeCategory> largeCategories = LargeCategory.values;

  void _showSortOptions(BuildContext context) {
    final viewModel = ref.read(recommendViewModelProvider.notifier);
    final currentState = ref.read(recommendViewModelProvider);
    final currentSortOption = currentState.selectedSortOption;
    final currentTypeId =
        currentState.selectedContentTypeId ?? widget.contentTypeId;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  viewModel.setSortOption(SortOption.review,
                      widget.regionFilter, currentTypeId, widget.type);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  child: Row(
                    children: [
                      Text(
                        '리뷰 좋은순',
                        style: context.textStyles.body1.copyWith(
                          color: currentSortOption == SortOption.review
                              ? AppColors.primary
                              : AppColors.gray500,
                        ),
                      ),
                      const Spacer(),
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
              InkWell(
                onTap: () {
                  viewModel.setSortOption(SortOption.DESC, widget.regionFilter,
                      currentTypeId, widget.type);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  child: Row(
                    children: [
                      Text(
                        '가나다순',
                        style: context.textStyles.body1.copyWith(
                          color: currentSortOption == SortOption.DESC
                              ? AppColors.primary
                              : AppColors.gray500,
                        ),
                      ),
                      const Spacer(),
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
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recommendViewModelProvider);
    final viewModel = ref.read(recommendViewModelProvider.notifier);
    final myTypeState = ref.read(myTravelTypeProvider);
    final myTravelType = myTypeState.myTravelType;
    final myTravelTypeLabel = myTravelType!.type;
    final sortLabel =
        state.selectedSortOption == SortOption.review ? '리뷰 좋은순' : '가나다순';
    final categoryLabel = LargeCategory.values
        .firstWhere(
          (cat) =>
              cat.contentTypeId ==
              (state.selectedContentTypeId ?? widget.contentTypeId),
          orElse: () => LargeCategory.touristAttraction,
        )
        .label;
    String titleText;
    String primaryText;
    if (widget.type == true) {
      titleText = AppStrings.typeRecommend(myTravelTypeLabel);
      primaryText = myTravelTypeLabel;
    } else {
      titleText = '전체 여행지를 추천해드려요';
      primaryText = '사람';
    }
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultPadding),
                    child: HomeTitleText(
                        title: titleText,
                        primaryText: primaryText,
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
                              onTap: () => viewModel.setContentTypeId(
                                  widget.regionFilter,
                                  category.contentTypeId,
                                  widget.type),
                              behavior: HitTestBehavior.translucent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 52.r,
                                    width: 52.r,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        category.iconPath,
                                        width: category.iconWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    category.label,
                                    style: context.textStyles.body2.copyWith(
                                      color: isSelected
                                          ? AppColors.gray500
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
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultPadding),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.viewAll,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray500),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => _showSortOptions(context),
                          child: Text(
                            sortLabel,
                            style: context.textStyles.body1
                                .copyWith(color: AppColors.gray300),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultPadding),
                    child: Row(
                      children: [
                        _buildFilterButton(
                          context: context,
                          label: '전체',
                          width: 12.r,
                          isSelected: state.selectedFilter == RegionFilter.all,
                          onTap: () => viewModel.setFilter(
                              RegionFilter.all,
                              state.selectedContentTypeId ??
                                  widget.contentTypeId,
                              widget.type),
                        ),
                        SizedBox(width: 9.w),
                        _buildFilterButton(
                          width: 18.r,
                          context: context,
                          label: '제주시',
                          isSelected: state.selectedFilter == RegionFilter.jeju,
                          onTap: () => viewModel.setFilter(
                              RegionFilter.jeju,
                              state.selectedContentTypeId ??
                                  widget.contentTypeId,
                              widget.type),
                        ),
                        SizedBox(width: 9.w),
                        _buildFilterButton(
                          width: 18.r,
                          context: context,
                          label: '서귀포시',
                          isSelected:
                              state.selectedFilter == RegionFilter.seogwipo,
                          onTap: () => viewModel.setFilter(
                              RegionFilter.seogwipo,
                              state.selectedContentTypeId ??
                                  widget.contentTypeId,
                              widget.type),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
            if (state.status == UiStatus.loading && !state.isLoadingNextPage)
              SliverFillRemaining(
                child: Center(
                  child: Lottie.asset(AnimationPath.loading,
                      repeat: true, width: 1000.w),
                ),
              )
            else if (state.status == UiStatus.error)
              Center(child: ErrorRetryWidget(
                onPressed: () {
                  ref.read(recommendViewModelProvider.notifier).fetchPlaces(
                      widget.contentTypeId, widget.type, widget.regionFilter);
                },
              ))
            else if (state.filteredPlaces.isEmpty)
              const SliverFillRemaining(
                  child: Center(child: Text('표시할 장소가 없습니다.')))
            else
              SliverList.separated(
                itemCount: state.filteredPlaces.length,
                itemBuilder: (BuildContext context, int index) {
                  final place = state.filteredPlaces[index];
                  final isSaved =
                      state.bookmarkStatusMap[place.placeId] ?? place.isSaved;
                  return PlaceListTile(
                    thumbnailImage: place.thumbnailImage ?? '',
                    title: place.title,
                    address: place.address ?? '',
                    isSaved: place.isSaved,
                    placeId: place.placeId,
                    onBookmarkChanged: (placeId, newStatus) {
                      viewModel.updateBookmarkStatus(placeId, newStatus);
                    },
                    onTap: () {
                      context.push(
                        '${RoutePath.placeDetail}/${place.placeId}',
                        extra: {
                          'contentId': place.contentId,
                          'contentTypeId': place.contentTypeId,
                        },
                      );
                    },
                  );
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Lottie.asset(AnimationPath.loading,
                        repeat: true, width: 1000.w),
                  ),
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required double width,
  }) {
    Color color;
    Color textColor;
    String iconPath;

    if (label == '제주시') {
      color = AppColors.jeju;
      iconPath = ImagePath.tangerine;
    } else if (label == '서귀포시') {
      color = AppColors.seogwipo;
      iconPath = ImagePath.mountain;
    } else {
      color = AppColors.primary;
      iconPath = ImagePath.all;
    }

    return Opacity(
      opacity: isSelected ? 1.0 : 0.5,
      child: GestureDetector(
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
              Center(
                child: Image.asset(
                  iconPath,
                  width: width,
                ),
              ),
              SizedBox(width: 4.w),
              Text(label,
                  style:
                  context.textStyles.body1.copyWith(color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
