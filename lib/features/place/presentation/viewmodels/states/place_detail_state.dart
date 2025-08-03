import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';

import '../../../../../core/constants/ui_status.dart';

part 'place_detail_state.freezed.dart';

@freezed
class PlaceDetailState with _$PlaceDetailState{
  const factory PlaceDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    PlaceResponse? place,
  }) = _PlaceDetailState;
}