import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';
import 'package:oreum_fe/features/review/data/models/my_review_response.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/my_review_view_model.dart';
import 'package:oreum_fe/main.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/review/presentation/widgets/my_review_list_tile.dart';

import '../../../../core/constants/ui_status.dart';

class MyReviewScreen extends ConsumerStatefulWidget {
  const MyReviewScreen({super.key});

  @override
  ConsumerState<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends ConsumerState<MyReviewScreen> {

  final List<Map<String, String>> mockReview2 = [
    {
      'type': '김녕해수욕장',
      'date': '2025.06.26',
      'content':
      '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '김녕해수욕장',
      'date': '2025.06.26',
      'content':
      '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '김녕해수욕장',
      'date': '2025.06.26',
      'content':
      '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '김녕해수욕장',
      'date': '2025.06.26',
      'content':
      '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(myReviewViewModelProvider.notifier)
          .initializeMyReview();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myReviewViewModelProvider);

    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: const Center(
          child: CircularProgressIndicator(), //로티
        ),
      );
    }

    if (state.status == UiStatus.error) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: Center(
          child: Text('error: ${state.errorMessage}'),
        ),
      );
    }

    List<MyReviewResponse> myReviews = state.myReviews!;

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppStrings.myReview,
                        style: context.textStyles.label3
                            .copyWith(color: AppColors.gray500),),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(height: 1.h, color: AppColors.gray100),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: myReviews.length,
              itemBuilder: (BuildContext context, int index) {
                String type = mockReview2[index]['type']!; //이부분 수정해야함
                String date = myReviews[index].updatedAt.toString();
                String content =
                myReviews[index].content.toString();
                double rating = myReviews[index].rate;
                return MyReviewListTile(
                    type: type,
                    date: date,
                    content: content,
                    rating: rating);
              },
            ),
            SizedBox(height: 16.h,)
          ],
        ),
      ),
    );
  }
}
