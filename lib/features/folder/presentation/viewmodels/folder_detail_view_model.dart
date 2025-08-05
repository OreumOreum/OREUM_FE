import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/di/folder_providers.dart';
import 'package:oreum_fe/features/folder/domain/usecases/delete_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/edit_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/get_my_folder_places_use_case.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/states/folder_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_detail_view_model.g.dart';

@riverpod
class FolderDetailViewModel extends _$FolderDetailViewModel {
  @override
  FolderDetailState build() {
    return FolderDetailState(status: UiStatus.loading);
  }

  Future<void> getMyFolderPlaces(String folderId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetMyFolderPlacesUseCase getMyFolderPlacesUseCase = ref.read(getMyFolderPlacesUseCaseProvider);
      List<FolderDetailResponse> folderPlaces = await getMyFolderPlacesUseCase.call(folderId);
      state = state.copyWith(status: UiStatus.success, folderPlaces: folderPlaces);
    } catch (e) {
      logger.e(e.toString());
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> editMyFolder(String folderId, String name) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      EditMyFolderUseCase editMyFolderUseCase = ref.read(editMyFolderUseCaseProvider);
      FolderListViewModel folderListViewModel = ref.read(folderListViewModelProvider.notifier);
      await editMyFolderUseCase.call(folderId, name);
      await folderListViewModel.refreshFoldersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      logger.e(e.toString());
      state = state.copyWith(buttonStatus: UiStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> deleteMyFolder(String folderId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      DeleteMyFolderUseCase deleteMyFolderUseCase = ref.read(deleteMyFolderUseCaseProvider);
      FolderListViewModel folderListViewModel = ref.read(folderListViewModelProvider.notifier);
      await deleteMyFolderUseCase.call(folderId);
      await folderListViewModel.refreshFoldersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      logger.e(e.toString());
      state = state.copyWith(buttonStatus: UiStatus.error, errorMessage: e.toString());
    }
  }

  void initFolderName(String folderName) {
    state = state.copyWith(folderName: folderName);
  }

  void updateFolderName(String name) {
    state = state.copyWith(folderName: name);
  }
}
