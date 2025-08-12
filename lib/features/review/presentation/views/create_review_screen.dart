import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/create_review_view_model.dart';
import 'package:oreum_fe/main.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';

enum ReviewType {
  place,
  course,
}

class CreateReviewScreen extends ConsumerStatefulWidget {
  final String id;
  final ReviewType? type;

  const CreateReviewScreen({super.key, required this.id, this.type});

  @override
  ConsumerState<CreateReviewScreen> createState() => _CreateReviewScreenState();

  factory CreateReviewScreen.place({
    required String id,
  }) =>
      CreateReviewScreen(
        id: id,
        type: ReviewType.place,
      );

  factory CreateReviewScreen.course({
    required String id,
  }) =>
      CreateReviewScreen(
        id: id,
        type: ReviewType.course,
      );
}

class _CreateReviewScreenState extends ConsumerState<CreateReviewScreen> {
  final TextEditingController _textController = TextEditingController();
  int _characterCount = 0;
  final int _maxCharacters = 300;
  double rate = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateCharacterCount);
  }

  @override
  void dispose() {
    _textController.removeListener(_updateCharacterCount);
    _textController.dispose();
    super.dispose();
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = _textController.text.length;
    });
  }

  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '한라산국립공원',
      'address': '제주특별자치도 제주시 1100로 2070-61',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '천지연폭포',
      'address': '제주특별자치도 서귀포시 천지동 667-7',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '카카오박물관',
      'address': '제주특별자치도 제주시 첨단로 242',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createReviewViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Column(
        children: [
          SizedBox(height: 56.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      mockPlace2[1]['thumbnailImage']!, // 첫 번째 이미지
                      height: 84.r,
                      width: 84.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    mockPlace2[1]['title']!,
                    style: context.textStyles.headLine4
                        .copyWith(color: AppColors.gray500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    mockPlace2[1]['address']!,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray400),
                  ),
                  SizedBox(height: 24.h),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 27.w,
                    itemPadding: EdgeInsets.symmetric(horizontal: 6.w),
                    itemBuilder: (context, _) =>
                        SvgPicture.asset(
                          IconPath.star,
                        ),
                    unratedColor: AppColors.gray200,
                    onRatingUpdate: (rating) {
                      rate = rating;
                      },
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Divider(height: 2.h, color: AppColors.gray100),
          SizedBox(height: 56.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 18.w),
              Text(
                AppStrings.writeReview,
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray500),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Container(
              width: double.infinity,
              height: 153.h,
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.gray100, // 배경색
              ),
              child: TextField(
                controller: _textController,
                maxLength: _maxCharacters,
                maxLines: null,
                expands: true,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '', // 기본 카운터 숨기기
                  hintText: AppStrings.writeDetailReview,
                  hintStyle: context.textStyles.body2
                      .copyWith(color: AppColors.gray200),
                ),
                style:
                context.textStyles.body2.copyWith(color: AppColors.gray400),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$_characterCount자 / $_maxCharacters자',
                style: context.textStyles.caption1
                    .copyWith(color: AppColors.primary),
              ),
              SizedBox(width: 18.w)
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              height: 56.h,
              width: double.infinity,
              child: CustomElevatedButton.primary(
                  text: AppStrings.writeReviewButton,
                  onPressed: state.status == UiStatus.loading ? null : () async {
                    String content = _textController.text.trim();

                    if(rate == 0) {
                      CustomToast.showToast(context, '점수를 입력해주세요.', 56.h);
                    } else if (content.isEmpty) {
                      CustomToast.showToast(context, '리뷰 내용을 입력해주세요.', 56.h);
                    } else {
                      int id = int.parse(widget.id);

                      // 타입에 따라 분기
                      if (widget.type == ReviewType.place) {
                        await ref.read(createReviewViewModelProvider.notifier)
                            .createPlaceReview(id, rate, content);
                      } else if (widget.type == ReviewType.course) {
                        await ref.read(createReviewViewModelProvider.notifier)
                            .createCourseReview(id, rate, content);  // 이미 구현된 메서드!
                      }

                      final currentState = ref.read(createReviewViewModelProvider);
                      if(mounted && currentState.status == UiStatus.success) {
                        CustomToast.showToast(context, '리뷰가 작성되었습니다.', 56.h);
                        context.pop();
                      } else if (mounted && currentState.status == UiStatus.error) {
                        CustomToast.showToast(context, currentState.errorMessage ?? '리뷰 작성에 실패했습니다.', 56.h);
                      }
                    }
                  },
                  textStyle: context.textStyles.label3,
                  radius: AppSizes.radiusMD),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
