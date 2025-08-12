import 'package:dio/dio.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/features/folder/data/repositories/folder_repository_impl.dart';
import 'package:oreum_fe/features/folder/data/services/folder_service.dart';
import 'package:oreum_fe/features/folder/domain/usecases/create_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/delete_folder_place_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/delete_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/edit_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/get_my_folder_places_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/get_my_folder_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_providers.g.dart';

@riverpod
FolderService folderService(FolderServiceRef ref) {
  final Dio dio = ref.watch(dioProvider);
  return FolderService(dio);
}

@riverpod
FolderRepositoryImpl folderRepositoryImpl(FolderRepositoryImplRef ref) {
  final FolderService folderService = ref.watch(folderServiceProvider);
  return FolderRepositoryImpl(folderService);
}

@riverpod
GetMyFolderUseCase getMyFolderUseCase(GetMyFolderUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return GetMyFolderUseCase(folderRepositoryImpl);
}

@riverpod
CreateMyFolderUseCase createMyFolderUseCase(CreateMyFolderUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return CreateMyFolderUseCase(folderRepositoryImpl);
}

@riverpod
GetMyFolderPlacesUseCase getMyFolderPlacesUseCase(GetMyFolderPlacesUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return GetMyFolderPlacesUseCase(folderRepositoryImpl);
}

@riverpod
EditMyFolderUseCase editMyFolderUseCase (EditMyFolderUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return EditMyFolderUseCase(folderRepositoryImpl);
}

@riverpod
DeleteMyFolderUseCase deleteMyFolderUseCase (DeleteMyFolderUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return DeleteMyFolderUseCase(folderRepositoryImpl);
}

@riverpod
DeleteFolderPlaceUseCase deleteFolderPlaceUseCase (DeleteFolderPlaceUseCaseRef ref) {
  final FolderRepositoryImpl folderRepositoryImpl = ref.watch(folderRepositoryImplProvider);
  return DeleteFolderPlaceUseCase(folderRepositoryImpl);
}