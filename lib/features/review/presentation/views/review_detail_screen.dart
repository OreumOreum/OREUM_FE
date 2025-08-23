import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/review_detail_view_model.dart';
import 'package:oreum_fe/features/review/presentation/views/create_review_screen.dart';
import 'package:oreum_fe/main.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/review/presentation/widgets/review_list_tile.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/utils/custom_cache_manager.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/throttler.dart';
import '../../../../core/widgets/error_widget.dart';

class ReviewDetailScreen extends ConsumerStatefulWidget {
  final String id;
  final ReviewType? type;
  final String name;
  final String address;
  final double rate;
  final String? originImage;
  final int reviewCount;

  ReviewDetailScreen(
      {super.key,
      required this.id,
      this.type,
      required this.name,
      required this.address,
      required this.rate,
      required this.originImage,
        required this.reviewCount});

  @override
  ConsumerState<ReviewDetailScreen> createState() => _ReviewDetailScreenState();

  factory ReviewDetailScreen.place({
    required String id,
    required String name,
    required String address,
    required double rate,
    required String? originImage,
    required int reviewCount,
  }) =>
      ReviewDetailScreen(
        id: id,
        type: ReviewType.place,
        name: name,
        address: address,
        rate: rate,
        originImage: originImage,
        reviewCount: reviewCount,
      );

  factory ReviewDetailScreen.course({
    required String id,
    required String name,
    required String address,
    required double rate,
    required String? originImage,
    required int reviewCount,
  }) =>
      ReviewDetailScreen(
        id: id,
        type: ReviewType.course,
        name: name,
        address: address,
        rate: rate,
        originImage: originImage,
        reviewCount: reviewCount,
      );
}

class _ReviewDetailScreenState extends ConsumerState<ReviewDetailScreen> {
  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'rating': '3',
      'reviewNumber': '97'
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
      'rating': '3',
      'reviewNumber': '97'
    },
  ];

  final List<Map<String, String>> mockReview = [
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
  ];
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Future.microtask(() {
      if (widget.type == ReviewType.place) {
        ref
            .read(reviewDetailViewModelProvider.notifier)
            .getInitialPlaceReviews(widget.id);
      } else if (widget.type == ReviewType.course) {
        ref
            .read(reviewDetailViewModelProvider.notifier)
            .getInitialCourseReviews(widget.id);
      }
    });
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollListener() {
    if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 200) {
      if (widget.type == ReviewType.place) {
        ref.read(reviewDetailViewModelProvider.notifier).loadNextPlacePage(widget.id);
      } else if (widget.type == ReviewType.course) {
         ref.read(reviewDetailViewModelProvider.notifier).loadNextCoursePage(widget.id);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewDetailViewModelProvider);

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
        body: ErrorRetryWidget(
          onPressed: () {
            if (widget.type == ReviewType.place) {
              ref.read(reviewDetailViewModelProvider.notifier)
                  .getInitialPlaceReviews(widget.id);
            } else if (widget.type == ReviewType.course) {
              ref.read(reviewDetailViewModelProvider.notifier)
                  .getInitialCourseReviews(widget.id);
            }
          },

        ),
      );
    }

    List<ReviewResponse> reviews = state.reviews;

    return Scaffold(
      appBar: CustomAppBar.back(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: widget.originImage == null
                              ? Container(color: AppColors.gray200, width: 84.r, height: 84.r)
                              : CachedNetworkImage(
                            cacheManager: CustomCacheManager(),
                            imageUrl: widget.originImage!,
                            height: 84.r,
                            width: 84.r,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              height: 84.r,
                              width: 84.r,
                              color: AppColors.gray100,
                              child: Center(child: Image.asset(ImagePath.imageError, width: 52.r)),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(widget.name, style: context.textStyles.headLine4.copyWith(color: AppColors.gray500)),
                        SizedBox(height: 2.h),
                        Text(widget.address, style: context.textStyles.body1.copyWith(color: AppColors.gray400)),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: widget.rate,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 27.w,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                              itemBuilder: (context, _) => SvgPicture.asset(IconPath.star),
                              unratedColor: AppColors.gray200,
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(width: 14.w),
                            Text(widget.rate.toStringAsFixed(1), style: context.textStyles.headLine1.copyWith(color: AppColors.gray500)),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(AppStrings.ratingNumber(widget.reviewCount), style: context.textStyles.body1.copyWith(color: AppColors.gray400)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Divider(height: 2.h, color: AppColors.gray100),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.travelerReview, style: context.textStyles.label3.copyWith(color: AppColors.gray500)),
                      TextButton(
                        onPressed: () async {
                          if (widget.type == ReviewType.place) {
                            // 장소 리뷰 작성 화면으로 이동
                            await context.push('${RoutePath.createPlaceReview}/${widget.id}',extra: {
                              'name': widget.name,
                              'address': widget.address,
                              'originImage': widget.originImage
                            });

                            // 장소 리뷰 새로고침
                            if (mounted) {
                              await ref
                                  .read(reviewDetailViewModelProvider.notifier)
                                  .refreshReviewsBackground(widget.id, '0', '20');
                            }
                          } else if (widget.type == ReviewType.course) {
                            // 코스 리뷰 작성 화면으로 이동
                            await context.push('${RoutePath.createCourseReview}/${widget.id}',extra: {
                              'name': widget.name,
                              'originImage': widget.originImage
                            });

                            // 코스 리뷰 새로고침
                            if (mounted) {
                              await ref
                                  .read(reviewDetailViewModelProvider.notifier)
                                  .refreshCourseReviewsBackground(widget.id, '0', '20');
                            }
                          }
                        },
                        child: Text(
                          AppStrings.doReview,
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(height: 1.h, color: AppColors.gray100),
                SizedBox(height: 6.h),
              ],
            ),
          ),

          SliverList.builder(
            itemCount: state.reviews.length,
            itemBuilder: (BuildContext context, int index) {
              final review = state.reviews[index];
              return ReviewListTile(
                type: review.type ?? '타입 없음',
                date: review.createdAt.toString().split(' ')[0],
                content: review.content,
                rating: review.rate,
                isMyReview: review.isMyReview,
              );
            },
          ),

          if (state.isLoadingNextPage)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Lottie.asset(AnimationPath.loading,
                      repeat: true, width: 1000.w),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
