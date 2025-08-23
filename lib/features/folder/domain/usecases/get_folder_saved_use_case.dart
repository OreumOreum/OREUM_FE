import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/data/models/folder_saved_response.dart';
import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class GetFolderSavedUseCase {
  final FolderRepository _folderRepository;

  GetFolderSavedUseCase(this._folderRepository);

  Future<List<FolderSavedResponse>> call(int placeId) async {
    final List<FolderSavedResponse> folderSaved = await _folderRepository.getFolderSaved(placeId);
    return folderSaved;
  }
}
