import 'package:flutter/material.dart';
import 'package:meal_app/core/themes/app_assets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.onboardingBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
