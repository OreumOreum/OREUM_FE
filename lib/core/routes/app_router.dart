import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_result_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
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
  ],
);
