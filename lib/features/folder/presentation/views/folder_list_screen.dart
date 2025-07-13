import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
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
    return Scaffold(
      appBar: CustomAppBar.backWithButtonAndText(
        title: AppStrings.doSave,
        actionType: ActionType.plus,
        onActionPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              barrierColor: AppColors.barrier.withOpacity(0.6),
              builder: (context) {
                return FolderCreateModal();
              });
        },
      ),
      body: SingleChildScrollView(
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
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 9.w,
                mainAxisSpacing: 32.h,
                children: List.generate(
                  mockFolderList.length,
                  (index) {
                    String title = mockFolderList[index]['title']!;
                    List<String> thumbnailImages =
                        mockFolderList[index]['thumbnailImages']!;
                    return FolderListTile(
                        title: title, thumbnailImages: thumbnailImages);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
