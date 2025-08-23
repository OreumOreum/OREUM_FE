import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class DeletePlaceFromFolderUseCase {
  final FolderRepository _folderRepository;
  DeletePlaceFromFolderUseCase(this._folderRepository);

  Future<void> call(String folderId, int placeId) {
    return _folderRepository.deletePlaceFromFolder(folderId, placeId);
  }
}