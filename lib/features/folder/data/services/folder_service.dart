import 'package:dio/dio.dart';
import 'package:oreum_fe/core/constants/api_path.dart';
import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/data/models/folder_request.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';

class FolderService {
  final Dio _dio;
  FolderService(this._dio);

  ///TODO: 관광지 모든 저장됨이 아닌 폴더에 저장할때 디폴트 폴더에 저장하는 함수도 유즈케이스에서 호출

  Future<List<FolderResponse>> getMyFolders() async {
    Response response = await _dio.get(ApiPath.folder);

    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) => FolderResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }
  
  Future<void> createMyFolder(String name) async {
    await _dio.post(ApiPath.folder, data: FolderRequest(name: name).toJson());
  }

  Future<void> editMyFolder(String folderId, String name) async {
    await _dio.patch(ApiPath.folderDetail(folderId), data: FolderRequest(name: name).toJson());
  }

  Future<void> deleteMyFolder(String folderId) async {
    await _dio.delete(ApiPath.folderDetail(folderId));
  }

  Future<List<FolderDetailResponse>> getMyFolderPlaces(String folderId) async {
    Response response = await _dio.get(ApiPath.folderDetail(folderId));

    final List<dynamic> jsonList = response.data;

    return jsonList
        .map((json) => FolderDetailResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}