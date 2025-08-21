import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_detail_response.freezed.dart';
part 'folder_detail_response.g.dart';

@freezed
class FolderDetailResponse with _$FolderDetailResponse {
  const factory FolderDetailResponse({
    required int folderPlaceId,
    required int FolderId,
    required int placeId,
    required String placeTitle,
    required String? placeAddress,
    required String? originImage,
    required String contentId,
    required String contentTypeId,
  }) = _FolderDetialResponse;

  factory FolderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$FolderDetailResponseFromJson(json);
}
