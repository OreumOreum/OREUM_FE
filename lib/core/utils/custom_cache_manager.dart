import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager extends CacheManager {
  static const key = 'tourApiImage';

  static final CustomCacheManager _instance = CustomCacheManager._();
  factory CustomCacheManager() => _instance;

  CustomCacheManager._()
      : super(
    Config(
      key,
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );
}