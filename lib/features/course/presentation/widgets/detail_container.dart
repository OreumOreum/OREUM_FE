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
import 'package:widget_to_marker/widget_to_marker.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/custom_toast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailContainer extends StatefulWidget {
  final TourResponse? tourData;
  final String? address;
  final bool isMapTabEnabled;
  final double? latitude;
  final double? longitude;
  final bool isCourseMode;

  const DetailContainer({
    super.key,
    this.tourData,
    this.address,
    this.isMapTabEnabled = true,
    this.longitude,
    this.latitude,
    this.isCourseMode = false,
  });

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  bool isExpanded = false;
  int selectedTabIndex = 0;
  GoogleMapController? _mapController;
  BitmapDescriptor? _markerIcon; // 마커 아이콘을 상태로 관리
  bool _isMarkerLoading = false;

  @override
  void initState() {
    super.initState();
    // 위젯 초기화 시 마커 아이콘 미리 로드
    _loadMarkerIcon();
  }

  // 마커 아이콘 미리 로드
  Future<void> _loadMarkerIcon() async {
    if (_markerIcon != null) return; // 이미 로드됨

    setState(() {
      _isMarkerLoading = true;
    });

    try {
      _markerIcon = await SvgPicture.asset(
          IconPath.mapMarker,
          width: 36.w
      ).toBitmapDescriptor();
    } catch (e) {
      print('마커 아이콘 로드 실패: $e');
      // 기본 마커 사용
      _markerIcon = BitmapDescriptor.defaultMarker;
    }

    if (mounted) {
      setState(() {
        _isMarkerLoading = false;
      });
    }
  }

  // 주소 복사 함수
  void _copyAddressToClipboard() {
    if (widget.address != null && widget.address!.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: widget.address!));
      CustomToast.showToast(context, '주소가 복사되었습니다.', 56.h);
    } else {
      CustomToast.showToast(context, '복사할 주소가 없습니다.', 56.h);
    }
  }

// 지도 앱 열기 함수 에뮬문제라 안드에서 잘되나 확인
  void _openMap() async {
    if (widget.address != null && widget.address!.isNotEmpty) {
      try {
        // 주소를 URL 인코딩
        final encodedAddress = Uri.encodeComponent(widget.address!);

        // 구글맵 웹 URL 생성
        final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

        // URL 파싱
        final uri = Uri.parse(googleMapsUrl);

        // canLaunchUrl 체크 없이 바로 실행
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // 외부 브라우저 강제
        );

      } catch (e) {
        print('지도 열기 실패: $e');
        if (mounted) {
          CustomToast.showToast(context, '지도를 열 수 없습니다.', 56.h);
        }
      }
    } else {
      CustomToast.showToast(context, '주소 정보가 없습니다.', 56.h);
    }
  }

  final String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      { "color": "#f5f2e7" }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#4b4b4b" }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      { "color": "#ffffff" },
      { "weight": 2 }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#8edce6" }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#007d8f" }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      { "color": "#b5e3b2" }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#3f7d3a" }
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      { "color": "#ffffff" }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffd28d" }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#f5b45b" }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffeecd" }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffffff" }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      { "color": "#d8f0f0" }
    ]
  }
]
  ''';

  @override
  Widget build(BuildContext context) {
    if (widget.isCourseMode) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray100),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.w, 44.h, 0.w, 24.h), // 상단 패딩 추가
              child: _buildDetailContent(),
            ),
          ),

          Positioned(
            top: -19.h,
            left: 24.w,
            right: 24.w,
            child: Container(
              height: 38.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(19.r),
                border: Border.all(color: AppColors.gray100),
              ),
              child: Center(
                child: Text(
                  '상세정보',
                  style: context.textStyles.label3.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray100),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.w, 44.h, 0.w, 12.h),
            child: selectedTabIndex == 0
                ? _buildDetailContent()
                : _buildMapContent(), // 동기 메서드
          ),
        ),
        _buildTabHeader(),
      ],
    );
  }

  Widget _buildTabHeader() {
    return Positioned(
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
                    color: selectedTabIndex == 0
                        ? AppColors.white
                        : AppColors.gray100,
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Center(
                    child: Text(
                      '상세정보',
                      style: context.textStyles.body2.copyWith(
                        color: selectedTabIndex == 0
                            ? AppColors.primary
                            : AppColors.gray200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: widget.isMapTabEnabled
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTabIndex = 1;
                  });
                  // 지도 탭을 선택할 때 마커 로드 (지연 로딩)
                  if (_markerIcon == null && !_isMarkerLoading) {
                    _loadMarkerIcon();
                  }
                },
                child: Container(
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: selectedTabIndex == 1
                        ? AppColors.white
                        : AppColors.gray100,
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Center(
                    child: Text(
                      '지도',
                      style: context.textStyles.body2.copyWith(
                        color: selectedTabIndex == 1
                            ? AppColors.primary
                            : AppColors.gray200,
                      ),
                    ),
                  ),
                ),
              )
                  : IgnorePointer(
                child: Container(
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray100,
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Center(
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        '지도',
                        style: context.textStyles.body2.copyWith(
                          color: AppColors.gray200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailContent() {
    if (widget.tourData == null) {
      return _buildNoDataContent();
    }

    final formattedInfo = widget.tourData!.getFormattedInfo();
    final detailEntries = formattedInfo.entries.toList();

    if (detailEntries.isEmpty) {
      return _buildNoDataContent();
    }

    int maxItems = isExpanded ? detailEntries.length : 4;
    int itemCount =
    detailEntries.length > maxItems ? maxItems : detailEntries.length;

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

              bool isPhoneNumber = _isPhoneNumber(value);

              return Padding(
                padding: EdgeInsets.fromLTRB(24.w, 0.h, 0.w, 8.h),
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
        if (detailEntries.length > 4)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.gray300,
              ),
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

  // 🔥 지도 탭 내용 - 동기 방식
  Widget _buildMapContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
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
        ),
        SizedBox(height: 12.h),
        Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: _buildGoogleMap(), // 동기 메서드
        ),
        //이부분에 들어가야함
        Row(
          children: [
            // 주소복사 버튼
            Expanded(
              child: GestureDetector(
                onTap: () => _copyAddressToClipboard(),
                child: Container(
                  height: 47.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray100),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconPath.addressPaste, width: 10.w,),
                      SizedBox(width: 2.w),
                      Text(
                        '주소 복사',
                        style: context.textStyles.caption1.copyWith(
                          color: AppColors.gray200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 지도보기 버튼
            Expanded(
              child: GestureDetector(
                onTap: () => _openMap(),
                child: Container(
                  height: 47.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray100),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconPath.mapIcon, width: 11.w,),
                      SizedBox(width: 2.w),
                      Text(
                        '지도 보기',
                        style: context.textStyles.caption1.copyWith(
                          color: AppColors.gray200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGoogleMap() {
    // 위치 정보가 없으면 기본 UI 표시
    if (widget.latitude == null || widget.longitude == null) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_off,
                size: 32.w,
                color: AppColors.gray400,
              ),
              SizedBox(height: 8.h),
              Text(
                '위치 정보가 없습니다',
                style: context.textStyles.body2.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 실제 GoogleMap 위젯
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: GoogleMap(
        style: mapStyle,
        onMapCreated: (GoogleMapController controller) async {
          _mapController = controller;
          final position = LatLng(widget.latitude!, widget.longitude!);
          await controller.animateCamera(
            CameraUpdate.newLatLngZoom(position, 14.0),
          );
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude!, widget.longitude!),
          zoom: 16.0,
        ),
        markers: _markerIcon != null ? {
          Marker(
            markerId: MarkerId('place_location'),
            icon: _markerIcon!,
            position: LatLng(widget.latitude!, widget.longitude!),
            infoWindow: InfoWindow(
              title: '위치',
              snippet: widget.address ?? '주소 정보 없음',
            ),
          ),
        } : {},
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        liteModeEnabled: false,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        mapType: MapType.normal,
      ),
    );
  }

  bool _isPhoneNumber(String text) {
    final phoneRegex = RegExp(r'^[\d\-\(\)\+\s]+$');
    return phoneRegex.hasMatch(text) && text.length >= 8 && text.contains('-');
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    CustomToast.showToast(context, '전화번호가 복사되었습니다.', 56.h);
  }
}