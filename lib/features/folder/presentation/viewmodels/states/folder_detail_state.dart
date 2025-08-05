import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';

part 'folder_detail_state.freezed.dart';

@freezed
class FolderDetailState with _$FolderDetailState {
  const factory FolderDetailState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default('') String errorMessage,
    @Default(List<FolderDetailResponse>) folderPlaces,
    String? folderName,
  }) = _FolderDetailState;
}

