

import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/features/folder/data/models/folder_saved_response.dart';
import 'package:oreum_fe/features/folder/di/folder_providers.dart';
import 'package:oreum_fe/features/folder/domain/usecases/add_place_to_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/delete_place_from_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/get_folder_saved_use_case.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/states/place_detail_add_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/custom_logger.dart';
import '../../../folder/domain/usecases/create_my_folder_use_case.dart';

part 'place_detail_add_view_model.g.dart';

@riverpod
class PlaceDetailAddViewModel extends _$PlaceDetailAddViewModel {
  @override
  PlaceDetailAddState build() {
    return PlaceDetailAddState();
  }

  Future<void> initializeBottomSheet(int placeId) async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      // 2. 해당 장소가 저장된 폴더들 확인
      final GetFolderSavedUseCase getFolderSavedUseCase = ref.read(getFolderSavedUseCaseProvider);
      List<FolderSavedResponse> folders = await getFolderSavedUseCase.call(placeId);

      state = state.copyWith(
        status: UiStatus.success,
        folders: folders,
      );
    } catch (e) {
      state = state.copyWith(
          status: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }

  Future<void> refreshBottomSheetBackground(int placeId) async {
    try {
      final GetFolderSavedUseCase getFolderSavedUseCase = ref.read(getFolderSavedUseCaseProvider);
      List<FolderSavedResponse> folders = await getFolderSavedUseCase.call(placeId);

      state = state.copyWith(
        folders: folders,
      );
    } catch (e) {
      state = state.copyWith(
          status: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }

  Future<void> addPlaceToFolder(int placeId, int folderId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      final AddPlaceToFolderUseCase addPlaceToFolderUseCase = ref.read(addPlaceToFolderUseCaseProvider);
      await addPlaceToFolderUseCase.call(folderId.toString(), placeId);
      refreshBottomSheetBackground(placeId);
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }

  Future<void> deletePlaceFromFolder(int placeId, int folderId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      final DeletePlaceFromFolderUseCase deletePlaceFromFolderUseCase = ref.read(deletePlaceFromFolderUseCaseProvider);
      await deletePlaceFromFolderUseCase.call(folderId.toString(), placeId);
      refreshBottomSheetBackground(placeId);
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      state = state.copyWith(
          buttonStatus: UiStatus.error,
          errorMessage: e.toString()
      );
    }
  }

  Future<void> createMyFolderInPlaceDetail(String name, int placeId) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      CreateMyFolderUseCase createMyFolderUseCase = ref.read(createMyFolderUseCaseProvider);
      await createMyFolderUseCase.call(name);
      await refreshBottomSheetBackground(placeId);
      FolderListViewModel folderListViewModel = ref.read(folderListViewModelProvider.notifier);
      await folderListViewModel.refreshFoldersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      logger.e(e.toString());
      state = state.copyWith(buttonStatus: UiStatus.error);
    }
  }
}