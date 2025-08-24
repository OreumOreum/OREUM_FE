import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/review/presentation/viewmodels/review_detail_view_model.dart';
import 'package:oreum_fe/features/review/presentation/widgets/report_review_bottom_sheet.dart';

import 'delete_review_bottom_sheet.dart';

class ReviewListTile extends ConsumerStatefulWidget {
  final String type;
  final String date;
  final String content;
  final double rating;
  final bool isMyReview;
  final int? reviewId;
  final VoidCallback? onReviewDeleted;

  const ReviewListTile({
    super.key,
    required this.type,
    required this.date,
    required this.content,
    required this.rating,
    required this.isMyReview,
    this.reviewId,
    this.onReviewDeleted,
  });

  @override
  ConsumerState<ReviewListTile> createState() => _ReviewListTileState();
}

class _ReviewListTileState extends ConsumerState<ReviewListTile> {
  bool _isWaitingForDelete = false;

  void _showDeleteReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: 128.h,
        child: DeleteReviewBottomSheet(
          reviewId: widget.reviewId!,
          onDeleteConfirm: () {
            _deleteReview();
          },
        ),
      ),
    );
  }

  void _showReportReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: 128.h,
        child: const ReportReviewBottomSheet(),
      ),
    );
  }

  Future<void> _deleteReview() async {
    if (widget.reviewId == null) return;

    _isWaitingForDelete = true;

    await ref
        .read(reviewDetailViewModelProvider.notifier)
        .deleteReview(widget.reviewId!);
  }

  @override
  Widget build(BuildContext context) {
    // 상태 변화 리스닝 (PlaceListTile 패턴 참고)
    ref.listen(reviewDetailViewModelProvider, (previous, next) {
      print('리뷰 삭제 상태 변화: ${previous?.buttonStatus} -> ${next.buttonStatus}');

      if (_isWaitingForDelete &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.success) {
        print('리뷰 삭제 성공');
        _isWaitingForDelete = false;

        if (mounted) {
          CustomToast.showToast(context, '리뷰가 삭제되었습니다.', 56.h);
          widget.onReviewDeleted?.call(); // 부모에게 삭제 알림
        }
      } else if (_isWaitingForDelete &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.error) {
        print('리뷰 삭제 실패');
        _isWaitingForDelete = false;

        if (mounted) {
          CustomToast.showToast(context, '리뷰 삭제를 실패하였습니다.', 56.h);
        }
      }
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: widget.rating,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 18.w,
                    itemBuilder: (context, _) => SvgPicture.asset(
                      IconPath.star2,
                    ),
                    unratedColor: AppColors.gray200,
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    widget.rating.toInt().toString(),
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.primary),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (widget.isMyReview) {
                    // 삭제 모달 호출
                    _showDeleteReviewBottomSheet(context);
                  } else {
                    // 신고 모달 호출
                    _showReportReviewBottomSheet(context);
                  }
                },
                child: SvgPicture.asset(IconPath.dots),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.isMyReview ? '내가 쓴 리뷰' : AppStrings.reviewName(widget.type),
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray500),
              ),
              SizedBox(width: 6.w),
              Text(
                AppStrings.reviewDate(widget.date),
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray200),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            widget.content,
            style: context.textStyles.body2.copyWith(color: AppColors.gray400),
          ),
          SizedBox(height: 8.h),
          Divider(height: 1.h, color: AppColors.gray100),
        ],
      ),
    );
  }
}