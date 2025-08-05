import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_request.freezed.dart';
part 'folder_request.g.dart';

@freezed
class FolderRequest with _$FolderRequest {
  const factory FolderRequest({
    required String name,
  }) = _FolderRequest;

  factory FolderRequest.fromJson(Map<String, dynamic> json) =>
      _$FolderRequestFromJson(json);
}
