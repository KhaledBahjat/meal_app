import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/screens/add_meals/add_meals_screen.dart';
import 'package:meal_app/screens/home/home_screen.dart';
import 'package:meal_app/screens/meal_details/meal_-details_screen.dart';
import 'package:meal_app/screens/on_bording_screen/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';

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
      GoRoute(
        name: AppRoutes.addMealsScreen,
        path: AppRoutes.addMealsScreen,
        builder: (context, state) => AddMealsScreen(),
      ),
      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) => MealDetailsScreen(),
      ),
    ],
  );
}
