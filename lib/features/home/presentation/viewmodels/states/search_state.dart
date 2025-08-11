import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/features/home/data/models/place_response.dart';

import '../../../../../core/constants/ui_status.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(UiStatus.idle) UiStatus status,
    @Default('') String errorMessage,
    @Default([]) List<Place> searchResults,
    @Default('') String keyword,
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default(false) bool isLoadingNextPage,
  }) = _SearchState;
}