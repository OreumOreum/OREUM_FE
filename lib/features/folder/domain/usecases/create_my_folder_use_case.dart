import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class CreateMyFolderUseCase {
  final FolderRepository _folderRepository;
  CreateMyFolderUseCase(this._folderRepository);

  Future<void> call(String name) {
    return _folderRepository.createMyFolder(name);
  }
}