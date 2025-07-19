import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_create_modal.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_list_tile.dart';

class FolderListScreen extends StatelessWidget {
  FolderListScreen({super.key});

  List<Map<String, dynamic>> mockFolderList = [
    {
      'title': '모든 저장하기',
      'thumbnailImages': [
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      ]
    },
    {
      'title': '모든 저장하기',
      'thumbnailImages': [
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      ]
    },
    {
      'title': '모든 저장하기',
      'thumbnailImages': [
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      ]
    },
    {
      'title': '모든 저장하기',
      'thumbnailImages': [
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      ]
    },
    {
      'title': '모든 저장하기',
      'thumbnailImages': [
        'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            height: 1.h,
            thickness: 1.h,
            color: AppColors.gray100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16.h, horizontal: AppSizes.defaultPadding),
            child: SearchBarButton(),
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 9.w,
              mainAxisSpacing: 32.h,
              children: [
                InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radiusXS),
                  ),
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray100,
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusXS),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.addFolder,
                              width: 52.r,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text(
                          AppStrings.addPlan,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.gray300),
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  mockFolderList.length,
                  (index) {
                    String title = mockFolderList[index]['title']!;
                    List<String> thumbnailImages =
                        mockFolderList[index]['thumbnailImages']!;
                    return FolderListTile(
                      title: title,
                      thumbnailImages: thumbnailImages,
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 72.h,
          ),
        ],
      ),
    );
  }
}
