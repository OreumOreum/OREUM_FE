import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_result_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
import 'package:oreum_fe/features/course/presentation/views/travel_course_screen.dart';

import 'package:oreum_fe/features/folder/presentation/views/folder_detail_screen.dart';
import 'package:oreum_fe/features/folder/presentation/views/folder_list_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/home_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_detail_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_edit_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_list_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/tab_screens/planner_detail_tab_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/recommend_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/search_screen.dart';
import 'package:oreum_fe/features/setting/presentation/views/account_setting_screen.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_detail.dart';
import 'package:oreum_fe/features/setting/presentation/views/monthly_spot_map.dart';
import 'package:oreum_fe/features/setting/presentation/views/setting_screen.dart';
import 'package:oreum_fe/features/splash/splash_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/create_review_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/review_detail_screen.dart';

import '../../features/setting/presentation/views/monthly_spot_ranking.dart';
import '../constants/monthly_spot.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.reviewDetail,
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
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
    GoRoute(
      path: RoutePath.typeTestResult,
      builder: (context, state) {
        final TravelType travelType = state.extra as TravelType;
        return TypeTestResultScreen(travelType: travelType);
      },
    ),
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: RoutePath.planner,
      builder: (context, state) => PlannerListScreen(),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => PlannerEditScreen(isEdit: false),
        ),

        GoRoute(
          path: ':id/edit',
          builder: (context, state) {
            final String idStr = state.pathParameters['id']!;
            final int id = int.parse(idStr);
            return PlannerEditScreen(isEdit: true, plannerId: id);
          },
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final String idStr = state.pathParameters['id']!;
            final int id = int.parse(idStr);
            return PlannerDetailScreen(plannerId: id);
          },
        ),
      ],
    ),
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
      path: RoutePath.setting,
      builder: (context, state) => SettingScreen(),
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

        return MonthlySpotMap(year: year, month: month);
      },
    ),

    GoRoute(
      path: RoutePath.folderList,
      builder: (context, state) => FolderListScreen(),
    ),
    GoRoute(
      path: RoutePath.folderDetail,
      builder: (context, state) => FolderDetailScreen(),
    ),
  ],
);
