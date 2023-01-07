import 'package:go_router/go_router.dart';
import 'package:mangabox/screen/screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
