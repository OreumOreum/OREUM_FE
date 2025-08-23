import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/create_review_view_model.dart';

import '../../../../core/constants/image_path.dart';
import '../../../../core/utils/custom_cache_manager.dart';

enum ReviewType {
  place,
  course,
}

class CreateReviewScreen extends ConsumerStatefulWidget {
  final String id;
  final String name;
  final String? address;
  final String? originImage;
  final ReviewType? type;


  const CreateReviewScreen({super.key, required this.id, required this.name, this.address, this.originImage, this.type,});

  @override
  ConsumerState<CreateReviewScreen> createState() => _CreateReviewScreenState();

  factory CreateReviewScreen.place({
    required String id, required String name, required String address, String? originImage,
  }) =>
      CreateReviewScreen(
        id: id,
        name: name,
        address: address,
        originImage: originImage,
        type: ReviewType.place,
      );

  factory CreateReviewScreen.course({
    required String id, required String name, String? originImage
  }) =>
      CreateReviewScreen(
        id: id,
        type: ReviewType.course,
        name: name,
        address: null,
        originImage: originImage,
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 56.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        cacheManager: CustomCacheManager(),
                        imageUrl: widget.originImage!,
                        height: 84.r,
                        width: 84.r,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          height: 84.r,
                          width: 84.r,
                          color: AppColors.gray100,
                          child: Center(
                            child: Image.asset(
                              ImagePath.imageError,
                              width: 52.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      widget.name,
                      style: context.textStyles.headLine4
                          .copyWith(color: AppColors.gray500),
                    ),
                    SizedBox(height: 2.h),
                    if (widget.address != null) ...[
                      SizedBox(height: 2.h),
                      Text(
                        widget.address!,
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray400),
                      ),
                    ],
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
      ),
    );
  }
}
