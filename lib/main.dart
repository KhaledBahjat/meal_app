import 'package:flutter/material.dart';
import 'package:meal_app/core/routing/routing_generator.dart';

import 'package:meal_app/screens/on_bording_screen/on_boarding_services/on_boarding_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OnBoardingServices.initializeShaeredPrefs();
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RoutingGenerator.goRouter,
        );
      },
    );
  }
}
