import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../planner/presentation/viewmodels/planner_search_view_model.dart';
import '../viewmodels/recent_search_view_model.dart';
import 'search_list_tile.dart';

class AfterSearchWidget extends ConsumerStatefulWidget {
  final String searchQuery;
  const AfterSearchWidget({
    super.key,
    required this.searchQuery,
  });

  @override
  ConsumerState<AfterSearchWidget> createState() => _AfterSearchWidgetState();
}

class _AfterSearchWidgetState extends ConsumerState<AfterSearchWidget> {
  late final Debouncer _debouncer;
  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
    Future.microtask(() {
      ref.read(plannerSearchViewModelProvider.notifier).searchPlaces(widget.searchQuery);
    });
  }

  @override
  void didUpdateWidget(covariant AfterSearchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _debouncer.run(() {
        if (mounted) {
          ref.read(plannerSearchViewModelProvider.notifier).searchPlaces(widget.searchQuery);
        }
      });
    }
  }
  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannerSearchViewModelProvider);
    final recentSearchViewModel = ref.read(recentSearchViewModelProvider.notifier);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 18.h, horizontal: AppSizes.defaultPadding),
          child: Row(
            children: [
              SizedBox(width: AppSizes.iconSM, height: AppSizes.iconSM, child: Center(child: SvgPicture.asset(IconPath.search, width: 18.r, height: 18.r))),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  '"${widget.searchQuery}" 검색결과',
                  style: context.textStyles.body1.copyWith(color: AppColors.gray400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        if (state.status == UiStatus.loading)
           Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: Lottie.asset(AnimationPath.loading, repeat: true, width: 150.w)),
          )
        else if (state.status == UiStatus.error)
          Builder(
              builder: (context) {

                print('🚨 AfterSearchWidget 에러 발생: ${state.errorMessage}');

                // 2. 기존 에러 UI를 반환합니다.
                return Center(child: ErrorRetryWidget(
                  onPressed: () {
                    ref.read(plannerSearchViewModelProvider.notifier).searchPlaces(widget.searchQuery);
                  },
                ));
              }
          )
        else if (state.searchPlace == null || state.searchPlace!.content.isEmpty)
            const Center(child: Text('검색 결과가 없습니다.'))
          else
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: state.searchPlace?.content.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final place = state.searchPlace!.content[index];
                final placeId = place.id;
                return GestureDetector(
                  onTap: () {
                    recentSearchViewModel.addSearch(place.title);

                    context.push('${RoutePath.placeDetail}/$placeId',
                        extra: {
                          'contentId': place.contentId,
                          'contentTypeId': place.contentTypeId,
                        });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: PlaceListTile(
                      thumbnailImage: place.thumbnailImage ?? '',
                      title: place.title,
                      address: place.address.toString(),
                    isSaved: place.isSaved,
                    placeId: place.id,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 1.h, thickness: 1.h, color: AppColors.gray100);
              },
            ),
        SizedBox(height: 16.h),
      ],
    );
  }
}