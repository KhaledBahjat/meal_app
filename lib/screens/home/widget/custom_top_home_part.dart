import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/themes/app_assets.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';


class CustomTopHomePartWidget extends StatelessWidget {
  const CustomTopHomePartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackground,
          width: double.infinity,
          height: 270.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 15.w,
          top: 30.h,
          bottom: 30.h,
          child: Container(
            width: 195.w,
            height: 186.h,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,
            child: Text(
              "Welcome Add A New Recipe",
              textAlign: TextAlign.left,
              style: AppTextStyling.headLineTitle,
            ),
          ),
        ),
      ],
    );
  }
}
