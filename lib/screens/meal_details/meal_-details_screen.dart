import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/themes/app_assets.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 359.w,
                      height: 327.h,

                      child: Image.asset(
                        AppAssets.exampleImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 12.h,
                      left: 5.w,
                      child: GestureDetector(
                        onTap: () => GoRouter.of(context).pop(),
                        child: Container(
                          width: 36.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'Cheese Burger 🍔',
                        style: AppTextStyling.headLineTitle.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: 16.sp,
                              ),
                              SizedBox(height: 4.sp),
                              Text(
                                '4.5',
                                style: AppTextStyling.whiteRegular14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.lock_clock,
                                color: AppColors.primary,
                                size: 16.sp,
                              ),
                              SizedBox(height: 4.sp),
                              Text(
                                '30-40',
                                style: AppTextStyling.whiteRegular14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 27.h),
                      Divider(color: Color(0xffEDEDED), thickness: 1.5),
                      SizedBox(height: 24.h),
                      Text(
                        'Description',
                        style: AppTextStyling.blackMedium16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
                        style: AppTextStyling.whiteRegular14.copyWith(
                          color: Color(0xff878787),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
