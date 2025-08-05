import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class GetMyFolderPlacesUseCase{
  final FolderRepository _folderRepository;
  GetMyFolderPlacesUseCase(this._folderRepository);

  Future<List<FolderDetailResponse>> call(String folderId) async {
    List<FolderDetailResponse> folderPlaces = await _folderRepository.getMyFolderPlaces(folderId);
    return folderPlaces;
  }
}