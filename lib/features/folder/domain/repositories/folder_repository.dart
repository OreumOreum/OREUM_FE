import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/data/models/folder_saved_response.dart';

abstract class FolderRepository {
  Future<List<FolderResponse>> getMyFolders();
  Future<void> createMyFolder(String name);
  Future<void> editMyFolder(String folderId, String name);
  Future<void> deleteMyFolder(String folderId);
  Future<List<FolderDetailResponse>> getMyFolderPlaces(String folderId);
  Future<void> deleteFolderPlace(String folderId, int placeId);
  Future<void> addDefaultFolder(int placeId);
  Future<void> deleteDefaultFolder(int placeId);
  Future<List<FolderSavedResponse>> getFolderSaved(int placeId);
  Future<void> addPlaceToFolder(String folderId, int placeId);
  Future<void> deletePlaceFromFolder(String folderId, int placeId);
}