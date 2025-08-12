import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class AddDefaultFolderUseCase {
  final FolderRepository _folderRepository;
  AddDefaultFolderUseCase(this._folderRepository);

  Future<void> call(int placeId) {
    return _folderRepository.addDefaultFolder(placeId);
  }
}