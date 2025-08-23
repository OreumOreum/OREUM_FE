import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_saved_response.freezed.dart';
part 'folder_saved_response.g.dart';

@freezed
class FolderSavedResponse with _$FolderSavedResponse {
  const factory FolderSavedResponse({
    required int folderId,
    required String folderName,
    required bool isSaved,
  }) = _FolderSavedResponse;

  factory FolderSavedResponse.fromJson(Map<String, dynamic> json) =>
      _$FolderSavedResponseFromJson(json);
}