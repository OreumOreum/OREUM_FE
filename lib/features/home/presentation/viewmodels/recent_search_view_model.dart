import 'package:oreum_fe/core/di/local_storage_providers.dart'; // Provider import
import 'package:oreum_fe/core/storage/shared_preferences_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_search_view_model.g.dart';

@riverpod
class RecentSearchViewModel extends _$RecentSearchViewModel {
  late final SharedPreferencesRepositoryImpl _repository;

  @override
  List<String> build() {
    _repository = ref.watch(sharedPreferencesRepositoryProvider);
    _loadSearches();
    return [];
  }

  Future<void> _loadSearches() async {
    state = await _repository.getRecentSearches();
  }

  Future<void> addSearch(String term) async {
    final searches = await _repository.getRecentSearches();
    searches.remove(term);
    searches.insert(0, term);
    if (searches.length > 10) {
      searches.removeLast();
    }
    await _repository.setRecentSearches(searches);
    await _loadSearches();
  }

  Future<void> deleteSearch(String term) async {
    final searches = await _repository.getRecentSearches();
    searches.remove(term);
    await _repository.setRecentSearches(searches);
    await _loadSearches();
  }

  Future<void> deleteAll() async {
    await _repository.setRecentSearches([]);
    await _loadSearches();
  }
}