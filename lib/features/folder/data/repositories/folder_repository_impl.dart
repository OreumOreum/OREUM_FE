import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/data/services/folder_service.dart';
import 'package:oreum_fe/features/folder/domain/repositories/folder_repository.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderService _folderService;
  FolderRepositoryImpl(this._folderService);

  @override
  Future<List<FolderResponse>> getMyFolders() {
    return _folderService.getMyFolders();
  }

  @override
  Future<void> createMyFolder(String name) {
    return _folderService.createMyFolder(name);
  }

  @override
  Future<void> editMyFolder(String folderId, String name) {
    return _folderService.editMyFolder(folderId, name);
  }

  @override
  Future<void> deleteMyFolder(String folderId) {
    return _folderService.deleteMyFolder(folderId);
  }

  @override
  Future<List<FolderDetailResponse>> getMyFolderPlaces(String folderId) {
    return _folderService.getMyFolderPlaces(folderId);
  }

  @override
  Future<void> deleteFolderPlace(String folderId, int placeId) {
    return _folderService.deleteFolderPlace(folderId, placeId);
  }

  @override
  Future<void> addDefaultFolder(int placeId) {
    return _folderService.addDefaultFolder(placeId);
  }
}