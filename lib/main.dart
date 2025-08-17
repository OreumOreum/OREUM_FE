import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/di/local_storage_providers.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/di/my_type_provider.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/themes/app_theme.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/login_notifier.dart';
import 'core/routes/app_router.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    initializeMapRenderer();
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: '.env');
  String kakaoAppKey = await dotenv.get('KAKAO_NATIVE_APP_KEY');
  String? accessToken = await SecureStorageRepositoryImpl(FlutterSecureStorage()).getAccessToken();
  print(await KakaoSdk.origin);
  logger.i('Token:${accessToken}');
  try {
    KakaoSdk.init(nativeAppKey: kakaoAppKey);
  } catch (e) {
    print('Kakao SDK 초기화 실패: $e');
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: MyApp(),
    ),
  );
}

Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type for Android platform.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
  Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
        completer.complete(initializedRenderer)));
  } else {
    completer.complete(null);
  }

  return completer.future;
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await _handleFirstRun();
      await _checkLoginAndUserType();
      await _preloadAssets();

    } catch (e) {
      print('App initialization failed: $e');
      ref.read(loginNotifierProvider).setLoggedOut();
    } finally {
      setState(() => _isInitialized = true);
      FlutterNativeSplash.remove();
    }
  }

  Future<void> _handleFirstRun() async {
    logger.i('handleFirstRun Start');
    final sharedPreferencesRepo = ref.read(sharedPreferencesRepositoryProvider);
    final secureStorageRepo = ref.read(secureStorageRepositoryProvider);

    final bool isFirstRun = await sharedPreferencesRepo.isFirstRun() ?? true;

    if (isFirstRun) {
      await secureStorageRepo.deleteAll();
      await sharedPreferencesRepo.setFirstRun(false);
    }
    logger.i('handleFirstRun End');
  }

  Future<void> _checkLoginAndUserType() async {
    logger.i('checkLoginAndUserType Start');
    final secureStorageRepo = ref.read(secureStorageRepositoryProvider);
    final loginNotifier = ref.read(loginNotifierProvider);
    final userTypeNotifier = ref.read(userTypeNotifierProvider);

    // 토큰 확인
    final String? accessToken = await secureStorageRepo.getAccessToken();

    if (accessToken != null) {
      loginNotifier.setLoggedIn();
      await userTypeNotifier.checkUserType(); // 이제 ref 사용 가능!
      if(userTypeNotifier.hasType == false){
        await ref.read(myTravelTypeProvider.notifier).getMyTravelType();
      }
    } else {
      loginNotifier.setLoggedOut();
    }
    logger.i('checkLoginAndUserType End');
  }

  Future<void> _preloadAssets() async {
    logger.i('preloadAssets Start');
    try {
      // SVG 프리로딩 등
      await AssetLottie(AnimationPath.loading).load();
    } catch (e) {
      print('Asset preloading failed: $e');
    }
    logger.i('preloadAssets End');
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter goRouter = ref.watch(appRouterProvider);

    if (!_isInitialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Lottie.asset(AnimationPath.loading),
          ),
        ),
      );
    }

    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    Size designSize =
        screenWidth > 600 ? const Size(768, 1024) : const Size(393, 852);
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.kThemeData,
        );
      },
    );
  }
}

