import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_detail_list_tile.dart';

class FolderDetailScreen extends StatelessWidget {
  FolderDetailScreen({super.key});

  final List<Map<String, String>> mockFolderDetailList = [
    {
      'title': '모든 저장하기',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'title': '모든 저장하기',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'title': '모든 저장하기',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.backWithButtonAndText(
          title: '모든 저장하기',
          actionType: ActionType.dots,
          onActionPressed: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.gray100,
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
                  mockFolderDetailList.length,
                  (index) {
                    String title = mockFolderDetailList[index]['title']!;
                    String thumbnailImage =
                        mockFolderDetailList[index]['thumbnailImage']!;
                    return FolderDetailListTile(
                        title: title, thumbnailImage: thumbnailImage);
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
