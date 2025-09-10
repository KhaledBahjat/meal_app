import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';

class FoodItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function()? onTap;

  const FoodItemWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(), 
                SizedBox(height: 8.sp),
                SizedBox(
                  width: 120.w,
                  child: Text(
                    name,
                    maxLines: 1,
                    style: AppTextStyling.blackMedium16,
                  ),
                ),
                SizedBox(height: 8.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primary, size: 16.sp),
                        SizedBox(width: 4.sp),
                        Text(
                          rate.toString(),
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
                        SizedBox(width: 4.sp),
                        Text(
                         '${ time.toString()} min',
                          style: AppTextStyling.whiteRegular14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
  Widget _buildImage() {
    if (imageUrl.startsWith("http")) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: 137.w,
        height: 106.h,
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red),
      );
    } else {
      return Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
        width: 137.w,
        height: 106.h,
      );
    }
  }
}
