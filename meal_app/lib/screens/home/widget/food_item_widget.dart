import 'package:flutter/material.dart';
import 'package:meal_app/core/themes/app_assets.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.title,
    required this.rate,
    required this.time,
  });
  final String title;
  final String rate;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      width: 153.w,
      height: 185.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.exampleImage, width: 137.w, height: 106.h),
          SizedBox(height: 8.sp),
          Text(
            title,
            style: AppTextStyling.blackMedium16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primary, size: 16.sp),
                  SizedBox(width: 4.sp),
                  Text(
                    rate,
                    style: AppTextStyling.blackMedium16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_rounded,
                    color: AppColors.primary,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.sp),
                  Text(
                    time,
                    style: AppTextStyling.blackMedium16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
