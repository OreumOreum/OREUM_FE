


  import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmarkProvider =
  StateNotifierProvider<BookmarkNotifier, Map<int, bool>>(
        (ref) => BookmarkNotifier(),
  );

  class BookmarkNotifier extends StateNotifier<Map<int, bool>> {
  BookmarkNotifier() : super({});

  void setBookmark(int placeId, bool isSaved) {
  state = {...state, placeId: isSaved};
  }

  void toggleBookmark(int placeId) {
  final current = state[placeId] ?? false;
  state = {...state, placeId: !current};
  }

  bool isBookmarked(int placeId) => state[placeId] ?? false;
  }
