import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/content_type_id.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/place/presentation/widgets/course_detail_list_tile.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_detail_view_model.dart';

class PlannerDetailTabScreen extends ConsumerWidget {
  final List<dynamic> places; // places 타입을 실제 모델로 변경하세요
  final int day;
  final String plannerId;
  final String plannerName;

  const PlannerDetailTabScreen({
    super.key,
    required this.places,
    required this.day,
    required this.plannerId,
    required this.plannerName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      SizedBox(
        height: 20.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
        child: Row(
          children: [
            Text(
              AppStrings.dayCourseInfo(day),
              style: context.textStyles.headLine4
                  .copyWith(color: AppColors.gray500),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                List<PlannerEditPlace> editPlaces = ref
                    .read(plannerDetailViewModelProvider.notifier)
                    .mapPlannerPlaceToEditPlace();
                context.push('${RoutePath.planner}/$plannerId/edit', extra: {
                  'plannerName': plannerName,
                  'editPlaces': editPlaces,
                  'initialDay': day-1,
                });
              },
              child: Text(
                AppStrings.edit,
                style:
                    context.textStyles.body1.copyWith(color: AppColors.gray400),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 14.h,
      ),
      Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (context, index) {
            final dynamic place = places[index];
            String placeId = place.placeId.toString();
            String contentId = place.contentId;
            String contentTypeId = place.contentTypeId;
            final contentType = ContentTypeId.fromContentTypeId(contentTypeId);
            String category = contentType?.label ?? '여행지';

            return InkWell(
              onTap: () {
                context.push('${RoutePath.placeDetail}/$placeId',
                    extra: {
                      'contentId': contentId,
                      'contentTypeId': contentTypeId
                    });
              },
              child: CourseDetailListTile(
                  totalItemCount: places.length,
                  title: place.placeTitle,
                  address: place.placeAddress,
                  category: category,
                  thumbnailImage: place.placeThumbnailImage,
                  index: index + 1),
            );
          },
          separatorBuilder: (context, index) {

            final place1 = places[index];
            final place2 = places[index + 1];

            final Distance distance = Distance();
            final double km = distance.as(
              LengthUnit.Kilometer,
              LatLng(place1.mapY!, place1.mapX!),
              LatLng(place2.mapY!, place2.mapX!),
            );

            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 2.h, horizontal: AppSizes.defaultPadding),
              child: Text(
                '${km.toStringAsFixed(1)}km',
                style: context.textStyles.label4.copyWith(color: AppColors.gray200),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
