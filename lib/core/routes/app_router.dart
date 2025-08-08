import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/di/local_storage_providers.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/core/di/login_notifier.dart';
import 'package:oreum_fe/core/di/user_type_notifier.dart';
import 'package:oreum_fe/core/storage/secure_storage_repository_impl.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/core/widgets/custom_scaffold.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_result_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_skip_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
import 'package:oreum_fe/features/course/presentation/views/travel_course_screen.dart';
import 'package:oreum_fe/features/folder/domain/entities/folder_detail_arg.dart';

import 'package:oreum_fe/features/folder/presentation/views/folder_detail_screen.dart';
import 'package:oreum_fe/features/folder/presentation/views/folder_list_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/home_screen.dart';
import 'package:oreum_fe/features/planner/data/models/planner_edit_place.dart';
import 'package:oreum_fe/features/planner/presentation/views/planner_detail_screen.dart';
import 'package:oreum_fe/features/planner/presentation/views/planner_edit_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/recommend_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/search_screen.dart';
import 'package:oreum_fe/features/planner/presentation/views/planner_list_screen.dart';
import 'package:oreum_fe/features/planner/presentation/views/planner_search_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/my_review_screen.dart';
import 'package:oreum_fe/features/setting/presentation/views/account_setting_screen.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_detail.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_map.dart';
import 'package:oreum_fe/features/setting/presentation/views/setting_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/create_review_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/review_detail_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/course/presentation/views/travel_spot_screen.dart';
import '../../features/setting/presentation/views/monthly_spot_ranking.dart';
import '../../features/spot/data/models/spot_month_response.dart';
import '../constants/monthly_spot.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final LoginNotifier loginNotifier = ref.watch(loginNotifierProvider);
  final userTypeNotifier = ref.watch(userTypeNotifierProvider);

  return GoRouter(
    initialLocation: _getInitialLocation(loginNotifier, userTypeNotifier),
    observers: [GoTransition.observer],
    refreshListenable: Listenable.merge([loginNotifier, userTypeNotifier]),
    redirect: (context, state) {
      final currentLoginState = loginNotifier.status;
      final hasUserType = userTypeNotifier.hasType;

      switch (currentLoginState) {
        case LoginState.initializing:
          return null;
        case LoginState.loggedIn:
          if (hasUserType == null) {
            return null;
          }
          if (state.matchedLocation == RoutePath.splash ||
              state.matchedLocation == RoutePath.auth) {
            logger.i(hasUserType);
            if (hasUserType == false) {
              return RoutePath.home;
            } else {
              return RoutePath.typeTestStart;
            }
          }
          return null;
        case LoginState.loggedOut:
          _handleLogout(ref);
          if (state.matchedLocation != RoutePath.auth) {
            return RoutePath.auth;
          }
          return null;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePath.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: RoutePath.typeTestStart,
        builder: (context, state) => const TypeTestStartScreen(),
      ),
      GoRoute(
        path: RoutePath.typeTest,
        builder: (context, state) => const TypeTestScreen(),
      ),
      GoRoute(path: RoutePath.typeTestSkip,
      builder: (context, state) => const TypeTestSkipScreen()),
      GoRoute(
        path: RoutePath.typeTestResult,
        builder: (context, state) {
          final TravelType travelType = state.extra as TravelType;
          return TypeTestResultScreen(travelType: travelType);
        },
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => CustomScaffold(
                navigationShell: navigationShell,
              ),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutePath.home,
                builder: (context, state) => HomeScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutePath.planner,
                builder: (context, state) => PlannerListScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutePath.folderList,
                builder: (context, state) => FolderListScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutePath.setting,
                builder: (context, state) => SettingScreen(),
              ),
            ])
          ]),
      GoRoute(
        path: '${RoutePath.planner}/edit',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final String plannerName = extra['plannerName'];
          final isRecommend = extra['isRecommend'];
          return PlannerEditScreen(
            isEdit: false,
            isRecommend: isRecommend,
            plannerName: plannerName,
          );
        },
        pageBuilder: GoTransitions.slide.toLeft.withFade.call,
      ),
      GoRoute(
        path: '${RoutePath.planner}/:id/edit',
        builder: (context, state) {
          final String idStr = state.pathParameters['id']!;
          final int id = int.parse(idStr);
          final extra = state.extra as Map<String, dynamic>;
          final String plannerName = extra['plannerName'];
          final List<PlannerEditPlace> editPlaces = extra['editPlaces'];
          final int initialDay = extra['initialDay'];
          return PlannerEditScreen(
            isRecommend: false,
            isEdit: true,
            plannerId: id,
            plannerName: plannerName,
            editPlaces: editPlaces,
            initialDay: initialDay,
          );
        },
        pageBuilder: GoTransitions.slide.toLeft.withFade.call,
      ),
      GoRoute(
        path: '${RoutePath.planner}/:id',
        builder: (context, state) {
          final String plannerId = state.pathParameters['id']!;
          final String plannerName = state.extra as String;
          return PlannerDetailScreen(
            plannerId: plannerId,
            plannerName: plannerName,
          );
        },
        pageBuilder: GoTransitions.slide.toLeft.withFade.call,
      ),
      GoRoute(
          path: RoutePath.plannerSearch,
          builder: (context, state) {
            final int day = state.extra as int;
            return PlannerSearchScreen(
              day: day,
            );
          }),
      GoRoute(
        path: RoutePath.recommend,
        builder: (context, state) => RecommendScreen(),
      ),
      GoRoute(
        path: RoutePath.createReview,
        builder: (context, state) => CreateReviewScreen(),
      ),
      GoRoute(
        path: RoutePath.reviewDetail,
        builder: (context, state) => ReviewDetailScreen(),
      ),
      GoRoute(
        path: RoutePath.travelCourse,
        builder: (context, state) => TravelCourseScreen(),
      ),
      GoRoute(
        path: RoutePath.search,
        builder: (context, state) => SearchScreen(),
      ),
      GoRoute(
        path: RoutePath.accountSetting,
        builder: (context, state) => AccountSettingScreen(),
      ),
      GoRoute(
        path: RoutePath.monthlySpot,
        builder: (context, state) => MonthlySpot(),
      ),
      GoRoute(
        path: RoutePath.monthlySpotDetail,
        builder: (context, state) {
          final Map<String, int> args = state.extra as Map<String, int>;

          final int year = args['year']!;
          final int month = args['month']!;

          return MonthlySpotDetail(year: year, month: month);
        },
      ),
      GoRoute(
        path: RoutePath.monthlySpotMap,
        builder: (context, state) {
          final Map<String, dynamic> args = state.extra as Map<String, dynamic>;

          final int year = args['year']!;
          final int month = args['month']!;
          final spots = args['spots'] as List<SpotMonthResponse>;
          final int? placeId = args['placeId'];

          return MonthlySpotMap(
            year: year,
            month: month,
            spots: spots,
          );
        },
      ),
      GoRoute(
        path: '/${RoutePath.folderDetailBase}/:id',
        builder: (context, state) {
          final folderId = state.pathParameters['id']!;
          final FolderDetailArg args = state.extra as FolderDetailArg;
          return FolderDetailScreen(
              folderId: folderId,
              folderName: args.folderName,
              isDefault: args.isDefault);
        },
      ),
      GoRoute(
        path: RoutePath.travelSpot,
        builder: (context, state) => TravelSpotScreen(),
      ),
      GoRoute(
        path: RoutePath.myReview,
        builder: (context, state) => MyReviewScreen(),
      ),
    ],
  );
}

String _getInitialLocation(LoginNotifier loginNotifier, UserTypeNotifier userTypeNotifier) {
  final loginState = loginNotifier.status;
  final hasUserType = userTypeNotifier.hasType;

  if (loginState == LoginState.loggedIn) {
    if (hasUserType == null) {
      return RoutePath.home; // 기본값
    }
    return hasUserType == false ? RoutePath.home : RoutePath.typeTestStart;
  } else {
    return RoutePath.auth;
  }
}

void _handleLogout(AppRouterRef ref) {
  SecureStorageRepositoryImpl secureStorageRepositoryImpl =
  ref.read(secureStorageRepositoryProvider);
  secureStorageRepositoryImpl.deleteAccessToken();
  secureStorageRepositoryImpl.deleteRefreshToken();
  // TODO: 구글 카카오 애플 로그아웃 추가
}
