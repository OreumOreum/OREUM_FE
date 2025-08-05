import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';

part 'folder_list_state.freezed.dart';

@freezed
class FolderListState with _$FolderListState {
  const factory FolderListState({
    @Default(UiStatus.idle) UiStatus status,
    @Default(UiStatus.idle) UiStatus buttonStatus,
    @Default('') String errorMessage,
    @Default([]) List<FolderResponse> folders,
  }) = _FolderListState;
}
