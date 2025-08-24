import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/di/folder_providers.dart';
import 'package:oreum_fe/features/folder/domain/usecases/create_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/domain/usecases/get_my_folder_use_case.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/states/folder_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_list_view_model.g.dart';

@riverpod
class FolderListViewModel extends _$FolderListViewModel {
  @override
  FolderListState build() {
    return FolderListState(status: UiStatus.loading);
  }

  Future<void> getMyFolders() async {
    state = state.copyWith(status: UiStatus.loading);
    try {
      GetMyFolderUseCase getMyFolderUseCase = ref.read(getMyFolderUseCaseProvider);
      List<FolderResponse> folders = await getMyFolderUseCase.call();
      folders = _moveDefaultToFront(folders);
      state = state.copyWith(status: UiStatus.success, folders: folders);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error, errorMessage: e.toString());
      print(e.toString());
    }
  }

  Future<void> createMyFolder(String name) async {
    state = state.copyWith(buttonStatus: UiStatus.loading);
    try {
      CreateMyFolderUseCase createMyFolderUseCase = ref.read(createMyFolderUseCaseProvider);
      await createMyFolderUseCase.call(name);
      await refreshFoldersInBackground();
      state = state.copyWith(buttonStatus: UiStatus.success);
    } catch (e) {
      logger.e(e.toString());
      state = state.copyWith(buttonStatus: UiStatus.error);
    }
  }

  Future<void> refreshFoldersInBackground() async {
    try {
      GetMyFolderUseCase getMyFolderUseCase = ref.read(getMyFolderUseCaseProvider);
      List<FolderResponse> folders = await getMyFolderUseCase.call();
      folders = _moveDefaultToFront(folders);
      state = state.copyWith(folders: folders);
    } catch (e) {
      state = state.copyWith(status: UiStatus.error);
    }
  }

  List<FolderResponse> _moveDefaultToFront(List<FolderResponse> folders) {
    final index = folders.indexWhere((f) => f.isDefault);
    if (index > 0) {
      final defaultFolder = folders.removeAt(index);
      folders.insert(0, defaultFolder);
    }
    return folders;
  }
}
