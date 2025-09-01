import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/core/themes/app_assets.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/screens/on_bording_screen/on_boarding_services/on_boarding_services.dart';
import 'package:meal_app/screens/on_bording_screen/widget/arrow_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our AppThe Best Choice",
    "Our AppYour Ultimate Choice",
  ];
  List<String> subtitles = [
    "Save Your Meals Ingredient",
    "Use Our AppThe Best Choice",
    "Our AppYour Ultimate Choice",
  ];
  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    "the best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];
  double currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (OnBoardingServices.isFirstTime()) {
        OnBoardingServices.setFirstTimeWithFalse();
      } else {
        GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onboardingBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 16.h,
            left: 32.w,
            right: 32.w,
            child: Container(
              width: 311.w,
              height: 410.h,
              padding: EdgeInsets.all(21.sp),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 250.h,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) => setState(() {
                        currentIndex = index.toDouble();
                      }),
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  titles[index],
                                  style: AppTextStyling.headLineTitle,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  textAlign: TextAlign.center,
                                  descriptions[index],
                                  style: AppTextStyling.whiteRegular14,
                                ),
                                SizedBox(height: 8.h),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 5.h),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex,
                    onTap: (position) {
                      carouselController.animateToPage(position.toInt());
                      setState(() {
                        currentIndex = position.toDouble();
                      });
                    },
                    decorator: DotsDecorator(
                      size: Size(24.w, 6.h),
                      activeSize: Size(24.w, 6.h),
                      color: Color(0xffC2C2C2),
                      activeColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  currentIndex >= 2
                      ? ArrowButton()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.homeScreen),
                              child: Text(
                                'Skip',
                                style: AppTextStyling.whiteSemiBold14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                currentIndex < 2
                                    ? currentIndex++
                                    : SizedBox.shrink();
                                carouselController.animateToPage(
                                  currentIndex.toInt(),
                                );
                                setState(() {});
                              },
                              child: Text(
                                'Next',
                                style: AppTextStyling.whiteSemiBold14,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
