import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/debouncer.dart';
import 'package:oreum_fe/core/utils/throttler.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';
import 'package:oreum_fe/features/place/data/models/search_place_response.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_search_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/states/planner_search_state.dart';
import 'package:oreum_fe/features/planner/presentation/views/tab_screens/planner_search_tab_screen.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/custom_tab_bar.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_search_list_tile.dart';

class PlannerSearchScreen extends ConsumerStatefulWidget {
  final int day;

  const PlannerSearchScreen({super.key, required this.day});

  @override
  ConsumerState createState() => _PlannerSearchScreenState();
}

class _PlannerSearchScreenState extends ConsumerState<PlannerSearchScreen> {
  late final TextEditingController _textEditingController;
  late final Debouncer _debouncer;
  late final Throttler _throttler;
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.position.isScrollingNotifier.value) {
      FocusScope.of(context).unfocus();
    }

    _debouncer.run(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        final searchState = ref.read(plannerSearchViewModelProvider);

        if (searchState.isLastPage ||
            searchState.status == UiStatus.loading ||
            searchState.paginationStatus == UiStatus.loading) {
          return;
        }

        final keyword = searchState.keyword;
        if (keyword.isNotEmpty) {
          ref.read(plannerSearchViewModelProvider.notifier).loadNextPage();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _debouncer = Debouncer(delay: Duration(milliseconds: 300));
    _textEditingController = TextEditingController();

    String previousKeyword = '';

    _textEditingController.addListener(() {
      final keyword = _textEditingController.text;

      ///엔터 눌렀을때 리빌드 방지
      if (keyword == previousKeyword) return;

      previousKeyword = keyword;

      _debouncer.run(() {
        ref.read(plannerSearchViewModelProvider.notifier).searchPlaces(keyword);
      });
    });

    // _throttler = Throttler(duration: Duration(milliseconds: 300));
    // _scrollController.addListener(() {
    //   FocusScope.of(context).unfocus();
    //
    //   _throttler.run(() {
    //     if (_scrollController.position.pixels >=
    //         _scrollController.position.maxScrollExtent - 100) {
    //       final searchState = ref.read(plannerSearchViewModelProvider);
    //
    //       if (searchState.isLastPage ||
    //           searchState.status == UiStatus.loading ||
    //           searchState.paginationStatus == UiStatus.loading) {
    //         return;
    //       }
    //
    //       final keyword = searchState.keyword;
    //       if (keyword.isNotEmpty) {
    //         ref.read(plannerSearchViewModelProvider.notifier).loadNextPage();
    //       }
    //     }
    //   });
    // });
    _scrollController.addListener(_scrollListener);

    Future.microtask(() {
      ref.read(folderListViewModelProvider.notifier).getMyFolders();
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _textEditingController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(plannerSearchViewModelProvider);
    final folderState = ref.watch(folderListViewModelProvider);
    final folders = folderState.folders;

    final isSearching = searchState.isSearching;
    final searchPlaceItems = searchState.searchPlace?.content ?? [];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: Scaffold(
          appBar: CustomAppBar.backWithSearchBar(
            controller: _textEditingController,
          ),
          body: SafeArea(
            child: isSearching
                ? _buildSearchResultList(searchState, searchPlaceItems)
                : _buildTabView(folders),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultList(
      PlannerSearchState searchState, List<SearchPlaceItem> searchPlaceItems) {
    if (searchState.status == UiStatus.error) {
      return Center(
        child: Text('검색 에러: ${searchState.errorMessage}'),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 18.h, horizontal: AppSizes.defaultPadding),
          child: Row(
            children: [
              SizedBox(
                width: AppSizes.iconSM,
                height: AppSizes.iconSM,
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.search,
                    width: 18.r,
                    height: 18.r,
                  ),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                child: Text(
                  '"${_textEditingController.text}" 검색결과',
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.gray400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: searchPlaceItems.length,
            padding: EdgeInsets.only(bottom: 16.h),
            itemBuilder: (context, index) {
              final item = searchPlaceItems[index];
              String placeId = searchPlaceItems[index].id.toString();
              String contentId = searchPlaceItems[index].contentId;
              String contentTypeId = searchPlaceItems[index].contentTypeId;
              return InkWell(
                onTap: () {
                  context.push('${RoutePath.placeDetail}/$placeId', extra: {
                    'contentId': contentId,
                    'contentTypeId': contentTypeId
                  });
                },
                child: PlannerSearchListTile(
                  day: widget.day,
                  placeId: item.id.toString(),
                  title: item.title,
                  address: item.address,
                  thumbnailImage: item.thumbnailImage, contentTypeId: contentTypeId,
                ),
              );
            },
            separatorBuilder: (_, __) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Divider(
                height: 1.h,
                thickness: 1.h,
                color: AppColors.gray100,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabView(List folders) {
    return DefaultTabController(
      length: folders.length,
      child: Column(
        children: [
          SizedBox(
            height: 51.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTabBar(
                  tabs: folders
                      .map(
                        (folder) => Tab(
                          child: IntrinsicWidth(
                            // 내용에 따라 너비를 유동적으로 조절
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 122.w),
                              // 최대 너비만 제한
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Text(
                                  folder.folderName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style:
                                      context.textStyles.label4, // 스타일도 꼭 넣어주기
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: folders.map((folder) {
                return PlannerSearchTabScreen(
                  folderId: folder.folderId.toString(),
                  day: widget.day,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
