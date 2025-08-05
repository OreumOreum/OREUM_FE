import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class DeleteMyFolderUseCase{
  final FolderRepository _folderRepository;
  DeleteMyFolderUseCase(this._folderRepository);

  Future<void> call(String folderId) {
    return _folderRepository.deleteMyFolder(folderId);
  }
}