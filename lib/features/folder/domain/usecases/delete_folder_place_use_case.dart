import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class DeleteFolderPlaceUseCase {
  final FolderRepository _folderRepository;
  DeleteFolderPlaceUseCase(this._folderRepository);

  Future<void> call(int folderId, int placeId) {
    return _folderRepository.deleteFolderPlace(folderId.toString(), placeId);
  }
}