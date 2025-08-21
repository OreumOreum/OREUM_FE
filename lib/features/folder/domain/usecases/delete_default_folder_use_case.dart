import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class DeleteDefaultFolderUseCase {
  final FolderRepository _folderRepository;
  DeleteDefaultFolderUseCase(this._folderRepository);

  Future<void> call(int placeId) {
    return _folderRepository.deleteDefaultFolder(placeId);
  }
}