import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_response.freezed.dart';
part 'folder_response.g.dart';

@freezed
class FolderResponse with _$FolderResponse {
  const factory FolderResponse({
    required int folderId,
    required String folderName,
    List<String>? originImages,
    required bool isDefault,
  }) = _FolderResponse;

  factory FolderResponse.fromJson(Map<String, dynamic> json) =>
      _$FolderResponseFromJson(json);
}
