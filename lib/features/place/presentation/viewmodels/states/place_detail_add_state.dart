import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/folder/data/models/folder_saved_response.dart';

part 'place_detail_add_state.freezed.dart';

@freezed
class PlaceDetailAddState with _$PlaceDetailAddState{
  const factory PlaceDetailAddState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default('') String errorMessage,
    @Default([]) List<FolderSavedResponse> folders,
  }) = _PlaceDetailAddState;
}