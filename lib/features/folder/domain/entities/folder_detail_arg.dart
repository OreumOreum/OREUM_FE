import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_detail_arg.freezed.dart';

@freezed
class FolderDetailArg with _$FolderDetailArg {
  const factory FolderDetailArg({
    required String folderName,
    required bool isDefault,
}) = _FolderDetailArg;
}