import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/course/presentation/widgets/detail_container.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/widgets/course_detail_list_tile.dart';

import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {

  PlaceDetailScreen({super.key,
  });

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  bool isExpanded = false;

  final List<Map<String, String>> placeList = [
    {
      'title': '제주항 선터수',
      'address': '제주시 삼동 310-45',
      'image':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '김녕 해수욕장',
      'address': '제주시 구좌읍 김녕해안로 237',
      'image':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '삼지교',
      'address': '제주 서귀포시 삼성리 교회',
      'image':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '서귀포 올레시장',
      'address': '제주 서귀포시 서호동 340',
      'image':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
  ];

  final List<Map<String, String>> detailList = [
    {
      'detail1': '휴무일    연중무휴 ',
      'detail2': '이용시간   10:00~19:00',
      'detail3': '전화번호    064-728-3988',
      'detail4': '주차시설    가능',
      'detail5': '냄비유무    있음',
      'detail6':
      '하늘에서 바라본 모습이 한문 평(平) 자를 이룬 모양을 하고 있어 김녕이라고 불리는, 김녕마을에 있는 해수욕장이다. 거대한 너럭바위 용암 위에 모래가 쌓여 만들어졌으며, 성세기는 외세의 침하늘에서 바라본 모습이 한문 평(平) 자를 이룬 모양을 하고 있어 김녕이라고 불리는, 김녕마을에 있는 해수욕장이다. 거대한 너럭바위 용암 위에 모래가 쌓여 만들어졌으며, 성세기는 외세의 침'
    }
  ];

  final List<Map<String, String>> courseList = [
    {
      'title': '놀멍쉬멍 제주 바다 구경떠나기',
      'address': '제주시',
      'rating': '4.9',
      'reviewNumber': '97'
    },
  ];

  final List<String> courseImages = [
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
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

  final List<Map<String, String>> placeImages = [
    {
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(placeDetailViewModelProvider.notifier).initializePlaceDetail('1'); //일단 하드하게
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(placeDetailViewModelProvider);

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

    PlaceResponse place = state.place!;

    return Scaffold(
        appBar: CustomAppBar.back(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(images: courseImages),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(IconPath.nature),
                        SizedBox(width: 12.w),
                        SvgPicture.asset(IconPath.monthSpot),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(place.title,
                            style: context.textStyles.headLine3
                                .copyWith(color: AppColors.gray500)),
                        SizedBox(
                          height: 24.r,
                          width: 24.r,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              IconPath.bookmarkOutline,
                              width: 16.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(place.address,
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray400)),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        SvgPicture.asset(IconPath.star2),
                        SizedBox(width: 2.w),
                        Text(place.averageRate.toString(),
                            style: context.textStyles.caption1
                                .copyWith(color: AppColors.gray200)),
                        SizedBox(width: 2.w),
                        Text(place.reviewCount.toString(),
                            style: context.textStyles.caption1
                                .copyWith(color: AppColors.gray200))
                      ],
                    ),
                    SizedBox(height: 63.h),
                    DetailContainer(detailList: detailList),
                    SizedBox(height: 56.h),

                    ///여행지 소개 부분
                    Text(AppStrings.spotIntro,
                        style: context.textStyles.label3
                            .copyWith(color: AppColors.gray500)),
                    SizedBox(height: 8.h),
                    Text(
                      detailList[0]['detail6']!, //여기 바로 불러옴
                      style: context.textStyles.body2.copyWith(color: AppColors.gray400),
                      maxLines: isExpanded ? null : 3,
                      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),


                    SizedBox(height: 18.h),
                    Divider(height: 1.h, color: AppColors.gray100),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Text(
                                isExpanded ? '접기' : AppStrings.showMore,
                                style: context.textStyles.body1.copyWith(color: AppColors.gray200)
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 48.h),
                    //여기에 넣어야댐
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.travelerReview,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray500),
                        ),
                        Text(
                          AppStrings.doReview,
                          style: context.textStyles.label4
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 1.h, color: AppColors.gray100),
              SizedBox(height: 6.h),
              SizedBox(
                height: 390.h,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    String type = mockReview[index]['type']!;
                    String date = mockReview[index]['date']!;
                    String content =
                    mockReview[index]['content']!;
                    double rating = double.parse(mockReview[index]['rating']!);
                    return ReviewListTile(
                        type: type,
                        date: date,
                        content: content,
                        rating: rating);
                  },
                ),
              ),
              SizedBox(height: 8.h,),
              Divider(height: 1.h, color: AppColors.gray100),
              SizedBox(height: 18.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          '전체보기',
                          style: context.textStyles.body1.copyWith(color: AppColors.gray200)
                      )
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultPadding),
                      child: HomeTitleText(
                          title: AppStrings.travelSuggestionTitle,
                          primaryText: '모험 액티비티형',
                          subtitle: AppStrings.destinationRecommendToUser),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                        itemCount: placeImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          String thumbnailImage = placeImages[index]['thumbnailImage']!;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(AppSizes.radiusXS,),
                            child: Image.network(thumbnailImage, height: 120.h, width: 163.w, fit: BoxFit.cover),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 8.w,);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}