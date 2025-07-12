import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_result_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/home_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_detail_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_edit_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/planner_list_screen.dart';
import 'package:oreum_fe/features/place/presentation/views/tab_screens/planner_detail_tab_screen.dart';
import 'package:oreum_fe/features/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.splash,
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
  ],
);
