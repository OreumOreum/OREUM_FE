import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class AddPlaceToFolderUseCase {
  final FolderRepository _folderRepository;
  AddPlaceToFolderUseCase(this._folderRepository);

  Future<void> call(String folderId, int placeId) {
    return _folderRepository.addPlaceToFolder(folderId, placeId);
  }
}