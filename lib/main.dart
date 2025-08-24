import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'core/constants/icon_path.dart';
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
      // Lottie 애니메이션 프리로딩
      await _preloadLottieAssets();

      // SVG 아이콘들 프리로딩
      await _preloadSvgAssets();

      logger.i('preloadAssets End');
    } catch (e) {
      print('Asset preloading failed: $e');
      logger.e('preloadAssets Error: $e');
    }
  }

  Future<void> _preloadLottieAssets() async {
    try {
      // 로딩 애니메이션 프리로드
      await AssetLottie(AnimationPath.loading).load();

    } catch (e) {
      logger.e('Lottie preloading failed: $e');
    }
  }

  Future<void> _preloadSvgAssets() async {
    try {
      // 자주 사용되는 SVG 아이콘들 프리캐시
      final List<String> staticSvgPaths = [
        // 앱 아이콘
        IconPath.appIconSplash,
        IconPath.appIconAppBar,

        // 기본 아이콘들
        IconPath.backAppBar,
        IconPath.dots,
        IconPath.plus,
        IconPath.cancel,
        IconPath.search,
        IconPath.banner,

        // 소셜 로그인
        IconPath.kakao,
        IconPath.apple,
        IconPath.google,

        // 타입 테스트
        IconPath.typeTestUnselectedSM,

        // 배지 및 카테고리
        IconPath.lucky,
        IconPath.cloud,

        // 북마크 및 별점
        IconPath.bookmarkOutline,
        IconPath.bookmarkFill,
        IconPath.star,
        IconPath.star2,
        IconPath.travelCourse,

        // 시간 및 검색
        IconPath.clock,
        IconPath.searchCancel,
        IconPath.expand,
        IconPath.oreumStamp,
        IconPath.myLocation,

        // 스팟 관련
        IconPath.spotCheck,
        IconPath.spotCheckReverse,
        IconPath.spotUnCheckReverse,
        IconPath.spotTriangle,
        IconPath.spotUnCheckTriangle,
        IconPath.spotZoomCheck,
        IconPath.spotZoomUnCheck,
        IconPath.spotUncheck,
        IconPath.spotWarning,

        // 편집 및 관리
        IconPath.deleteSign,
        IconPath.arrowUpDown,
        IconPath.addCircle,
        IconPath.exclamationMarkCircle,
        IconPath.checkStar,

        // 추천 관련
        IconPath.recommendViewAll,
        IconPath.recommendJeju,
        IconPath.recommendSeogwipo,

        // 미디어 컨트롤
        IconPath.play,
        IconPath.pause,
        IconPath.arrowDown,
        IconPath.arrowRight,
        IconPath.monthSpot,
        IconPath.nature,

        // 네비게이션 바
        IconPath.homeActivate,
        IconPath.homeDisable,
        IconPath.plannerActivate,
        IconPath.plannerDisable,
        IconPath.folderActivate,
        IconPath.folderDisable,
        IconPath.settingActivate,
        IconPath.settingDisable,
        IconPath.addFolder,

        // 편집 도구
        IconPath.trashCan,
        IconPath.pencil,
        IconPath.divider,

        // 저장 관련
        IconPath.saveCheck,
        IconPath.savePlus,

        // 지도 및 위치
        IconPath.mapMarker,
        IconPath.addressPaste,
        IconPath.mapIcon,

        // 기타
        IconPath.copy,
        IconPath.checkBoxOn,
        IconPath.checkBoxOff,
        IconPath.arrowLink,
        IconPath.report,
      ];

      // 동적 아이콘들을 위한 별도 리스트 생성
      List<String> _getDynamicSvgPaths() {
        List<String> dynamicPaths = [];

        // typeTestStatus - 가능한 상태값들
        const typeTestStatuses = ['selected', 'unselected', 'values']; // 실제 사용되는 상태값들로 수정
        for (String status in typeTestStatuses) {
          dynamicPaths.add(IconPath.typeTestStatus(status));
        }

        // largeCategoryImage - 가능한 타입들
        const categoryTypes = [ 'default', 'restaurant', 'attractions', 'events', 'accommodation', 'shopping', 'culture', 'sports']; // 실제 사용되는 타입들로 수정
        for (String type in categoryTypes) {
          dynamicPaths.add(IconPath.largeCategoryImage(type));
        }

        // badge - 가능한 배지 이름들
        const badgeNames = ['jeju_1','jeju_2','jeju_3','jeju_4', 'jeju_5','jeju_6','jeju_7','jeju_8','jeju_9','jeju_10','jeju_11','jeju_12',
          'seogwipo_1','seogwipo_2','seogwipo_3','seogwipo_4', 'seogwipo_5','seogwipo_6','seogwipo_7','seogwipo_8','seogwipo_9','seogwipo_10','seogwipo_11','seogwipo_12']; // 실제 사용되는 배지 이름들로 수정
        for (String badgeName in badgeNames) {
          dynamicPaths.add(IconPath.badge(badgeName));
        }

        // weatherType - 가능한 날씨 타입들
        const weatherTypes = ['clear', 'cloudy', 'error', 'partly_cloudy','rain','rain_snow','snow']; // 실제 사용되는 날씨 타입들로 수정
        for (String weather in weatherTypes) {
          dynamicPaths.add(IconPath.weatherType(weather));
        }

        // flags - 가능한 국기들
        const flagTypes = ['attraction', 'culture', 'event', 'reports','restaurant','shopping','stay']; // 실제 사용되는 국기들로 수정
        for (String flag in flagTypes) {
          dynamicPaths.add(IconPath.flags(flag));
        }

        return dynamicPaths;
      }


      // 동적 SVG 경로들
      final List<String> dynamicSvgPaths = _getDynamicSvgPaths();

      // 모든 SVG 경로들 합치기
      final List<String> allSvgPaths = [...staticSvgPaths, ...dynamicSvgPaths];

      // SVG 파일들을 병렬로 프리로드
      await Future.wait(
        allSvgPaths.map((path) => _preloadSingleSvg(path)),
      );

    } catch (e) {
      logger.e('SVG preloading failed: $e');
    }
  }

  Future<void> _preloadSingleSvg(String assetPath) async {
    try {
      final loader = SvgAssetLoader(assetPath);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    } catch (e) {
      logger.w('Failed to preload SVG: $assetPath - $e');
    }
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

