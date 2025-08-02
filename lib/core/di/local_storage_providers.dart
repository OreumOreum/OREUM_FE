import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/storage/shared_preferences_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_providers.g.dart';

@Riverpod(keepAlive: true)
SecureStorageRepositoryImpl secureStorageRepository(SecureStorageRepositoryRef ref) {
  final secureStorage = const FlutterSecureStorage();
  return SecureStorageRepositoryImpl(secureStorage);
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('SharedPreferences not initialized');
}

@Riverpod(keepAlive: true)
SharedPreferencesRepositoryImpl sharedPreferencesRepository(SharedPreferencesRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesRepositoryImpl(prefs);
}