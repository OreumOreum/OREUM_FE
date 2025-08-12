import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_place_request.freezed.dart';
part 'folder_place_request.g.dart';

@freezed
class FolderPlaceRequest with _$FolderPlaceRequest {
  const factory FolderPlaceRequest({
    required int placeId,
}) = _FolderPlaceRequest;

  factory FolderPlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$FolderPlaceRequestFromJson(json);
}