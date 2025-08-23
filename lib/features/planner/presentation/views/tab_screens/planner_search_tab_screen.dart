import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_search_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/widgets/planner_search_list_tile.dart';

class PlannerSearchTabScreen extends ConsumerStatefulWidget {
  final String folderId;
  final int day;

  const PlannerSearchTabScreen(
      {super.key, required this.day, required this.folderId});

  @override
  ConsumerState createState() => _PlannerSearchTabScreenState();
}

class _PlannerSearchTabScreenState
    extends ConsumerState<PlannerSearchTabScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(folderDetailViewModelProvider.notifier)
          .getMyFolderPlaces(widget.folderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(plannerSearchViewModelProvider);
    final state = ref.watch(folderDetailViewModelProvider);
    if (state.status == UiStatus.loading) {
      return SizedBox.shrink();
    }

    if (state.status == UiStatus.error) {
      return Text('Error: ${state.errorMessage}');
    }

    List<FolderDetailResponse> folderPlaces = state.folderPlaces;

    logger.i(folderPlaces.toString());

    if (folderPlaces.isEmpty) {
      return Column(
        children: [
          SizedBox(height: 52.h,),
          Center(
            child: Text(
              '아직 관광지가 없습니다.',
              style: context.textStyles.headLine1
                  .copyWith(color: AppColors.gray300),
            ),
          ),
        ],
      );
    } else {
      return ListView.separated(
        itemCount: folderPlaces.length,
        itemBuilder: (BuildContext context, int index) {
          String title = folderPlaces[index].placeTitle;
          String? thumbnailImage =
              folderPlaces[index].originImage;
          String? address = folderPlaces[index].placeAddress;
          String placeId = folderPlaces[index].placeId.toString();
          String contentId = folderPlaces[index].contentId;
          String contentTypeId = folderPlaces[index].contentTypeId;
          return InkWell(
            onTap: () {
              context.push('${RoutePath.placeDetail}/$placeId',
                  extra: {
                    'contentId': contentId,
                    'contentTypeId': contentTypeId
                  });
            },
            child: PlannerSearchListTile(
              day: widget.day,
              placeId: placeId,
              title: title,
              address: address,
              thumbnailImage: thumbnailImage,
              contentTypeId: contentTypeId,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Divider(
                height: 1.h,
                thickness: 1.h,
                color: AppColors.gray100,
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          );
        },
      );
    }
  }
}
