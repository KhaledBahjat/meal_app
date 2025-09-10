import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/screens/home/data/model/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

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
                      child: _buildImage(meal.imageUrl), 
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
                        meal.name,
                        textAlign: TextAlign.left,
                        style: AppTextStyling.headLineTitle.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Container(
                        width: 327.w,
                        height: 33.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.primary,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 4.sp),
                                Text(
                                  meal.rate.toString(),
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
                                SizedBox(width: 6.sp),
                                Text(
                                  '${meal.time} min',
                                  style: AppTextStyling.whiteRegular14.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                        meal.description,
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


  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith("http")) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red),
      );
    } else {
      return Image.file(
        File(imageUrl),
        fit: BoxFit.fill,
      );
    }
  }
}
