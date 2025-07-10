import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/features/auth/presentation/views/auth_screen.dart';
import 'package:oreum_fe/features/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: RoutePath.splash, routes: [
  GoRoute(
    path: RoutePath.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: RoutePath.auth,
    builder: (context, state) => const AuthScreen(),
  ),
]);
