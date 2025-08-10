import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/detail_info_enum.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/features/tour/data/models/tour_response.dart';

import '../../../../core/widgets/custom_toast.dart';

class DetailContainer extends StatefulWidget {
  final TourResponse? tourData;
  final String? address; // 지도에서 사용할 주소

  const DetailContainer({
    super.key,
    this.tourData,
    this.address,
  });

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  bool isExpanded = false;
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 기존 컨테이너
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray100),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 44.h, 10.w, 12.h),
            child: selectedTabIndex == 0 ? _buildDetailContent() : _buildMapContent(),
          ),
        ),

        // 일체형 탭바 오버레이
        Positioned(
          top: -19.h,
          left: 24.w,
          right: 24.w,
          child: Container(
            height: 38.h,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(19.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 0 ? AppColors.white : AppColors.gray100,
                        borderRadius: BorderRadius.circular(19.r),
                      ),
                      child: Center(
                        child: Text(
                          '상세정보',
                          style: context.textStyles.body2.copyWith(
                            color: selectedTabIndex == 0 ? AppColors.primary : AppColors.gray200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 1 ? AppColors.white : AppColors.gray100,
                        borderRadius: BorderRadius.circular(19.r),
                      ),
                      child: Center(
                        child: Text(
                          '지도',
                          style: context.textStyles.body2.copyWith(
                            color: selectedTabIndex == 1 ? AppColors.primary : AppColors.gray200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailContent() {
    if (widget.tourData == null) {
      return _buildNoDataContent();
    }

    // TourResponse에서 모든 데이터를 포맷팅해서 가져오기
    final formattedInfo = widget.tourData!.getFormattedInfo();
    final detailEntries = formattedInfo.entries.toList();

    if (detailEntries.isEmpty) {
      return _buildNoDataContent();
    }

    // 표시할 항목 수 계산 (확장 여부에 따라)
    int maxItems = isExpanded ? detailEntries.length : 4;
    int itemCount = detailEntries.length > maxItems ? maxItems : detailEntries.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final entry = detailEntries[index];
              final label = entry.key;
              final value = entry.value;

              // 전화번호 패턴 검사 (숫자와 하이픈으로 구성된 패턴)
              bool isPhoneNumber = _isPhoneNumber(value);

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: label.length > 5
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: context.textStyles.body2.copyWith(
                        color: AppColors.gray300,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            value,
                            style: context.textStyles.body2.copyWith(
                              color: AppColors.gray400,
                            ),
                          ),
                        ),
                        if (isPhoneNumber) ...[
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () => _copyToClipboard(value),
                            child: Text(
                              '복사',
                              style: context.textStyles.body2.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        label,
                        style: context.textStyles.body2.copyWith(
                          color: AppColors.gray300,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              value,
                              style: context.textStyles.body2.copyWith(
                                color: AppColors.gray400,
                              ),
                            ),
                          ),
                          if (isPhoneNumber) ...[
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () => _copyToClipboard(value),
                              child: Text(
                                '복사',
                                style: context.textStyles.body2.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // 확장/축소 버튼 (데이터가 4개보다 많을 때만 표시)
        if (detailEntries.length > 4)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.gray300,
            ),
          ),
      ],
    );
  }

  Widget _buildNoDataContent() {
    return Center(
      child: Text(
        '표시할 상세 정보가 없습니다.',
        style: context.textStyles.body2.copyWith(
          color: AppColors.gray300,
        ),
      ),
    );
  }

  Widget _buildMapContent() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '위치 안내',
              style: context.textStyles.body2.copyWith(
                color: AppColors.gray300,
              ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(
                widget.address ?? '주소 정보가 없습니다.',
                style: context.textStyles.body2.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map_outlined,
                  size: 48.w,
                  color: AppColors.gray400,
                ),
                SizedBox(height: 8.h),
                Text(
                  '지도 영역',
                  style: context.textStyles.body2.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 전화번호 패턴 검사 함수
  bool _isPhoneNumber(String text) {
    // 전화번호 패턴: 숫자와 하이픈으로 구성, 최소 8자 이상
    final phoneRegex = RegExp(r'^[\d\-\(\)\+\s]+$');
    return phoneRegex.hasMatch(text) && text.length >= 8 && text.contains('-');
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    CustomToast.showToast(context, '전화번호가 복사되었습니다.', 56.h);
  }
}