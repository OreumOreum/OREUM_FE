import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_result_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_screen.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/home_screen.dart';
import 'package:oreum_fe/features/home/presentation/views/recommend_screen.dart';
import 'package:oreum_fe/features/splash/splash_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/create_review_screen.dart';
import 'package:oreum_fe/features/review/presentation/views/review_detail_screen.dart';

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
  ],
);
