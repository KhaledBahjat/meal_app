import 'package:go_router/go_router.dart';
import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/screens/home/home_screen.dart';
import 'package:meal_app/screens/on_bording_screen/on_boarding_screen.dart';

class RoutingGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        name: AppRoutes.onBoardingScreen,
        path: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
