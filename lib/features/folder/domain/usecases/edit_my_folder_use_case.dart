import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class EditMyFolderUseCase {
  final FolderRepository _folderRepository;
  EditMyFolderUseCase(this._folderRepository);

  Future<void> call(String folderId, String name) {
    return _folderRepository.editMyFolder(folderId, name);
  }
}