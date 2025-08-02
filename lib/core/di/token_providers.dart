import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreum_fe/core/di/local_storage_providers.dart';
import 'package:oreum_fe/core/utils/token_saver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_providers.g.dart';

@riverpod
TokenSaver tokenSaver(TokenSaverRef ref) {
  final secureRepo = ref.watch(secureStorageRepositoryProvider);
  return TokenSaver(secureRepo);
}