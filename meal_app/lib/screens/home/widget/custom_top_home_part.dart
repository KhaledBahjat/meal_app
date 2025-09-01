import 'package:flutter/material.dart';
import 'package:meal_app/core/themes/app_assets.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTopHomePartWidget extends StatelessWidget {
  const CustomTopHomePartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackground,
          width: double.infinity,
          height: 270.h,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 18.h,
          left: 24.w,
          child: Container(
            padding: EdgeInsets.all(10.sp),
            width: 195.w,
            height: 186.h,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Welcome\nAdd A New Recipe',
              style: AppTextStyling.headLineTitle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
