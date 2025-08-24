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
import 'package:oreum_fe/features/place/presentation/viewmodels/book_mark_notifier.dart';
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
    _localIsSaved = widget.isSaved;

    // 초기화를 initState에서 처리
    Future.microtask(() {
      if (mounted) {
        ref.read(bookmarkProvider.notifier).setBookmark(widget.placeId, widget.isSaved);
      }
    });
  }

  @override
  void didUpdateWidget(PlaceListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSaved != widget.isSaved) {
      _localIsSaved = widget.isSaved;
      // 외부 상태 변경시에만 업데이트
      Future.microtask(() {
        if (mounted) {
          ref.read(bookmarkProvider.notifier).setBookmark(widget.placeId, widget.isSaved);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final bool hasImage = widget.thumbnailImage.isNotEmpty;
    final bookMark = ref.read(bookmarkProvider.notifier);
    final bookmarkNotifier = ref.read(bookmarkProvider.notifier);
    final isSaved = ref.watch(
      bookmarkProvider.select((map) => map[widget.placeId] ?? false),
    );

    // 상태 변화 리스닝
    // _PlaceListTileState의 listen 부분 수정
    ref.listen(placeDetailViewModelProvider(widget.placeId.toString()),
        (previous, next) {
      print('상태 변화 감지: ${previous?.buttonStatus} -> ${next.buttonStatus}');

      if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.success) {
        print('모달 띄우기');
        _isWaitingForModal = false;

        // _PlaceListTileState의 listen 부분 수정
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (mounted) {
            final result = await showModalBottomSheet<bool>(
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

            // 🔥 바텀시트 결과 처리 개선
            if (result == false) {
              // 북마크가 삭제된 경우
              setState(() {
                _localIsSaved = false;
              });
              widget.onBookmarkChanged?.call(widget.placeId, false);
            } else if (result == true) {
              // 🔥 폴더 변경사항이 있는 경우 (저장 상태 확인)
              final currentState = ref.read(
                  placeDetailViewModelProvider(widget.placeId.toString()));
              final actualIsSaved =
                  currentState.place?.isSaved ?? _localIsSaved;

              if (_localIsSaved != actualIsSaved) {
                setState(() {
                  _localIsSaved = actualIsSaved;
                });
                widget.onBookmarkChanged?.call(widget.placeId, actualIsSaved);
              }
            } else if (result == null) {
              // 🔥 바깥쪽 터치로 닫힌 경우 - 현재 상태 유지
              // 별도의 상태 변경 없이 그대로 유지
              // (이미 북마크 버튼을 눌러서 저장된 상태이므로)
              print('바깥쪽 터치로 바텀시트 닫음 - 현재 상태 유지');
            }
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
                  if (isSaved) {
                    // 삭제 로직 (기존과 동일)
                    await ref
                        .read(placeDetailViewModelProvider(
                        widget.placeId.toString())
                        .notifier)
                        .deleteDefaultFolder(widget.placeId);

                    final state = ref.read(placeDetailViewModelProvider(
                        widget.placeId.toString()));
                    if (context.mounted &&
                        state.buttonStatus == UiStatus.success) {
                      setState(() {
                        bookmarkNotifier.toggleBookmark(widget.placeId);
                      });
                      CustomToast.showToast(context, '내 폴더에서 삭제되었습니다.', 56.h);
                    } else if (context.mounted &&
                        state.buttonStatus == UiStatus.error) {
                      CustomToast.showToast(context, '삭제를 실패하였습니다.', 56.h);
                    }
                  } else {
                    // 🔥 저장 로직 - 바텀시트 구현
                    print('저장 시작');

                    // 즉시 UI 업데이트 (북마크 상태 변경)
                    bookmarkNotifier.toggleBookmark(widget.placeId);

                    // API 호출
                    await ref
                        .read(placeDetailViewModelProvider(widget.placeId.toString()).notifier)
                        .addDefaultFolder(widget.placeId);

                    final state = ref.read(placeDetailViewModelProvider(widget.placeId.toString()));

                    if (context.mounted) {
                      if (state.buttonStatus == UiStatus.success) {
                        // 성공시 바텀시트 표시
                        final result = await showModalBottomSheet<bool>(
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

                        // 바텀시트 결과 처리
                        if (result == false) {
                          // 북마크가 삭제된 경우
                          bookmarkNotifier.toggleBookmark(widget.placeId); // 다시 false로
                          widget.onBookmarkChanged?.call(widget.placeId, false);
                        } else {
                          // 저장 완료 또는 폴더 변경
                          widget.onBookmarkChanged?.call(widget.placeId, true);
                        }
                      } else if (state.buttonStatus == UiStatus.error) {
                        // 실패시 북마크 상태 되돌리기
                        bookmarkNotifier.toggleBookmark(widget.placeId); // 다시 false로
                        CustomToast.showToast(context, '저장을 실패하였습니다.', 56.h);
                      }
                    }
                  }
                },
                icon: SvgPicture.asset(
                  isSaved
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
