import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/widgets/place_detail_add_bottom_sheet.dart';

import '../../../../core/constants/image_path.dart';
import '../../../../core/utils/custom_cache_manager.dart';

class PlaceListTile extends ConsumerStatefulWidget {
  final String thumbnailImage;
  final String title;
  final String address;
  final bool isSaved;
  final int placeId;
  final VoidCallback? onTap;
  final Function(int placeId, bool isSaved)? onBookmarkChanged; // 콜백 추가

  const PlaceListTile({
    super.key,
    required this.thumbnailImage,
    required this.title,
    required this.address,
    required this.isSaved,
    required this.placeId,
    this.onTap,
    this.onBookmarkChanged, // 콜백 추가
  });

  @override
  ConsumerState<PlaceListTile> createState() => _PlaceListTileState();
}

class _PlaceListTileState extends ConsumerState<PlaceListTile> {
  bool _isWaitingForModal = false;
  late bool _localIsSaved; // 로컬 상태 추가

  @override
  void initState() {
    super.initState();
    _localIsSaved = widget.isSaved; // 초기값 설정
  }

  @override
  void didUpdateWidget(PlaceListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 부모에서 전달된 값이 변경되면 로컬 상태도 업데이트
    if (oldWidget.isSaved != widget.isSaved) {
      _localIsSaved = widget.isSaved;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasImage = widget.thumbnailImage.isNotEmpty;

    // 상태 변화 리스닝
    ref.listen(placeDetailViewModelProvider, (previous, next) {
      print('상태 변화 감지: ${previous?.buttonStatus} -> ${next.buttonStatus}');

      if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.success) {
        print('모달 띄우기');
        _isWaitingForModal = false;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            showModalBottomSheet<bool>(
              context: context,
              useRootNavigator: true,
              builder: (context) {
                return PlaceDetailAddBottomSheet(
                  title: widget.title,
                  originImage: widget.thumbnailImage,
                  id: widget.placeId,
                );
              },
            );
          }
        });
      } else if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.error) {
        print('저장 실패');
        _isWaitingForModal = false;

        if (mounted) {
          CustomToast.showToast(context, '저장을 실패하였습니다.', 56.h);
        }
      }
    });

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: AppSizes.defaultPadding,
        ),
        child: Row(
          children: [
            hasImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                    child: CachedNetworkImage(
                      cacheManager: CustomCacheManager(),
                      imageUrl: widget.thumbnailImage,
                      height: 64.r,
                      width: 64.r,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 64.r,
                        width: 64.r,
                        color: AppColors.gray100,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.gray300),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 64.r,
                        width: 64.r,
                        color: AppColors.gray100,
                        child: Center(
                          child: Image.asset(
                            ImagePath.imageError,
                            width: 32.r,
                          ),
                        ),
                      ),
                    ))
                : Container(
                    height: 64.r,
                    width: 64.r,
                    decoration: BoxDecoration(
                      color: AppColors.gray100,
                      borderRadius:
                          BorderRadius.circular(AppSizes.radiusXS), // 둥근 모서리 유지
                    ),
                    child: Center(
                      child: Image.asset(
                        ImagePath.imageError,
                        width: 32.r,
                      ),
                    ),
                  ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: context.textStyles.label1
                        .copyWith(color: AppColors.gray500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    widget.address,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              height: 24.r,
              width: 24.r,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () async {
                  if (_localIsSaved) {
                    // 삭제 로직 (기존과 동일)
                    await ref
                        .read(placeDetailViewModelProvider.notifier)
                        .deleteDefaultFolder(widget.placeId!);

                    final state = ref.read(placeDetailViewModelProvider);
                    if (context.mounted &&
                        state.buttonStatus == UiStatus.success) {
                      setState(() {
                        _localIsSaved = false;
                      });
                      widget.onBookmarkChanged?.call(widget.placeId!, false);
                      CustomToast.showToast(context, '내 폴더에서 삭제되었습니다.', 56.h);
                    } else if (context.mounted &&
                        state.buttonStatus == UiStatus.error) {
                      CustomToast.showToast(context, '삭제를 실패하였습니다.', 56.h);
                    }
                  } else {
                    // 🔥 저장 로직 - 즉시 UI 업데이트
                    print('저장 시작');


                    _isWaitingForModal = true; // 모달 대기 상태 설정

                    await ref
                        .read(placeDetailViewModelProvider.notifier)
                        .addDefaultFolder(widget.placeId);

                    setState(() {
                      _localIsSaved = true;
                    });
                    widget.onBookmarkChanged?.call(widget.placeId!, true);
                  }
                },
                icon: SvgPicture.asset(
                  _localIsSaved
                      ? IconPath.bookmarkFill
                      : IconPath.bookmarkOutline, // 로컬 상태 사용
                  width: 16.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
