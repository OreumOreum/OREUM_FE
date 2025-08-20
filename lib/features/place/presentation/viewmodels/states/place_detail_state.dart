import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';
import 'package:oreum_fe/features/tour/data/models/tour_response.dart';

import '../../../../../core/constants/ui_status.dart';
import '../../../../home/data/models/place_response.dart';

part 'place_detail_state.freezed.dart';

@freezed
class PlaceDetailState with _$PlaceDetailState{
  const factory PlaceDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default('') String errorMessage,
    PlaceResponse? place,
    @Default([]) List<ReviewResponse> reviews,
    TourResponse? tour,
    @Default([]) List<Place> typePlaces,
  }) = _PlaceDetailState;
}