import 'package:oreum_fe/core/storage/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepositoryImpl implements LocalStorageRepository {
  static const String _firstRunKey = 'FIRST_RUN';
  static const String _searchHistoryKey = 'SEARCH_HISTORY';
  final SharedPreferences _sharedPreferences;

  SharedPreferencesRepositoryImpl(this._sharedPreferences);

  @override
  Future<void> write(String key, String value) async =>
      await _sharedPreferences.setString(key, value);
  @override
  Future<String?> read(String key) async => _sharedPreferences.getString(key);
  @override
  Future<void> delete(String key) async => await _sharedPreferences.remove(key);

  Future<void> writeBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);
  Future<bool?> readBool(String key) async => _sharedPreferences.getBool(key);

  Future<void> setFirstRun(bool value) async => writeBool(_firstRunKey, value);
  Future<bool?> isFirstRun() async => readBool(_firstRunKey);
  Future<List<String>> getRecentSearches() async {
    return _sharedPreferences.getStringList(_searchHistoryKey) ?? [];
  }
  Future<void> setRecentSearches(List<String> searches) async {
    await _sharedPreferences.setStringList(_searchHistoryKey, searches);
  }
}
