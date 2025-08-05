import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class GetMyFolderUseCase {
  final FolderRepository _folderRepository;

  GetMyFolderUseCase(this._folderRepository);

  Future<List<FolderResponse>> call() async {
    final List<FolderResponse> folders = await _folderRepository.getMyFolders();
    return folders;
  }
}
